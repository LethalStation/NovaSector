/datum/outfit/event_colonizer
	name = "Planetary Colonizer"

	id = /obj/item/card/id/advanced/chameleon/black
	id_trim = /datum/id_trim/centcom/ert/engineer

	uniform = /obj/item/clothing/under/frontier_colonist
	suit = /obj/item/clothing/suit/jacket/frontier_colonist/short
	suit_store = /obj/item/tank/internals/oxygen/yellow
	back = /obj/item/mod/control/pre_equipped/frontier_colonist
	backpack_contents = list(
		/obj/item/storage/box/colonist_internals = 1,
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
	r_pocket = /obj/item/t_scanner/adv_mining_scanner/lesser
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

/obj/item/storage/box/colonist_internals
	name = "survival box"
	desc = "A box with the bare essentials of ensuring the survival of you and others. This one is labelled to contain an extended-capacity tank."
	illustration = "extendedtank"

/obj/item/storage/box/colonist_internals/PopulateContents()
	new /obj/item/clothing/mask/gas/sechailer/half_mask(src)
	new /obj/item/tank/internals/emergency_oxygen/engi(src)
	new /obj/item/storage/medkit/civil_defense/stocked(src)
	new /obj/item/trench_tool(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/stack/marker_beacon/ten(src)
