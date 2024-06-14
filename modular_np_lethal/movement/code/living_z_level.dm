// Living entities with this element don't blindly move into z-level changes (most of the time) with some special behaviors
/datum/component/cautious_z_movement
	var/shoved = FALSE
	var/thrown = FALSE

/datum/component/cautious_z_movement/Initialize(...)
	. = ..()
	if (!isliving(parent))
		return COMPONENT_INCOMPATIBLE

	RegisterSignal(parent, COMSIG_LIVING_DISARM_PRESHOVE, PROC_REF(got_shoved))
	RegisterSignal(parent, COMSIG_MOVABLE_PRE_IMPACT, PROC_REF(got_thrown))
	RegisterSignal(parent, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(openspace_movement))

/datum/component/cautious_z_movement/proc/got_shoved()
	SIGNAL_HANDLER
	shoved = TRUE

/datum/component/cautious_z_movement/proc/got_thrown()
	SIGNAL_HANDLER
	thrown = TRUE

/datum/component/cautious_z_movement/proc/reset_forced_movement_vars()
	thrown = FALSE
	shoved = FALSE

/datum/component/cautious_z_movement/proc/allow_movement()
	reset_forced_movement_vars()
	return NONE

/datum/component/cautious_z_movement/proc/disallow_movement()
	reset_forced_movement_vars()
	return COMPONENT_MOVABLE_BLOCK_PRE_MOVE

/datum/component/cautious_z_movement/proc/openspace_movement(mob/living/alive_thing, atom/new_location)
	SIGNAL_HANDLER
	// TODO: we need to account for forced movement somehow
	var/turf/new_loc_turf = get_turf(new_location)
	if (isopenspaceturf(new_loc_turf)) // we're about to lemming off a fucking cliff.
		var/turf/is_it_stairs = GET_TURF_BELOW(new_loc_turf)
		if (is_it_stairs && locate(/obj/structure/stairs) in is_it_stairs) //hey but first does it have stairs? because stairs are good, we like stairs
			return allow_movement()

		if (alive_thing.stat != CONSCIOUS || alive_thing.IsUnconscious() || alive_thing.IsParalyzed() || alive_thing.IsImmobilized() || alive_thing.IsStun() || alive_thing.IsKnockdown() || alive_thing.IsFrozen() || alive_thing.IsSleeping() || shoved || thrown) // you can't do shit, so you're going off the edge
			return allow_movement()

		if (alive_thing.combat_mode) // if you're combat-mode enabled, you'll always move into open space.
			return allow_movement()

		if (ishuman(alive_thing))
			var/mob/living/carbon/human/human_thing = alive_thing
			var/human_dizziness = human_thing.get_timed_status_effect_duration(/datum/status_effect/dizziness)
			var/human_confusion = human_thing.get_timed_status_effect_duration(/datum/status_effect/confusion)
			var/human_drowsiness = human_thing.get_timed_status_effect_duration(/datum/status_effect/drowsiness)
			var/human_drugginess = human_thing.get_timed_status_effect_duration(/datum/status_effect/drugginess)
			var/human_jitteriness = human_thing.get_timed_status_effect_duration(/datum/status_effect/jitter)

			// TODO: captagon really needs to like, always trigger this. check for total reagents being digested?

			if (human_dizziness >= 6 SECONDS)
				human_thing.visible_message(span_warning("Struggling to stay upright, [human_thing] stumbles and tips right over into [new_loc_turf]!"), span_userdanger("The world just won't stop spinning, and it all suddenly gets worse as you topple into [new_loc_turf]!"))
				return allow_movement()

			// Collectively, how rattled is our shit right now?
			var/debilitation = human_confusion + human_drugginess
			if (debilitation >= 12 SECONDS) // if you're rattled, you go down the fucking hole
				human_thing.visible_message(span_warning("Tweaking out of [human_thing.p_their()] mind, [human_thing] steps right off into [new_loc_turf]!"), span_userdanger("Tweaking out of your mind, you step into [new_loc_turf] with reckless abandon!"))
				return allow_movement()

			// Are we really drowsy?
			if (human_drowsiness >= 30 SECONDS)
				human_thing.visible_message(span_warning("Too drowsy to spot the danger, [human_thing] walks straight off into [new_loc_turf]!"), span_userdanger("Thoughts of the sleep you so desperately need cloud your mind, causing you to walk straight off into [new_loc_turf]!"))
				return allow_movement()

			// Are we tweaking off stimulants to a really noticable degree?
			if (human_jitteriness >= 3 MINUTES)
				human_thing.visible_message(span_warning("Unable to contain [human_thing.p_their()] convulsions, [human_thing] totters right off into [new_loc_turf]!"), span_userdanger("Unable to control your jittery convulsions, you totter right off into [new_loc_turf]!"))
				return allow_movement()

		to_chat(alive_thing, span_notice("You keep a safe distance from [new_loc_turf]."))
		return disallow_movement()

/mob/living/carbon/human/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/cautious_z_movement)

/mob/living/silicon/robot/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/cautious_z_movement)
