/datum/species/plasmaman
	name = "\improper Plasmoid"
	/// Reference to our innate plasma fixation process (very jank)
	var/datum/symptom/heal/plasma/innate_fixation
	/// Scrungly internal 'advanced disease' that we don't actually have to make shit work like it should
	var/datum/disease/advance/internal_disease

/datum/species/plasmaman/on_species_gain(mob/living/carbon/human/human_who_gained_species, datum/species/old_species, pref_load)
	. = ..()
	// herculean, comical levels of jank. we create a "dummy" plasma fixation symptom and a dummy disease it requires to function and associate them w/ the species datum
	// later, we'll call the innate_fixation plasma fixation procs to mimic the behavior of the disease without ever having it, or a disease in the first place
	innate_fixation = new
	internal_disease = new
	internal_disease.affected_mob = human_who_gained_species

/datum/species/plasmaman/on_species_loss(mob/living/carbon/human/plasmoid, datum/species/new_species, pref_load)
	. = ..()

	internal_disease.affected_mob = null
	QDEL_NULL(innate_fixation)
	QDEL_NULL(internal_disease)

/datum/species/plasmaman/spec_life(mob/living/carbon/human/us, seconds_per_tick, times_fired)
	. = ..()

	if (us.fire_stacks)
		// check to see if our underlayer has our custom envirosuit component
		var/obj/item/clothing/under/underlayer = us.w_uniform
		if (underlayer)
			var/datum/component/plasmoid_environment_safe/enviro = underlayer.GetComponent(/datum/component/plasmoid_environment_safe)
			if (enviro && enviro.Extinguish(us))
				internal_fire = FALSE

	if (innate_fixation && (us.health < us.maxHealth))
		var/base_plasma_healing = innate_fixation.CanHeal(internal_disease) * seconds_per_tick
		var/digesting_plasma = us.reagents.has_reagent(/datum/reagent/toxin/plasma, needs_metabolizing = TRUE)
		var/pre_temperature = us.bodytemperature

		// we heal by CONSUMING plasma, so if we're hurt, use more of our consumed plasma, and if we can't breathe it, then we get a LOT less benefit
		// unless we're digesting some plasma reagent, then we're golden (don't use any internals)
		if ((us.losebreath > 0 || us.getOxyLoss() > 0) && !digesting_plasma && base_plasma_healing > 0) // not breathing good and not digesting plasma to cover the loss
			base_plasma_healing /= 4
		if (!us.losebreath && !digesting_plasma && prob(35)) // breathing okay but we're not digesting plasma, so breathe more (on average)
			us.breathe() // normal breath: every 4 ticks. prob jank this so we don't use 4-5x as much plasma (we want about double on average, spikes are okay)

		innate_fixation.Heal(us, internal_disease, base_plasma_healing)

		// plasma fixation also attempts to regulate our temperature too, and if we did this, we should use more plasma again (especially if we're doing it a lot)
		var/post_temperature = us.bodytemperature
		if (!digesting_plasma && abs(post_temperature - pre_temperature) >= 10 && prob(20))
			// had a significant temperature shift, so breathe again maybe
			us.breathe()

		if (digesting_plasma) // digesting plasma REALLY juices our healing rate so let's purge some so we can't load up on 50u and be nearly invulnerable for like 3 minutes
			us.reagents.remove_reagent(/datum/reagent/toxin/plasma, 0.8 * REM * seconds_per_tick)

// BODYPART ADJUSTMENTS
// 50% increased brute/burn is silly and we don't do that any more
// especially now that they face the existential horror of suffocating to death if they get too damaged too frequently
// the species weakness to BODY TEMPERATURE remains however

/obj/item/bodypart/head/plasmaman
	brute_modifier = 1
	burn_modifier = 1
	head_flags = HEAD_ALL_FEATURES
	icon_greyscale = BODYPART_ICON_HUMAN

/obj/item/bodypart/chest/plasmaman
	brute_modifier = 1
	burn_modifier = 1
	icon_greyscale = BODYPART_ICON_HUMAN

/obj/item/bodypart/arm/left/plasmaman
	brute_modifier = 1
	burn_modifier = 1
	icon_greyscale = BODYPART_ICON_HUMAN

/obj/item/bodypart/arm/right/plasmaman
	brute_modifier = 1
	burn_modifier = 1
	icon_greyscale = BODYPART_ICON_HUMAN

/obj/item/bodypart/leg/left/plasmaman
	brute_modifier = 1
	burn_modifier = 1
	icon_greyscale = BODYPART_ICON_HUMAN

/obj/item/bodypart/leg/right/plasmaman
	brute_modifier = 1
	burn_modifier = 1
	icon_greyscale = BODYPART_ICON_HUMAN
