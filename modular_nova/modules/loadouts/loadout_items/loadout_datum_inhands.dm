/*
*	LOADOUT ITEM DATUMS FOR BOTH HAND SLOTS
*/

/// Inhand items (Moves overrided items to backpack)
GLOBAL_LIST_INIT(loadout_inhand_items, generate_loadout_items(/datum/loadout_item/inhand))

/datum/loadout_item/inhand
	category = LOADOUT_ITEM_INHAND

/datum/loadout_item/inhand/pre_equip_item(datum/outfit/outfit, datum/outfit/outfit_important_for_life, mob/living/carbon/human/equipper, visuals_only = FALSE)
	// if no hands are available then put in backpack
	if(initial(outfit_important_for_life.r_hand) && initial(outfit_important_for_life.l_hand))
		if(!visuals_only)
			LAZYADD(outfit.backpack_contents, item_path)
		return TRUE

/datum/loadout_item/inhand/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(outfit.l_hand && !outfit.r_hand)
		outfit.r_hand = item_path
	else
		if(outfit.l_hand)
			LAZYADD(outfit.backpack_contents, outfit.l_hand)
		outfit.l_hand = item_path

/datum/loadout_item/inhand/cane
	name = "Cane"
	item_path = /obj/item/cane

/datum/loadout_item/inhand/cane/crutch
	name = "Crutch"
	item_path = /obj/item/cane/crutch

/datum/loadout_item/inhand/cane/white
	name = "White Cane"
	item_path = /obj/item/cane/white

/datum/loadout_item/inhand/briefcase
	name = "Briefcase"
	item_path = /obj/item/storage/briefcase

/datum/loadout_item/inhand/briefcase_secure
	name = "Secure Briefcase"
	item_path = /obj/item/storage/briefcase/secure

/datum/loadout_item/inhand/guncase_large
	name = "Black Empty Gun Case (Large)"
	item_path = /obj/item/storage/toolbox/guncase/nova/empty

/datum/loadout_item/inhand/guncase_large/yellow
	name = "Yellow Empty Gun Case (Large)"
	item_path = /obj/item/storage/toolbox/guncase/nova/carwo_large_case/empty

/datum/loadout_item/inhand/guncase_small
	name = "Black Empty Gun Case (Small)"
	item_path = /obj/item/storage/toolbox/guncase/nova/pistol/empty

/datum/loadout_item/inhand/skub
	name = "Skub"
	item_path = /obj/item/skub

/datum/loadout_item/inhand/skateboard
	name = "Skateboard"
	item_path = /obj/item/melee/skateboard

/datum/loadout_item/inhand/pet/post_equip_item(datum/preferences/preference_source, mob/living/carbon/human/equipper)
	var/obj/item/clothing/head/mob_holder/pet/equipped_pet = locate(item_path) in equipper.get_all_gear()
	equipped_pet.held_mob.befriend(equipper)
