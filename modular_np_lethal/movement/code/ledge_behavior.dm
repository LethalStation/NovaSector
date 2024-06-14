#define LEDGE_TRAIT "ledge trait"
#define LEDGE_KEY "ledge_recover"

/// Emulates 'hanging from a ledge', mostly used for chasms and z-level movement behavior.
/// Returns FALSE if the mob falls, returns TRUE if the MOB climbs back up.
/// Call this >AFTER< the mob has been moved onto the problematic turf.
/mob/living/proc/recover_from_ledge(list/unsafe_turfs, channel = 20 SECONDS, channel_cancel = 18 SECONDS, checks)
	if (stat == CONSCIOUS && !IsSleeping() && !IsUnconscious())
		var/turf/the_chasm = get_turf(src)
		var/list/nearby_turfs = the_chasm.reachableAdjacentTurfs(src, null, FALSE)
		var/list/safe_turfs = list()
		if (!unsafe_turfs)
			unsafe_turfs = GLOB.turfs_openspace // initialize with typical openspace turfs if none supplied

		for (var/turf/turf_to_check as anything in nearby_turfs) // attempt to find as many "safe" turfs as possible for us to try and clamber back up from
			if (!locate(turf_to_check) in unsafe_turfs)
				safe_turfs += turf_to_check

		if (LAZYLEN(safe_turfs) >= 1) //we have at least 1 safe turf we can try to grasp onto
			var/turf/salvation = pick(safe_turfs)
			setDir(get_dir(src, salvation))
			Immobilize(channel_cancel) // you get 2 seconds of leeway at the end of the channel to decide if you want to live or die
			visible_message(span_boldwarning("Scrabbling wildly, [src] only barely manages to avoid falling down into [the_chasm], clinging to the edge of [salvation] for dear life!"), span_userdanger("Scrabbling wildly, you grip onto the edge of [salvation] for dear life!"))
			// TODO: do we also want to make them drop their stuff in their hands?
			ADD_TRAIT(src, TRAIT_MOVE_FLYING, LEDGE_TRAIT) // temporary so they don't fall down again
			if (do_after(src, channel, salvation, extra_checks = checks, interaction_key = LEDGE_KEY, max_interact_count = 1))
				forceMove(salvation) // ONLY A HERO CAN SAVE US, I'M NOT GONNA STAND HERE AND WAAAAIITTT
				visible_message(span_warning("[src] clambers up and onto [salvation], exhausted."), span_userdanger("With a final burst of strength, you haul yourself up and over onto [salvation], and promptly collapse into an exhausted heap."))
				StaminaKnockdown(120, paralyze_amount = 5 SECONDS)
				REMOVE_TRAIT(src, TRAIT_MOVE_FLYING, LEDGE_TRAIT)
				return TRUE
			else
				REMOVE_TRAIT(src, TRAIT_MOVE_FLYING, LEDGE_TRAIT)

				if (!pulledby && !locate(src) in salvation)
					forceMove(the_chasm)
					visible_message(span_warning("A look of horror briefly crosses [src]'s features as their grip loosens, then they are gone, falling into [the_chasm]!"), span_userdanger("Your gut lurches in horror as your grip works its way loose, and then you are falling... <i>falling...</i>"))
					return FALSE
				else // save them if they're being pulled by something or someone
					visible_message(span_notice("[pulledby] pulls [src] away from the ledge and into safety!"), span_boldnotice("[pulledby] drags you to safety, and you collapse into a heap, exhausted!"))
					StaminaKnockdown(120, paralyze_amount = 5 SECONDS)
					SetImmobilized(0)
					return TRUE
		else
			to_chat(src, span_userdanger("You find nothing to cling to, and fall..."))
			return FALSE

#undef LEDGE_TRAIT
#undef LEDGE_KEY
