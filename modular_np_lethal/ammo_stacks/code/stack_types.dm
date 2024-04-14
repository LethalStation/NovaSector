// Special ammo

// .980 grenades

/obj/item/ammo_casing/c980grenade
	ammo_stack_type = /obj/item/ammo_box/magazine/ammo_stack/c980

/obj/item/ammo_box/magazine/ammo_stack/c980
	name = ".980 Tydhouer grenades"
	desc = "A stack of .980 Tydhouer grenades."
	caliber = CALIBER_980TYDHOUER
	ammo_type = /obj/item/ammo_casing/c980grenade
	casing_phrasing = "shell"
	max_ammo = 6
	casing_x_positions = list(
		-6,
		-3,
		0,
		3,
		6,
	)
	casing_y_padding = 9

// 12ga shotgun shells

/obj/item/ammo_casing/shotgun
	ammo_stack_type = /obj/item/ammo_box/magazine/ammo_stack/s12gauge

/obj/item/ammo_box/magazine/ammo_stack/s12gauge
	name = "12 gauge shells"
	desc = "A stack of 12 gauge shells."
	caliber = CALIBER_SHOTGUN
	ammo_type = /obj/item/ammo_casing/shotgun
	casing_phrasing = "shell"
	max_ammo = 8
	casing_x_positions = list(
		-6,
		-3,
		0,
		3,
		6,
	)
	casing_y_padding = 4

// Pistol ammo

// .35 sol short

/obj/item/ammo_casing/c35sol
	ammo_stack_type = /obj/item/ammo_box/magazine/ammo_stack/c35_sol

/obj/item/ammo_box/magazine/ammo_stack/c35_sol
	name = ".35 Sol Short casings"
	desc = "A stack of .35 Sol Short cartridges."
	caliber = CALIBER_SOL35SHORT
	ammo_type = /obj/item/ammo_casing/c35sol
	max_ammo = 12
	casing_x_positions = list(
		-6,
		-4,
		-2,
		0,
		2,
		4,
		6,
	)
	casing_y_padding = 6

// .27-54 Cesarzowa

/obj/item/ammo_casing/c27_54cesarzowa
	ammo_stack_type = /obj/item/ammo_box/magazine/ammo_stack/c27_54cesarzowa

/obj/item/ammo_box/magazine/ammo_stack/c27_54cesarzowa
	name = ".27-54 Cesarzowa casings"
	desc = "A stack of .27-54 Cesarzowa cartridges."
	caliber = CALIBER_CESARZOWA
	ammo_type = /obj/item/ammo_casing/c27_54cesarzowa
	max_ammo = 18
	casing_x_positions = list(
		-6,
		-4,
		-2,
		0,
		2,
		4,
		6,
	)
	casing_y_padding = 6

// .585 trappiste

/obj/item/ammo_casing/c585trappiste
	ammo_stack_type = /obj/item/ammo_box/magazine/ammo_stack/c585_trappiste

/obj/item/ammo_box/magazine/ammo_stack/c585_trappiste
	name = ".585 Trappiste casings"
	desc = "A stack of .585 Trappiste casings."
	caliber = CALIBER_CESARZOWA
	ammo_type = /obj/item/ammo_casing/c585trappiste
	max_ammo = 6
	casing_x_positions = list(
		-4,
		-2,
		0,
		2,
		4,
	)
	casing_y_padding = 9

// Rifle ammo

// .40 sol long

/obj/item/ammo_casing/c40sol
	ammo_stack_type = /obj/item/ammo_box/magazine/ammo_stack/c40_sol

/obj/item/ammo_box/magazine/ammo_stack/c40_sol
	name = ".40 Sol Long casings"
	desc = "A stack of .40 Sol Long cartridges."
	caliber = CALIBER_SOL40LONG
	ammo_type = /obj/item/ammo_casing/c40sol
	max_ammo = 15
	casing_x_positions = list(
		-6,
		-4,
		-2,
		0,
		2,
		4,
		6,
	)
	casing_y_padding = 6

// .310 strilka

/obj/item/ammo_casing/strilka310
	ammo_stack_type = /obj/item/ammo_box/magazine/ammo_stack/c310_strilka

/obj/item/ammo_box/magazine/ammo_stack/c310_strilka
	name = ".310 Strilka casings"
	desc = "A stack of .310 Strilka cartridges."
	caliber = CALIBER_STRILKA310
	ammo_type = /obj/item/ammo_casing/strilka310
	max_ammo = 5
	casing_x_positions = list(
		-4,
		-2,
		0,
		2,
		4,
	)
	casing_y_padding = 8

// .60 strela

/obj/item/ammo_casing/p60strela
	ammo_stack_type = /obj/item/ammo_box/magazine/ammo_stack/c60_strela

/obj/item/ammo_box/magazine/ammo_stack/c60_strela
	name = ".60 Strela casings"
	desc = "A stack of .60 Strela cartridges."
	caliber = CALIBER_60STRELA
	ammo_type = /obj/item/ammo_casing/p60strela
	max_ammo = 6
	casing_x_positions = list(
		-6,
		-3,
		0,
		3,
		6,
	)
	casing_y_padding = 9
