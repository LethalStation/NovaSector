// Attachable component intended for any clothing item, to make it functionally equivalent to a plasmoid environment suit
/datum/component/plasmoid_environment_safe
	var/next_extinguish = 0
	/// Time in seconds between each auto-extinguish
	var/extinguish_cooldown = 100
	/// How many extinguishes we have left
	var/extinguishes_left = 5
	/// How many extinguishes we can handle per refill
	var/extinguishes_max = 5

/datum/component/plasmoid_environment_safe/Initialize(cooldown = 100, extinguishes = 5)
	. = ..()

	if (!istype(parent, /obj/item/clothing/under))
		return COMPONENT_INCOMPATIBLE

	extinguish_cooldown = cooldown
	extinguishes_left = extinguishes
	extinguishes_max = extinguishes

	// apply the proper clothing flags
	var/obj/item/clothing/parent_clothing = parent
	parent_clothing.clothing_flags |= PLASMAMAN_PREVENT_IGNITION
	parent_clothing.strip_delay = 80

	RegisterSignal(parent, COMSIG_ATOM_ATTACKBY, PROC_REF(refill_extinguisher))
	RegisterSignal(parent, COMSIG_COMPONENT_REMOVING, PROC_REF(suit_cleanup))
	RegisterSignal(parent, COMSIG_ATOM_EXAMINE, PROC_REF(on_examine))

/datum/component/plasmoid_environment_safe/proc/refill_extinguisher(datum/source, obj/item/inserted_item, mob/living/user, params)
	SIGNAL_HANDLER

	if (istype(inserted_item, /obj/item/extinguisher_refill))
		if (extinguishes_left == extinguishes_max)
			to_chat(user, span_notice("The inbuilt extinguisher is full and doesn't need refilling."))
			return COMPONENT_NO_AFTERATTACK
		else
			extinguishes_left = extinguishes_max
			var/obj/item/parent_item = parent
			to_chat(user, span_notice("You refill the [parent_item.name]'s environmental extinguisher back up to [extinguishes_max] charges, using up the cartridge."))
			qdel(inserted_item)
			return COMPONENT_NO_AFTERATTACK

/datum/component/plasmoid_environment_safe/proc/on_examine(obj/item/source, mob/examiner, list/examine_list)
	SIGNAL_HANDLER

	examine_list += span_notice("This item of clothing has been modified to support plasmoid physiology, and will attempt to extinguish its wearer if they are set on fire once every [extinguish_cooldown] seconds.")
	examine_list += "<br>" + span_notice("There are <b>[extinguishes_left]/[extinguishes_max]</b> extinguisher charges remaining.")
	examine_list += span_notice("You can replenish these charges with any <b>envirosuit extinguisher cartridge</b>, available from most protolathes.")

/datum/component/plasmoid_environment_safe/proc/Extinguish(mob/living/carbon/human/us)
	if (!istype(us))
		return FALSE

	if (us.fire_stacks && extinguishes_left && next_extinguish <= world.time)
		var/obj/item/parent_item = parent
		us.extinguish_mob()

		us.visible_message(span_warning("With a soft hiss, [us]'s [parent_item.name] automatically extinguishes [us.p_them()]!"), span_warning("The systems embedded into your [parent_item.name] automatically extinguish the flames surrounding you."))

		extinguishes_left--
		next_extinguish = world.time + extinguish_cooldown

		new /obj/effect/particle_effect/water(get_turf(us))
		return TRUE

	return FALSE

/datum/component/plasmoid_environment_safe/proc/suit_cleanup()
	SIGNAL_HANDLER

	var/obj/item/clothing/parent_clothing = parent
	parent_clothing.clothing_flags &= ~PLASMAMAN_PREVENT_IGNITION
	parent_clothing.strip_delay = initial(parent_clothing.strip_delay)
