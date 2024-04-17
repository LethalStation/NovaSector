// 12mm chinmoku, slow bullets for use with suppressed weapons

/obj/item/ammo_casing/c12chinmoku
	name = "12mm Chinmoku lethal bullet casing"
	desc = "A modified .40 sol long bullet, with larger projectile and less powder to make it subsonic \
		Made for use in modified sol rifle magazines."

	icon = 'modular_np_lethal/lethalguns/icons/ammo.dmi'
	icon_state = "chinmoku"

	caliber = CALIBER_12MMCHINMOKU
	projectile_type = /obj/projectile/bullet/c12chinmoku

/obj/projectile/bullet/c12chinmoku
	name = "12mm Chinmoku bullet"
	damage = 50
	spread = 2

	wound_bonus = 10
	bare_wound_bonus = 20

	wound_falloff_tile = 1
	damage_falloff_tile = 3
	speed = 1.5

/obj/item/ammo_box/magazine/ammo_stack/c12chinmoku
	name = "12mm Chinmoku casings"
	desc = "A stack of 12mm Chinmoku cartridges."
	caliber = CALIBER_12MMCHINMOKU
	ammo_type = /obj/item/ammo_casing/c12chinmoku
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

/obj/item/ammo_box/magazine/ammo_stack/c12chinmoku/prefilled
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/c12chinmoku/prefilled/special
	ammo_type = /obj/item/ammo_casing/c12chinmoku/special

/obj/item/ammo_box/magazine/ammo_stack/c12chinmoku/prefilled/tracer
	ammo_type = /obj/item/ammo_casing/c12chinmoku/tracer

// Chinmoku "special", with armor piercing but more damage falloff

/obj/item/ammo_casing/c12chinmoku/special
	name = "12mm Chinmoku 'special' bullet casing"
	desc = "A modified .40 sol long bullet, with larger projectile and less powder to make it subsonic \
		Made for use in modified sol rifle magazines. \
		This is a special purpose version for the penetration of heavy armor, though it has harder damage falloff."

	icon_state = "chinmoku_special"

	projectile_type = /obj/projectile/bullet/c12chinmoku/special

/obj/projectile/bullet/c12chinmoku/special
	name = "12mm Chinmoku 'special' bullet"
	damage = 50
	armour_penetration = 30
	spread = 4

	wound_falloff_tile = 1.5
	damage_falloff_tile = 4

// Chinmoku tracer, the same as regular chinmoku but it looks cool as fuck in the dark

/obj/item/ammo_casing/c12chinmoku/tracer
	name = "12mm Chinmoku tracer bullet casing"
	desc = "A modified .40 sol long bullet, with larger projectile and less powder to make it subsonic \
		Made for use in modified sol rifle magazines. \
		This one is painted with a bright green tracer at the tip."

	icon_state = "chinmoku_tracer"

	projectile_type = /obj/projectile/bullet/c12chinmoku/tracer

/obj/projectile/bullet/c12chinmoku
	name = "12mm Chinmoku tracer"
	icon = 'modular_np_lethal/lethalguns/icons/projectile.dmi'
	icon_state = "tracer_green"

/obj/projectile/bullet/c12chinmoku/update_overlays()
	. = ..()
	. += emissive_appearance(icon, icon_state, src)

// 8mm Marsian, a high velocity sniper round

/obj/item/ammo_casing/c8marsian
	name = "8mm Marsian lethal bullet casing"
	desc = "A high-precision target round first produced on Mars, which has spread to popularity in many precision rifles around the galaxy."

	icon = 'modular_np_lethal/lethalguns/icons/ammo.dmi'
	icon_state = "martian"

	caliber = CALIBER_8MMMARSIAN
	projectile_type = /obj/projectile/bullet/c8marsian

/obj/projectile/bullet/c8marsian
	name = "8mm Marsian bullet"
	icon_state = "gauss"
	damage = 50

	wound_bonus = 10
	bare_wound_bonus = 20

	wound_falloff_tile = 0.5
	speed = 0.5

/obj/item/ammo_box/magazine/ammo_stack/c8marsian
	name = "8mm Marsian casings"
	desc = "A stack of 8mm Marsian cartridges."
	caliber = CALIBER_8MMMARSIAN
	ammo_type = /obj/item/ammo_casing/c8marsian
	max_ammo = 14
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

/obj/item/ammo_box/magazine/ammo_stack/c8marsian/prefilled
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/c8marsian/prefilled/shockwave
	ammo_type = /obj/item/ammo_casing/c8marsian/special

/obj/item/ammo_box/magazine/ammo_stack/c8marsian/prefilled/piercing
	ammo_type = /obj/item/ammo_casing/c8marsian/tracer

// Marsian but it flies even faster, but does less damage

/obj/item/ammo_casing/c8marsian/shockwave
	name = "8mm Marsian shockwave bullet casing"
	desc = "A high-precision target round first produced on Mars, which has spread to popularity in many precision rifles around the galaxy. \
		This one is overloaded with powder and given a much more aerodynamic projectile shape to fly at insane speeds. \
		These modifications have a negative impact on actual damage done to target."

	icon_state = "martian_tungsten"

	projectile_type = /obj/projectile/bullet/c8marsian/shockwave

/obj/projectile/bullet/c8marsian
	name = "8mm Marsian shockwave bullet"
	icon_state = "flight"
	damage = 40

	wound_falloff_tile = 0.25
	speed = 0.3

// Marsian AP, has armor piercing and slightly less damage, but has some

/obj/item/ammo_casing/c8marsian/piercing
	name = "8mm Marsian piercing bullet casing"
	desc = "A high-precision target round first produced on Mars, which has spread to popularity in many precision rifles around the galaxy. \
		The projectile has been modified to better pierce armor, however this introduces deviation in the round's flight path."

	icon_state = "martian_superfrag"

	projectile_type = /obj/projectile/bullet/c8marsian/piercing

/obj/projectile/bullet/piercing
	name = "8mm Marsian piercing bullet"
	icon_state = "redtrac"
	damage = 50
	spread = 5

	wound_falloff_tile = 1
	damage_falloff_tile = 1
	speed = 0.6

// 6 gauge giant shotgun shells for killing things dead

/obj/item/ammo_casing/s6gauge
	name = "6 gauge buckshot shell"
	desc = "A monster sized buckshot shell with pellets special made to thoroughly ruin someone's day."

	icon = 'modular_np_lethal/lethalguns/icons/ammo.dmi'
	icon_state = "ramu_buckshot"

	caliber = CALIBER_6GAUGE
	projectile_type = /obj/projectile/bullet/s6gauge

	pellets = 8
	variance = 30

/obj/projectile/bullet/s6gauge
	name = "6 gauge buckshot pellet"
	damage = 7.5

	wound_falloff_tile = 1
	damage_falloff_tile = 0.25

	range = 12

/obj/item/ammo_box/magazine/ammo_stack/s6gauge
	name = "6 gauge shells"
	desc = "A stack of 6 gauge shells."
	caliber = CALIBER_6GAUGE
	ammo_type = /obj/item/ammo_casing/s6gauge
	max_ammo = 6
	casing_x_positions = list(
		-8,
		-4,
		0,
		4,
		8,
	)
	casing_y_padding = 9

/obj/item/ammo_box/magazine/ammo_stack/s6gauge/prefilled
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/s6gauge/prefilled/special
	ammo_type = /obj/item/ammo_casing/s6gauge/longshot

/obj/item/ammo_box/magazine/ammo_stack/s6gauge/prefilled/tracer
	ammo_type = /obj/item/ammo_casing/s6gauge/slug

// 6 gauge buckshot but with a spread better made for longer range fighting

/obj/item/ammo_casing/s6gauge/longshot
	name = "6 gauge longshot shell"
	desc = "A monster sized buckshot shell with pellets special made to thoroughly ruin someone's day. \
		Longshot is designed to have a tighter spread of pellets that fly further, but behave otherwise identically \
		to standard 6 gauge buckshot"

	icon_state = "ramu_longshot"

	projectile_type = /obj/projectile/bullet/s6gauge/longshot

	variance = 15

/obj/projectile/bullet/s6gauge/longshot
	name = "6 gauge longshot pellet"

	range = 30

// 6 gauge slug, tarkov leg meta

/obj/item/ammo_casing/s6gauge/slug
	name = "6 gauge slug shell"
	desc = "A monster sized slug for monster sized problems, you wouldn't want to get hit by one of these things."

	icon_state = "ramu_slug"

	projectile_type = /obj/projectile/bullet/s6gauge/slug

	pellets = 1
	variance = 5

/obj/projectile/bullet/s6gauge/slug
	name = "6 gauge slug"
	damage = 60
	armour_penetration = 10
	damage_falloff_tile = 1
