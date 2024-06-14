/area/vintage
	name = "Vintage Area Basetype (DONT USE)"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "mining"
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED
	sound_environment = SOUND_AREA_ICEMOON
	ambient_buzz = null
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE

/area/vintage/surface_generator
	name = "Surface Desert"
	map_generator = /datum/map_generator/vintage_surface_generator
	area_has_base_lighting = TRUE
	base_lighting_alpha = 255

/area/vintage/caves
	name = "Underground"
	icon_state = "explored"
	ambience_index = AMBIENCE_MINING
	ambient_buzz = 'sound/ambience/magma.ogg'
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS

/area/vintage/caves/actually_generates/mobless
	area_flags = UNIQUE_AREA

/area/vintage/caves/terry
	name = "A Tunnel Too Far"
