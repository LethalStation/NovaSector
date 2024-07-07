/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/flashbang/stringers
	name = "\improper SGL-8 stingbang grenade launcher"
	desc = "A weapon for combat exosuits, launches primed stingbangs, uses flashbang ammo."
	icon_state = "mecha_grenadelnchr"
	projectile = /obj/item/grenade/stingbang
	fire_sound = 'sound/weapons/gun/general/grenade_launch.ogg'
	projectiles = 6
	projectiles_cache = 6
	projectiles_cache_max = 24
	missile_speed = 1.5
	equip_cooldown = 60
	ammo_type = MECHA_AMMO_FLASHBANG
	det_time = 20

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/flashbang/clusterbang/impactlauncher //Evil ass gun
	name = "\improper IPS-7 impact gernade launcher"
	desc = "A weapon for combat exosuits. Launches primed impact gernades. You monster."
	projectiles = 6
	projectiles_cache = 6
	projectiles_cache_max = 12
	disabledreload = TRUE
	projectile = /obj/item/grenade/frag/impact
	equip_cooldown = 80
	ammo_type = MECHA_AMMO_MISSILE_PEP






// cut the amount in half, since they explode on contact

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack
	name = "\improper SRM-4 missile rack"
	desc = "A weapon for combat exosuits. Launches short range missiles."
	icon_state = "mecha_missilerack"
	projectile = /obj/projectile/bullet/rocket/srm
	fire_sound = 'sound/weapons/gun/general/rocket_launch.ogg'
	projectiles = 4
	projectiles_cache = 0
	projectiles_cache_max = 0
	disabledreload = FALSE
	equip_cooldown = 80
	harmful = TRUE
	ammo_type = MECHA_AMMO_MISSILE_PEP
