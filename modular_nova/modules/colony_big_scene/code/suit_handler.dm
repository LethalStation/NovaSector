GLOBAL_DATUM(suit_up_controller, /datum/suit_up_controller)

/datum/suit_up_controller

/datum/suit_up_controller/New()
	. = ..()
	RegisterSignal(SSdcs, COMSIG_GLOB_CREWMEMBER_JOINED, .proc/new_colonist)

/datum/suit_up_controller/Destroy(force, ...)
	. = ..()
	UnregisterSignal(SSdcs, COMSIG_GLOB_CREWMEMBER_JOINED)

/datum/suit_up_controller/proc/new_colonist(datum/source, mob/living/new_crewmember, rank)
	SIGNAL_HANDLER

	suit_up_mf(new_crewmember)

/datum/suit_up_controller/proc/suit_up_mf(mob/living/carbon/human/target_player)
	for(var/obj/item/item in target_player.get_equipped_items())
		qdel(item)

	var/obj/item/organ/internal/brain/human_brain = target_player.get_organ_slot(BRAIN)
	human_brain.destroy_all_skillchips()

	var/outfit_to_equip_to_mob = new /datum/outfit/event_colonizer
	target_player.equipOutfit(outfit_to_equip_to_mob)
