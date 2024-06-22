// Balance pass 6/20/2024

// triples energy mags, doubles marsian mags, doesn't increase flare shot magazine size
//

/obj/item/ammo_casing/energy/laser
	e_cost = LASER_SHOTS(36, STANDARD_CELL_CHARGE)

/obj/item/ammo_casing/energy/laser/hellfire
	e_cost = LASER_SHOTS(30, STANDARD_CELL_CHARGE)

/obj/item/ammo_casing/energy/lasergun
	e_cost = LASER_SHOTS(48, STANDARD_CELL_CHARGE)

/obj/item/ammo_casing/energy/lasergun/carbine
	e_cost = LASER_SHOTS(120, STANDARD_CELL_CHARGE)

/obj/item/ammo_casing/energy/tesla_cannon
	e_cost = LASER_SHOTS(99, STANDARD_CELL_CHARGE) //im sick in the head

//esword blockchance nerf, .5 -> .25
/obj/item/melee/energy/sword
	block_chance = 25

//shield blockchance nerf, .5 -> .4
/obj/item/shield
	block_chance = 40

//mantis AP buff from 20->30
/obj/item/melee/implantarmblade
	armour_penetration = 30


// evil ass dente hijack, why didn't plum put this here instead of modifying nova. who knows.
/obj/projectile/bullet/p60strela // The funny thing is, these are wild but you only get three of them a magazine
	name =".60 Strela bullet"
	icon_state = "gaussphase"
	speed = 0.4
	damage = 50
	armour_penetration = 100 //i dont care anymore. that filtre is taking damage. - this shit broke the mech damage, it's proper now.
	bare_wound_bonus = 30
	demolition_mod = 5
	/// How much damage we add to things that are weak to this bullet
	anti_materiel_damage_addition = 20 // how much the gun hates robots


//making this not as good as the strela at blowing up big robots. It's still pretty cracked and probably faster with a fully loaded shotgun
/obj/projectile/bullet/shotgun_breaching
	name = "12g breaching round"
	desc = "A breaching round designed to destroy airlocks and windows with only a few shots. Ineffective against other targets."
	hitsound = 'sound/weapons/sonic_jackhammer.ogg'
	damage = 2 //does shit damage to everything except doors and windows
	demolition_mod = 200 //one shot to break a window or grille, or two shots to breach an airlock door
