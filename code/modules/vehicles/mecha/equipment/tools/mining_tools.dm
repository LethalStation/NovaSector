
// Drill, Diamond drill, Mining scanner

#define DRILL_BASIC 1
#define DRILL_HARDENED 2


/obj/item/mecha_parts/mecha_equipment/drill
	name = "exosuit drill"
	desc = "Equipment for engineering and combat exosuits. This is the drill that'll pierce the heavens!"
	icon_state = "mecha_drill"
	equip_cooldown = 15
	energy_drain = 10 KILO JOULES
	force = 15
	harmful = TRUE
	range = MECHA_MELEE
	tool_behaviour = TOOL_DRILL
	toolspeed = 0.9
	mech_flags = EXOSUIT_MODULE_WORKING | EXOSUIT_MODULE_COMBAT
	var/drill_delay = 7
	var/drill_level = DRILL_BASIC

/obj/item/mecha_parts/mecha_equipment/drill/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/butchering/mecha, \
	speed = 5 SECONDS, \
	effectiveness = 100, \
	bonus_modifier = null, \
	butcher_sound = null, \
	disabled = TRUE, \
	)
	ADD_TRAIT(src, TRAIT_INSTANTLY_PROCESSES_BOULDERS, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_BOULDER_BREAKER, INNATE_TRAIT)

/obj/item/mecha_parts/mecha_equipment/drill/do_after_checks(atom/target)
	// Gotta be close to the target
	if(!loc.Adjacent(target))
		return FALSE
	// Check if we can still use the equipment & use power for every iteration of do after
	if(!action_checks(target))
		return FALSE
	return ..()

/obj/item/mecha_parts/mecha_equipment/drill/action(mob/source, atom/target, list/modifiers)
	// We can only drill non-space turfs, living mobs and objects.
	if(isspaceturf(target) || !(isliving(target) || isobj(target) || isturf(target)))
		return

	// For whatever reason we can't drill things that acid won't even stick too, and probably
	// shouldn't waste our time drilling indestructible things.
	if(isobj(target))
		var/obj/target_obj = target
		if(target_obj.resistance_flags & (UNACIDABLE | INDESTRUCTIBLE))
			return

	// You can't drill harder by clicking more.
	if(!DOING_INTERACTION_WITH_TARGET(source, target) && do_after_cooldown(target, source, DOAFTER_SOURCE_MECHADRILL))
		target.visible_message(span_warning("[chassis] starts to drill [target]."), \
					span_userdanger("[chassis] starts to drill [target]..."), \
					span_hear("You hear drilling."))

		log_message("Started drilling [target]", LOG_MECHA)

		// Drilling a turf is a one-and-done procedure.
		if(isturf(target))
			// Check if we can even use the equipment to begin with.
			if(!action_checks(target))
				return

			var/turf/T = target
			T.drill_act(src, source)

			return ..()

		// Drilling objects and mobs is a repeating procedure.
		while(do_after_mecha(target, source, drill_delay))
			if(isliving(target))
				drill_mob(target, source)
				playsound(src,'sound/weapons/drill.ogg',40,TRUE)
			else if(isobj(target))
				var/obj/O = target
				if(istype(O, /obj/item/boulder))
					var/obj/item/boulder/nu_boulder = O
					nu_boulder.manual_process(src, source)
				else
					O.take_damage(15, BRUTE, 0, FALSE, get_dir(chassis, target))
				playsound(src,'sound/weapons/drill.ogg', 40, TRUE)

			// If we caused a qdel drilling the target, we can stop drilling them.
			// Prevents starting a do_after on a qdeleted target.
			if(QDELETED(target))
				break

	return ..()

/turf/proc/drill_act(obj/item/mecha_parts/mecha_equipment/drill/drill, mob/user)
	return

/turf/closed/wall/drill_act(obj/item/mecha_parts/mecha_equipment/drill/drill, mob/user)
	if(drill.do_after_mecha(src, user, 60 / drill.drill_level))
		drill.log_message("Drilled through [src]", LOG_MECHA)
		dismantle_wall(TRUE, FALSE)

/turf/closed/wall/r_wall/drill_act(obj/item/mecha_parts/mecha_equipment/drill/drill, mob/user)
	if(drill.drill_level >= DRILL_HARDENED)
		if(drill.do_after_mecha(src, user, 120 / drill.drill_level))
			drill.log_message("Drilled through [src]", LOG_MECHA)
			dismantle_wall(TRUE, FALSE)
	else
		to_chat(user, "[icon2html(src, user)][span_danger("[src] is too durable to drill through.")]")

/turf/closed/mineral/drill_act(obj/item/mecha_parts/mecha_equipment/drill/drill, mob/user)
	for(var/turf/closed/mineral/M in range(drill.chassis,1))
		if(get_dir(drill.chassis,M)&drill.chassis.dir)
			M.gets_drilled()
	drill.log_message("[user] drilled through [src]", LOG_MECHA)
	drill.move_ores()

/turf/open/misc/asteroid/drill_act(obj/item/mecha_parts/mecha_equipment/drill/drill)
	for(var/turf/open/misc/asteroid/M in range(1, drill.chassis))
		if((get_dir(drill.chassis,M) & drill.chassis.dir) && !M.dug)
			M.getDug()
	drill.log_message("Drilled through [src]", LOG_MECHA)
	drill.move_ores()


/obj/item/mecha_parts/mecha_equipment/drill/proc/move_ores()
	if(istype(chassis, /obj/vehicle/sealed/mecha/ripley) && (locate(/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp) in chassis.flat_equipment))
		var/obj/vehicle/sealed/mecha/ripley/R = chassis //we could assume that it's a ripley because it has a clamp, but that's ~unsafe~ and ~bad practice~
		R.collect_ore()

/obj/item/mecha_parts/mecha_equipment/drill/proc/drill_mob(mob/living/target, mob/living/user)
	target.visible_message(span_danger("[chassis] is drilling [target] with [src]!"), \
						span_userdanger("[chassis] is drilling you with [src]!"))
	log_combat(user, target, "drilled", "[name]", "Combat mode: [user.combat_mode ? "On" : "Off"])(DAMTYPE: [uppertext(damtype)])")
	if(target.stat == DEAD && target.getBruteLoss() >= (target.maxHealth * 2))
		log_combat(user, target, "gibbed", name)
		if(LAZYLEN(target.butcher_results) || LAZYLEN(target.guaranteed_butcher_results))
			SEND_SIGNAL(src, COMSIG_MECHA_DRILL_MOB, chassis, target)
		else
			target.investigate_log("has been gibbed by [src] (attached to [chassis]).", INVESTIGATE_DEATHS)
			target.gib(DROP_ALL_REMAINS)
	else
		//drill makes a hole
		var/obj/item/bodypart/target_part = target.get_bodypart(target.get_random_valid_zone(BODY_ZONE_CHEST))
		target.apply_damage(10, BRUTE, BODY_ZONE_CHEST, target.run_armor_check(target_part, MELEE))

		//blood splatters
		var/splatter_dir = get_dir(chassis, target)
		if(isalien(target))
			new /obj/effect/temp_visual/dir_setting/bloodsplatter/xenosplatter(target.drop_location(), splatter_dir)
		else
			new /obj/effect/temp_visual/dir_setting/bloodsplatter(target.drop_location(), splatter_dir)

		//organs go everywhere
		if(target_part && prob(10 * drill_level))
			target_part.dismember(BRUTE)

/obj/item/mecha_parts/mecha_equipment/drill/diamonddrill
	name = "diamond-tipped exosuit drill"
	desc = "Equipment for engineering and combat exosuits. This is an upgraded version of the drill that'll pierce the heavens!"
	icon_state = "mecha_diamond_drill"
	equip_cooldown = 10
	drill_delay = 4
	drill_level = DRILL_HARDENED
	force = 15
	toolspeed = 0.7


/obj/item/mecha_parts/mecha_equipment/mining_scanner
	name = "exosuit mining scanner"
	desc = "Equipment for working exosuits. It will automatically check surrounding rock for useful minerals."
	icon_state = "mecha_analyzer"
	equip_cooldown = 1.5 SECONDS
	equipment_slot = MECHA_UTILITY
	mech_flags = EXOSUIT_MODULE_WORKING
	var/scanning_time = 0
	COOLDOWN_DECLARE(area_scan_cooldown)

/obj/item/mecha_parts/mecha_equipment/mining_scanner/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSfastprocess, src)

/obj/item/mecha_parts/mecha_equipment/mining_scanner/process()
	if(!loc)
		STOP_PROCESSING(SSfastprocess, src)
		qdel(src)
	if(scanning_time > world.time)
		return
	if(!chassis || !ismecha(loc))
		return
	if(!LAZYLEN(chassis.occupants))
		return
	scanning_time = world.time + equip_cooldown
	mineral_scan_pulse(get_turf(src), scanner = src)

/obj/item/mecha_parts/mecha_equipment/mining_scanner/get_snowflake_data()
	return list(
		"snowflake_id" = MECHA_SNOWFLAKE_ID_ORE_SCANNER,
		"cooldown" = COOLDOWN_TIMELEFT(src, area_scan_cooldown),
	)

/obj/item/mecha_parts/mecha_equipment/mining_scanner/handle_ui_act(action, list/params)
	switch(action)
		if("area_scan")
			if(!COOLDOWN_FINISHED(src, area_scan_cooldown))
				return FALSE
			COOLDOWN_START(src, area_scan_cooldown, 15 SECONDS)
			for(var/mob/living/carbon/human/driver in chassis.return_drivers())
				for(var/obj/structure/ore_vent/vent as anything in range(5, chassis))
					if(istype(vent, /obj/structure/ore_vent))
						vent.scan_and_confirm(driver, TRUE)
			return TRUE

#undef DRILL_BASIC
#undef DRILL_HARDENED
