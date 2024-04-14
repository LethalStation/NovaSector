/obj/machinery/vending/wallmed/epic_loot
	name = "\improper SuperSupply ™"
	desc = "Wall-mounted dispenser filled with bullets and basic medical supplies."
	icon_state = "wallmed"
	icon_deny = "wallmed-deny"
	panel_type = "wallmed-panel"
	density = FALSE
	flags_1 = NO_DECONSTRUCTION
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	product_categories = list(
		list(
			"name" = "Medical",
			"icon" = "suitcase-medical",
			"products" = list(
				/obj/item/healthanalyzer/simple = INFINITY,
				/obj/item/stack/medical/bandage/makeshift = INFINITY,
				/obj/item/stack/medical/gauze/improvised = INFINITY,
				/obj/item/stack/medical/bruise_pack = INFINITY,
				/obj/item/stack/medical/ointment = INFINITY,
				/obj/item/stack/medical/bone_gel = INFINITY,
				/obj/item/stack/sticky_tape/surgical = INFINITY,
				/obj/item/reagent_containers/hypospray/medipen/ekit = INFINITY,
			),
		),
		list(
			"name" = "Ammunition",
			"icon" = "person-rifle"
			"products" = list(
				/obj/item/ammo_box/magazine/ammo_stack/c980/prefilled = INFINITY,
				/obj/item/ammo_box/magazine/ammo_stack/s12gauge/prefilled/buckshot = INFINITY,
				/obj/item/ammo_box/magazine/ammo_stack/c35_sol/prefilled = INFINITY,
				/obj/item/ammo_box/magazine/ammo_stack/c27_54cesarzowa/prefilled = INFINITY,
				/obj/item/ammo_box/magazine/ammo_stack/c585_trappiste/prefilled = INFINITY,
				/obj/item/ammo_box/magazine/ammo_stack/c40_sol/prefilled = INFINITY,
				/obj/item/ammo_box/magazine/ammo_stack/c310_strilka/prefilled = INFINITY,
				/obj/item/ammo_box/magazine/ammo_stack/c60_strela/prefilled = INFINITY,
			),
		),
	)
	contraband = list()
	refill_canister = /obj/item/vending_refill/wallmed
	default_price = 0
	extra_price = 0
	onstation = FALSE

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/vending/wallmed/epic_loot, 32)

/obj/machinery/vending/wallmed/epic_loot/Initialize(mapload)
	. = ..()
	onstation = FALSE
