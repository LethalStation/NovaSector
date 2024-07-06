GLOBAL_LIST_EMPTY(deepmaints_entrances)
GLOBAL_LIST_EMPTY(deepmaints_entrances_filtre)
GLOBAL_LIST_EMPTY(deepmaints_entrances_inborn)
GLOBAL_LIST_EMPTY(deepmaints_entrances_ninja)
GLOBAL_LIST_EMPTY(deepmaints_exits)

/obj/structure/deepmaints_entrance
	name = "heavy hatch"
	desc = "An odd, unmarked hatch that leads to somewhere below it. It looks really old, \
		you get the feeling you shouldn't go through it without being prepared for \
		consequences."
	icon = 'modular_np_lethal/deepmaint_stuff/icons/entrances.dmi'
	icon_state = "hatch"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	anchored = TRUE
	/// How long should it take to travel through this?
	var/travel_time = 10 SECONDS

/obj/structure/deepmaints_entrance/Initialize(mapload)
	. = ..()

	log_to_global_list()

/obj/structure/deepmaints_entrance/examine(mob/user)
	. = ..()
	. += span_engradio("Anything or anyone you are <b>pulling</b> will be taken with you when you go through this.")

/obj/structure/deepmaints_entrance/Destroy()
	remove_from_global_list()

	return ..()

/// Adds the entrance to the global list of entrances
/obj/structure/deepmaints_entrance/proc/log_to_global_list()
	GLOB.deepmaints_entrances += src

/// Removes the entrance from the global list of entrances
/obj/structure/deepmaints_entrance/proc/remove_from_global_list()
	GLOB.deepmaints_entrances -= src

/obj/structure/deepmaints_entrance/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	enter_the_fun_zone(user)

/obj/structure/deepmaints_entrance/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	enter_the_fun_zone(user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/structure/deepmaints_entrance/attackby(obj/item/item, mob/user, params)
	enter_the_fun_zone(user)
	return TRUE

/obj/structure/deepmaints_entrance/attackby_secondary(obj/item/item, mob/user, params)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	enter_the_fun_zone(user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/// Finds a random ladder inside the deepmaints area to send the entree to it
/obj/structure/deepmaints_entrance/proc/enter_the_fun_zone(mob/user)
	if(!in_range(src, user) || DOING_INTERACTION(user, DOAFTER_SOURCE_CLIMBING_LADDER))
		return
	if(!length(GLOB.deepmaints_exits))
		balloon_alert(user, "hatch seems broken...")
		return
	INVOKE_ASYNC(src, PROC_REF(send_him_to_detroit), user)

/// Actually moves the entree passed to it to a random exit
/obj/structure/deepmaints_entrance/proc/send_him_to_detroit(mob/living/carbon/human/user)
	if(!do_after(user, travel_time, target = src))
		return
	var/obj/destination = pick(GLOB.deepmaints_exits)
	if(!destination)
		balloon_alert(user, "hatch seems broken...")
		return
	user.zMove(target = get_turf(destination), z_move_flags = ZMOVE_CHECK_PULLEDBY|ZMOVE_ALLOW_BUCKLED|ZMOVE_INCLUDE_PULLED)
	playsound(src, 'sound/machines/tramopen.ogg', 60, TRUE, frequency = 65000)
	playsound(destination, 'sound/machines/tramclose.ogg', 60, TRUE, frequency = 65000)
	if(HAS_TRAIT(user, TRAIT_INFIL_BUFF))
		user.apply_status_effect(/datum/status_effect/gakster_locked_in)

/obj/structure/deepmaints_entrance/inborn
	name = "one-way heavy hatch"

/obj/structure/deepmaints_entrance/inborn/examine(mob/user)
	. = ..()
	. += span_engradio("You're special, remember? This will be a <b>one-way</b> trip.")

/obj/structure/deepmaints_entrance/inborn/log_to_global_list()
	GLOB.deepmaints_entrances_inborn += src

/obj/structure/deepmaints_entrance/inborn/remove_from_global_list()
	GLOB.deepmaints_entrances_inborn -= src

/obj/structure/deepmaints_entrance/filtre

/obj/structure/deepmaints_entrance/filtre/log_to_global_list()
	GLOB.deepmaints_entrances_filtre += src

/obj/structure/deepmaints_entrance/filtre/remove_from_global_list()
	GLOB.deepmaints_entrances_filtre -= src

/obj/structure/deepmaints_entrance/ninja

/obj/structure/deepmaints_entrance/ninja/log_to_global_list()
	GLOB.deepmaints_entrances_ninja += src

/obj/structure/deepmaints_entrance/ninja/remove_from_global_list()
	GLOB.deepmaints_entrances_ninja -= src

/obj/structure/deepmaints_entrance/exit
	name = "exit ladder"
	desc = "A ladder that leads back to 'civilization' above, though its mighty dark up there... \
		Chances are you might not end up where you entered."
	icon_state = "exit_ladder"
	travel_time = 20 SECONDS

/obj/structure/deepmaints_entrance/exit/log_to_global_list()
	GLOB.deepmaints_exits += src

/obj/structure/deepmaints_entrance/exit/remove_from_global_list()
	GLOB.deepmaints_exits -= src

/obj/structure/deepmaints_entrance/exit/enter_the_fun_zone(mob/user)
	if(!in_range(src, user) || DOING_INTERACTION(user, DOAFTER_SOURCE_CLIMBING_LADDER))
		return
	if(HAS_TRAIT(user, TRAIT_NO_EXTRACT))
		balloon_alert(user, "no going back, not anymore")
		return
	if(HAS_TRAIT(user, TRAIT_EXTRACT_TO_FILTRE_SHIP))
		if(!length(GLOB.deepmaints_entrances_filtre))
			balloon_alert(user, "hatch above seems stuck...")
			return
	else
		if(!length(GLOB.deepmaints_entrances))
			balloon_alert(user, "hatch above seems stuck...")
			return
	INVOKE_ASYNC(src, PROC_REF(send_him_to_detroit), user)

/obj/structure/deepmaints_entrance/exit/send_him_to_detroit(mob/user)
	if(!do_after(user, travel_time, target = src))
		return
	var/obj/destination
	if(HAS_TRAIT(user, TRAIT_EXTRACT_TO_FILTRE_SHIP))
		destination = pick(GLOB.deepmaints_entrances_filtre)
	else if(HAS_TRAIT(user, TRAIT_EXTRACT_TO_NINJA_HIDEOUT))
		destination = pick(GLOB.deepmaints_entrances_ninja)
	else
		destination = pick(GLOB.deepmaints_entrances)
	if(!destination)
		balloon_alert(user, "hatch above seems stuck...")
		return
	user.zMove(target = get_turf(destination), z_move_flags = ZMOVE_CHECK_PULLEDBY|ZMOVE_ALLOW_BUCKLED|ZMOVE_INCLUDE_PULLED)
	playsound(src, 'sound/machines/tramopen.ogg', 60, TRUE, frequency = 65000)
	playsound(destination, 'sound/machines/tramclose.ogg', 60, TRUE, frequency = 65000)

// Buff for gaksters when they first infil

/atom/movable/screen/alert/status_effect/gakster_locked_in
	name = "Locked In"
	desc = "Danger lurks around every corner, keep your weapon close and your eyes open."
	icon_state = "realignment"

/datum/status_effect/gakster_locked_in
	id = "gakster_locked_in"
	duration = 1 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/gakster_locked_in
	remove_on_fullheal = TRUE
	/// The percentage damage modifier we give the mob we're applied to
	var/damage_resistance_addition = 50
	/// How much bleeding is subtracted
	var/bleed_modifier_subtraction = 0.5

/datum/status_effect/gakster_locked_in/on_apply()
	to_chat(owner, span_userdanger("Lock in, danger lurks around every corner."))
	var/mob/living/carbon/human/carbon_owner = owner
	carbon_owner.physiology.damage_resistance += damage_resistance_addition
	carbon_owner.physiology.bleed_mod -= bleed_modifier_subtraction
	return ..()

/datum/status_effect/gakster_locked_in/on_remove()
	to_chat(owner, span_notice("Reality begins to set in, you'll be here for a while. Relax."))
	var/mob/living/carbon/human/carbon_recoverer = owner
	carbon_recoverer.physiology.damage_resistance -= damage_resistance_addition
	carbon_recoverer.physiology.bleed_mod += bleed_modifier_subtraction
	return ..()
