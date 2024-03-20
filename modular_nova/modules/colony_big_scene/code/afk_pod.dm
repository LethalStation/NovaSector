/obj/machinery/safe_afk_pod
	name = "cryostasis pod"
	desc = "A large pod that (most) crew can fit comfortably inside of. \
		Contains a stable atmosphere, a stasis field, and the ability to slowly \
		repair injury to any occupants. The preferred method of sleeping on the frontier \
		where the wall can explode without warning and the air can go bad in your sleep."
	icon = 'modular_nova/modules/colony_big_scene/icons/afk_pod.dmi'
	icon_state = "safepod"
	base_icon_state = "safepod"
	max_integrity = 300
	obj_flags = BLOCKS_CONSTRUCTION | NO_DECONSTRUCTION
	circuit = null
	state_open = TRUE
	/// The contents of the gas to be distributed to an occupant. Set in Initialize()
	var/datum/gas_mixture/air_contents = null

/obj/machinery/safe_afk_pod/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_MACHINERY_POWER_LOST, PROC_REF(on_power_loss))
	refresh_air()

/obj/machinery/safe_afk_pod/Destroy()
	if(air_contents)
		QDEL_NULL(air_contents)
	return ..()

/obj/machinery/safe_afk_pod/return_air()
	refresh_air()
	return air_contents

/obj/machinery/safe_afk_pod/remove_air(amount)
	refresh_air()
	return air_contents.remove(amount)

/obj/machinery/safe_afk_pod/return_analyzable_air()
	refresh_air()
	return air_contents

/// Creates atmosphere inside the pod that most people will likely be able to breathe
/obj/machinery/safe_afk_pod/proc/refresh_air()
	air_contents = null
	air_contents = new(50) //liters
	air_contents.temperature = T20C

	air_contents.assert_gases(/datum/gas/oxygen, /datum/gas/nitrogen)
	air_contents.gases[/datum/gas/oxygen][MOLES] = (ONE_ATMOSPHERE*50)/(R_IDEAL_GAS_EQUATION*T20C) * O2STANDARD
	air_contents.gases[/datum/gas/nitrogen][MOLES] = (ONE_ATMOSPHERE*50)/(R_IDEAL_GAS_EQUATION*T20C) * N2STANDARD

/obj/machinery/safe_afk_pod/examine(mob/user)
	. = ..()

	. += span_notice("<b>Drag</b> yourself into the pod to enter it.")
	. += span_notice("It has limited resuscitation capabilities. Remaining in the pod can heal some injuries.")
	. += span_notice("It can be <b>pried</b> open with a <b>crowbar</b> in case of emergency.")

	if(isnull(occupant))
		. += span_notice("It is currently <b>unoccupied</b>.")
		return

	. += span_notice("It is currently <b>occupied</b> by [occupant].")

/obj/machinery/safe_afk_pod/update_icon_state()
	if(!is_operational)
		icon_state = base_icon_state
		return ..()

	if(state_open)
		icon_state = base_icon_state + "_open_active"
		return ..()

	icon_state = base_icon_state + "_closed"
	if(occupant)
		icon_state += "_active"

	return ..()

/obj/machinery/safe_afk_pod/MouseDrop_T(mob/target, mob/user)
	var/mob/living/carbon/player = user
	if(!iscarbon(player) || !Adjacent(player) || !ISADVANCEDTOOLUSER(player) || !is_operational || !state_open)
		return

	if(player.buckled || HAS_TRAIT(player, TRAIT_HANDS_BLOCKED))
		return

	close_machine(target)

/obj/machinery/safe_afk_pod/crowbar_act(mob/living/user, obj/item/tool)
	if(user.combat_mode)
		attack_hand(user)
		return ITEM_INTERACT_SUCCESS

	if(default_pry_open(tool, user))
		return ITEM_INTERACT_SUCCESS

/obj/machinery/safe_afk_pod/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	if(!state_open && user == occupant)
		container_resist_act(user)

/obj/machinery/safe_afk_pod/Exited(atom/movable/gone, direction)
	. = ..()
	if(!state_open && gone == occupant)
		container_resist_act(gone)

/obj/machinery/safe_afk_pod/relaymove(mob/living/user, direction)
	if(!state_open)
		container_resist_act(user)

/obj/machinery/safe_afk_pod/container_resist_act(mob/living/user)
	user.visible_message(span_notice("[occupant] emerges from [src]!"),
		span_notice("You climb out of [src]!"),
		span_notice("With a hiss, you hear a machine opening."))
	open_machine()

/obj/machinery/safe_afk_pod/open_machine(drop = TRUE, density_to_set = FALSE)
	playsound(src, 'sound/machines/tramopen.ogg', 60, TRUE, frequency = 65000)
	flick("[base_icon_state]_opening", src)
	update_use_power(IDLE_POWER_USE)
	SEND_SIGNAL(src, COMSIG_BITRUNNER_NETPOD_OPENED)
	var/mob/living/living_occupant = occupant
	living_occupant.remove_status_effect(/datum/status_effect/grouped/stasis, STASIS_MACHINE_EFFECT)
	REMOVE_TRAIT(living_occupant, TRAIT_TUMOR_SUPPRESSED, TRAIT_GENERIC)
	REMOVE_TRAIT(living_occupant, TRAIT_ANALGESIA, TRAIT_GENERIC)
	return ..()

/obj/machinery/safe_afk_pod/close_machine(mob/user, density_to_set = TRUE)
	if(!state_open || !is_operational || !iscarbon(user))
		return

	playsound(src, 'sound/machines/tramclose.ogg', 60, TRUE, frequency = 65000)
	flick("[base_icon_state]_closing", src)
	..()
	add_healing(occupant)

/obj/machinery/safe_afk_pod/default_pry_open(obj/item/crowbar, mob/living/pryer)
	if(isnull(occupant) || !iscarbon(occupant))
		if(!state_open)
			if(panel_open)
				return FALSE
			open_machine()
		else
			shut_pod()

		return TRUE

	pryer.visible_message(
		span_danger("[pryer] starts prying open [src]!"),
		span_notice("You start to pry open [src]."),
		span_notice("You hear loud prying on metal.")
	)
	playsound(src, 'sound/machines/airlock_alien_prying.ogg', 100, TRUE)

	if(do_after(pryer, 15 SECONDS, src))
		if(!state_open)
			open_machine()

	return TRUE

/// Puts the occupant in netpod stasis, basically short-circuiting environmental conditions
/obj/machinery/safe_afk_pod/proc/add_healing(mob/living/target)
	if(target != occupant)
		return

	target.AddComponent(/datum/component/netpod_healing, pod = src)
	target.playsound_local(src, 'sound/effects/submerge.ogg', 20, vary = TRUE)
	target.extinguish_mob()
	target.apply_status_effect(/datum/status_effect/grouped/stasis, STASIS_MACHINE_EFFECT)
	ADD_TRAIT(target, TRAIT_TUMOR_SUPPRESSED, TRAIT_GENERIC)
	ADD_TRAIT(target, TRAIT_ANALGESIA, TRAIT_GENERIC)
	update_use_power(ACTIVE_POWER_USE)

/// Boots out anyone in the machine && opens it
/obj/machinery/safe_afk_pod/proc/on_power_loss(datum/source)
	SIGNAL_HANDLER

	if(state_open)
		return

	if(isnull(occupant))
		open_machine()
		return

/// Closes the machine without shoving in an occupant
/obj/machinery/safe_afk_pod/proc/shut_pod()
	state_open = FALSE
	playsound(src, 'sound/machines/tramclose.ogg', 60, TRUE, frequency = 65000)
	flick("[base_icon_state]_closing", src)
	set_density(TRUE)

	update_appearance()

// Packed version used for creating these

/obj/item/flatpacked_machine/afk_pod
	name = "cryostasis pod parts kit"
	icon = 'modular_nova/modules/colony_big_scene/icons/afk_pod.dmi'
	icon_state = "safepod_packed"
	type_to_deploy = /obj/machinery/safe_afk_pod
	custom_materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT,
	)
