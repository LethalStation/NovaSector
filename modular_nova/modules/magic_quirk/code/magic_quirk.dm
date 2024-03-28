// how much nutrition do we lose
#define MAGIC_NUTRITION_MILD 1.5
#define MAGIC_NUTRITION_MODERATE 2.5
#define MAGIC_NUTRITION_SEVERE 4
#define MAGIC_MANA_REGAIN_TICK 1
#define MAGIC_STAFF_REGEN_PENALTY 0.5

/datum/quirk/magical
	name = "Magical"
	desc = "You've got access to powerful psionics or another kind of force that to basically everybody else, appears outwardly as magic. You can't use guns (ever) but begin play with an assortment of lesser spells fuelled by your mana and nutrition - manage them wisely!"
	gain_text = span_notice("Magical potential floods your nervous system!")
	lose_text = span_notice("Mundanity descends upon you as your magic power flees...")
	value = 10
	quirk_flags = QUIRK_HUMAN_ONLY | QUIRK_PROCESSES
	mob_trait = TRAIT_MAGICALLY_GIFTED
	icon = FA_ICON_MAGIC
	/// The mana value held by the quirk and used to power quirk-only spells.
	var/mana = 100
	/// The maximum possible mana value, in case we want to increase this at any point.
	var/max_mana = 100
	/// The list of spells we've added for cleanup upon quirk removal.
	var/list/added_spells = list()
	/// TimerID for the mana notification alert
	var/mana_notify

/datum/quirk/magical/process(seconds_per_tick)
	var/mob/living/carbon/human/human_holder = quirk_holder
	if (human_holder.stat == DEAD)
		return

	var/regained_mana = FALSE
	//may also wanna put some reagents checking in here so we can have stuff that'll help restore mana quickly
	// like chems or wiz fizz or whatever
	if (mana < max_mana)
		// we're low on mana so regain it!
		regained_mana = TRUE
		if (mana < max_mana*0.3)
			human_holder.adjust_nutrition(-MAGIC_NUTRITION_SEVERE)
			mana += MAGIC_MANA_REGAIN_TICK * 2.5
		else if (mana < max_mana*0.6)
			human_holder.adjust_nutrition(-MAGIC_NUTRITION_MODERATE)
			mana += MAGIC_MANA_REGAIN_TICK * 1.5
		else
			human_holder.adjust_nutrition(-MAGIC_NUTRITION_MILD)
			mana += MAGIC_MANA_REGAIN_TICK

		//ensure we never exceed the max mana from regen
		mana = min(max_mana, mana)
	else
		//clear out the mana timer in case we have it, since we've got full mana now
		if (mana_notify)
			mana_notify_reset()

/datum/quirk/magical/add(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder

	//lesser arcane barrage - costs 25 mana to summon and 2 mana per shot for 30 shots total (85 mana)
	var/datum/action/cooldown/spell/conjure_item/infinite_guns/arcane_barrage/lesser/barrage = new /datum/action/cooldown/spell/conjure_item/infinite_guns/arcane_barrage/lesser()
	barrage.Grant(human_holder)
	added_spells += barrage

	//flameburst - 85 mana upfront normal wizard fireball

	//shift - 35 mana telegram scepter jaunt for 5 tiles instead of 8, up to 3 tiles imprecision depending on flux & mana
	var/datum/action/cooldown/spell/pointed/shift/shift_spell = new /datum/action/cooldown/spell/pointed/shift
	shift_spell.Grant(human_holder)
	added_spells += shift_spell

/datum/quirk/magical/remove()
	QDEL_LIST(added_spells)

/datum/quirk/magical/proc/can_cast_spell(mana_cost)
	if (mana_cost <= mana)
		return TRUE
	else
		return FALSE

/// To be called inside spells/items that should consume mana from the Magical quirk. Deducts mana and calls appropriate checks.
/datum/quirk/magical/proc/cast_quirk_spell(mana_cost)
	mana -= mana_cost
	mana = max(0, mana)
	on_cast_mana_checks()

/datum/quirk/magical/proc/start_mana_notify()
	// Handles starting the mana notification timer.
	var/mob/living/carbon/human/human_holder = quirk_holder
	mana_notify = addtimer(CALLBACK(src, PROC_REF(mana_notify_reset), human_holder), 3 SECONDS, TIMER_STOPPABLE | TIMER_DELETE_ME)

/datum/quirk/magical/proc/mana_notify_reset()
	// Resets the mana notification timer cleanly.
	deltimer(mana_notify)
	mana_notify = null

/datum/quirk/magical/proc/on_cast_mana_checks()
	var/mob/living/carbon/human/human_holder = quirk_holder

	var/half_threshold = max_mana * 0.5
	var/critical_threshold = max_mana * 0.2

	if (!mana_notify)
		// check to see if the player needs to get mana level alerts
		if (mana <= critical_threshold)
			human_holder.balloon_alert(human_holder, "mana critically low!!!")
			start_mana_notify()
		else if (mana <= half_threshold)
			human_holder.balloon_alert(human_holder, "half mana left!")
			start_mana_notify()

	// are we casting on an empty stomach? that's no good.
	switch(human_holder.nutrition)
		if (0 to NUTRITION_LEVEL_STARVING)
			if (rand(3))
				human_holder.adjustStaminaLoss(35)
				human_holder.visible_message(
					span_danger("[human_holder] looks exhausted, breathing heavily!"),
					span_danger("Lacking any calorific reserves, your body struggles with your mana channeling!"),
				)

#undef MAGIC_NUTRITION_MILD
#undef MAGIC_NUTRITION_MODERATE
#undef MAGIC_NUTRITION_SEVERE
#undef MAGIC_MANA_REGAIN_TICK
