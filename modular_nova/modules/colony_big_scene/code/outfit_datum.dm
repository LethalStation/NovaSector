/datum/outfit/event_colonizer
	name = "Planetary Colonizer"

	id = /obj/item/card/id/advanced/black
	id_trim = /datum/id_trim/centcom/ert/engineer

	uniform = /obj/item/clothing/under/frontier_colonist
	suit = /obj/item/clothing/suit/jacket/frontier_colonist/short
	suit_store = /obj/item/tank/internals/oxygen/yellow
	back = /obj/item/mod/control/pre_equipped/frontier_colonist
	box = /obj/item/storage/box/survival/engineer
	backpack_contents = list(
		/obj/item/storage/box/nri_flares = 1,
		/obj/item/trench_tool = 1,
	)
	belt = /obj/item/storage/belt/utility/frontier_colonist/stocked
	ears = /obj/item/radio/headset/headset_cargo/mining
	glasses = null
	gloves = /obj/item/clothing/gloves/frontier_colonist
	head = null
	mask = /obj/item/clothing/mask/gas/atmos/frontier_colonist
	neck = null
	shoes = /obj/item/clothing/shoes/jackboots/frontier_colonist
	l_pocket = /obj/item/spess_knife
	r_pocket = /obj/item/storage/bag/ore
	l_hand = null
	r_hand = null
	accessory = null
	internals_slot = ITEM_SLOT_SUITSTORE
	skillchips = list(/obj/item/skillchip/job/engineer)

/datum/outfit/event_colonizer/post_equip(mob/living/carbon/human/human_target, visualsOnly = FALSE)
	var/obj/item/card/id/target_id = human_target.wear_id
	target_id.registered_name = human_target.real_name
	target_id.update_label()
	target_id.update_icon()
	return ..()

/datum/outfit/event_colonizer/pre_equip(mob/living/carbon/human/our_guy, visualsOnly = FALSE)
	. = ..()
	if(our_guy.is_nearsighted())
		glasses = /obj/item/clothing/glasses/regular
	if(our_guy.get_organ_slot(ORGAN_SLOT_LUNGS) == /obj/item/organ/internal/lungs/nitrogen)
		suit_store = /obj/item/tank/internals/nitrogen/full

/obj/item/storage/belt/utility/frontier_colonist/stocked
	preload = FALSE

/obj/item/storage/belt/utility/frontier_colonist/stocked/PopulateContents()
	new /obj/item/screwdriver(src)
	new /obj/item/wrench(src)
	new /obj/item/weldingtool/mini(src)
	new /obj/item/crowbar/red(src)
	new /obj/item/wirecutters(src)
	new /obj/item/multitool(src)
	new /obj/item/stack/cable_coil(src)
