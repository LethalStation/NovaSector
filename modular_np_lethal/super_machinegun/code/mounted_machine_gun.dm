/obj/machinery/deployable_turret/holds_gun
	/// The gun we store and reference
	var/obj/item/gun/stored_gun
	/// If we should spawn a gun in this on roundstart and if so, what type
	var/obj/item/gun/spawn_gun

/obj/machinery/deployable_turret/holds_gun/Initialize(mapload)
	. = ..()
	if(spawn_gun)
		stored_gun = new spawn_gun(src)

/// Undeploying, for when you want to move your big dakka around
/obj/machinery/deployable_turret/holds_gun/wrench_act(mob/living/user, obj/item/wrench/used_wrench)
	if(!can_be_undeployed)
		return ITEM_INTERACT_SKIP_TO_ATTACK
	if(!ishuman(user))
		return ITEM_INTERACT_SKIP_TO_ATTACK
	used_wrench.play_tool_sound(user)
	user.balloon_alert(user, "undeploying...")
	if(!do_after(user, undeploy_time))
		return ITEM_INTERACT_BLOCKING
	if(!user.put_in_hands(stored_gun))
		stored_gun.forceMove(loc)
	qdel(src)
	return ITEM_INTERACT_SUCCESS

/obj/machinery/deployable_turret/holds_gun/direction_track(mob/user, atom/targeted)
	if(user.incapacitated())
		return
	setDir(get_dir(src,targeted))
	user.setDir(dir)
	switch(dir)
		if(NORTH)
			layer = BELOW_MOB_LAYER
			user.pixel_x = 0
			user.pixel_y = -14
		if(NORTHEAST, EAST, SOUTHEAST)
			layer = ABOVE_MOB_LAYER
			user.pixel_x = -14
			user.pixel_y = 0
		if(SOUTH)
			layer = ABOVE_MOB_LAYER
			user.pixel_x = 0
			user.pixel_y = 14
		if(SOUTHWEST, WEST, NORTHWEST)
			layer = ABOVE_MOB_LAYER
			user.pixel_x = 14
			user.pixel_y = 0

/obj/machinery/deployable_turret/holds_gun/checkfire(atom/targeted_atom, mob/user)
	target = targeted_atom
	if(target == user || user.incapacitated() || target == get_turf(src))
		return
	stored_gun.afterattack(target, user)

/// Test turrets with pre-filled guns

/obj/machinery/deployable_turret/holds_gun/bren
	spawn_gun = /obj/item/gun/ballistic/automatic/sol_rifle/machinegun
