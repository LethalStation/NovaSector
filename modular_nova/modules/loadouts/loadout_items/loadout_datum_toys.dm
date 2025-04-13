/datum/loadout_category/toys
	category_name = "Toys"
	category_ui_icon = FA_ICON_TROPHY
	type_to_generate = /datum/loadout_item/toys
	tab_order = /datum/loadout_category/inhands::tab_order + 1
	/// How many toys are allowed at maximum.
	VAR_PRIVATE/max_allowed = 2


/datum/loadout_category/toys/New()
	. = ..()
	category_info = "([max_allowed] allowed)"

/datum/loadout_category/toys/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	var/list/datum/loadout_item/toys/other_toys = list()
	for(var/datum/loadout_item/toys/other_toy in all_loadout_items)
		other_toys += other_toy

	if(length(other_toys) >= max_allowed)
		// We only need to deselect something if we're above the limit
		// (And if we are we prioritize the first item found, FIFO)
		manager.deselect_item(other_toys[1])
	return TRUE



/datum/loadout_item/toys
	abstract_type = /datum/loadout_item/toys

/*
*	GUNS & OTHER TOYS
*/

/datum/loadout_item/toys/pre_equip_item(datum/outfit/outfit, datum/outfit/outfit_important_for_life, mob/living/carbon/human/equipper, visuals_only = FALSE)  // these go in the backpack
	return FALSE

/datum/loadout_item/toys/shotgun
	name = "Double Barrel Shotgun"
	item_path = /obj/item/gun/ballistic/shotgun/doublebarrel

/datum/loadout_item/toys/revolver
	name = "Eland Revolver"
	item_path = /obj/item/gun/ballistic/revolver/sol

/datum/loadout_item/toys/plasmagun
	name = "'Słońce' Plasma Projector"
	item_path = /obj/item/gun/ballistic/automatic/pistol/plasma_thrower

/datum/loadout_item/toys/c4
	name = "Block of C4"
	item_path = /obj/item/grenade/c4

/datum/loadout_item/toys/flashbang
	name = "Flashbang"
	item_path = /obj/item/grenade/flashbang

/datum/loadout_item/toys/smokegrenade
	name = "Smoke Grenade"
	item_path = /obj/item/grenade/smokebomb

/datum/loadout_item/toys/stingbang
	name = "Stingbang"
	item_path = /obj/item/grenade/stingbang

/datum/loadout_item/toys/improvisedbomb
	name = "Improvised Bomb"
	item_path = /obj/item/grenade/iedcasing/spawned

/*
*	TOOLS
*/

/datum/loadout_item/toys/welder
	name = "Industrial Welder"
	item_path = /obj/item/weldingtool/hugetank

/datum/loadout_item/toys/prybar
	name = "Prybar"
	item_path = /datum/design/colony_door_crowbar

/datum/loadout_item/toys/toolbox
	name = "Full Toolbox"
	item_path = /obj/item/storage/toolbox/mechanical

/*
*	MEDICAL ITEMS
*/
/datum/loadout_item/toys/medkit
	name = "First-Aid Kit"
	item_path = /obj/item/storage/medkit/regular

/datum/loadout_item/toys/deforest_cheesekit
	name = "Civil Defense Medical Kit"
	item_path = /obj/item/storage/medkit/civil_defense/stocked

/datum/loadout_item/toys/deforest_frontiermedkit
	name = "Frontier Medical Kit"
	item_path = /obj/item/storage/medkit/frontier/stocked

/datum/loadout_item/toys/synthetic_medkit
	name = "Robotic Repair Equipment Kit"
	item_path = /obj/item/storage/medkit/robotic_repair/stocked

/*
*	misc
*/

/datum/loadout_item/toys/cash
	name = "One Hundred Credit Loan (to be collected later)"
	item_path = /obj/item/lethalcash/bundle/c100
