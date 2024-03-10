GLOBAL_DATUM(suit_up_controller, /datum/suit_up_controller)

// Makes a new suit up controller datum for equipping every newly spawned player and nothing else
/datum/controller/subsystem/processing/dcs/Initialize()
	GLOB.suit_up_controller = new /datum/suit_up_controller

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

	var/obj/item/organ/internal/brain/human_brain = target_player.getorganslot(BRAIN)
	human_brain.destroy_all_skillchips()

	var/outfit_to_equip_to_mob = new /datum/outfit/event_colonizer
	target_player.equipOutfit(outfit_to_equip_to_mob)
