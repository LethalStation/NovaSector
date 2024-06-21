// Hybrisa props

/obj/structure/prop/
	name = "GENERIC URBAN PROP NAME"

// Vehicles

/obj/structure/prop/vehicle
	name = "incredible whip"
	desc = "Four wheels and windows. It must be something else that makes it move."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'
	icon_state = "pimpmobile"
	max_integrity = 1000
	pass_flags_self = null
	density = TRUE
	anchored = TRUE
	plane = ABOVE_GAME_PLANE
	layer = ABOVE_ALL_MOB_LAYER
	bound_height = 32
	bound_width = 64

//this uses the directional states to stick two together and make a 32x64 overall sprite
/obj/structure/prop/vehicle/largetruck
	name = "truck"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'
	icon_state = "zenithlongtruck3"

/obj/structure/prop/vehicle/car
	name = "hatchback"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'
	icon_state = "MeridianCar_1"

/obj/structure/prop/vehicle/large_vehicles
	name = "armored truck"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/128x32_vehiclesexpanded.dmi'
	icon_state = "armoredtruck_nt_security_1"
	bound_height = 32
	bound_width = 96

/obj/structure/prop/vehicle/large_vehicles/ambulance
	name = "ambulance"
	desc = "Seems to be broken down."
	icon_state = "ambulance"

/obj/structure/prop/vehicle/large_vehicles/armored_trucks
	icon_state = "armoredtruck_wy_security_1"

/obj/structure/prop/vehicle/large_vehicles/armored_trucks/nt_security/truck_1
	name = "\improper Nanotrasen security truck"
	desc = "Seems to be broken down."
	icon_state = "armoredtruck_nt_security_1"

/obj/structure/prop/vehicle/large_vehicles/armored_trucks/nt_security/truck_2
	name = "\improper Nanotrasen security truck"
	desc = "Seems to be broken down."
	icon_state = "armoredtruck_nt_security_2"

/obj/structure/prop/vehicle/large_vehicles/armored_trucks/heavy_loader/white
	name = "heavy loader truck"
	desc = "Seems to be broken down."
	icon_state = "armoredtruck_white_white"

/obj/structure/prop/vehicle/large_vehicles/armored_trucks/heavy_loader/white_teal
	name = "heavy loader truck"
	desc = "Seems to be broken down."
	icon_state = "armoredtruck_white_teal"

/obj/structure/prop/vehicle/large_vehicles/armored_trucks/heavy_loader/blue_white
	name = "heavy loader truck"
	desc = "Seems to be broken down."
	icon_state = "armoredtruck_blue_white"

// Mega-Hauler Trucks 128x64

/obj/structure/prop/vehicle/large_vehicles/mega_hauler_truck
	name = "mega-hauler truck"
	icon_state = "longtruck_kellandmining"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/128x32_vehiclesexpanded.dmi'
	bound_height = 32
	bound_width = 128
	density = TRUE
	max_integrity = 4000

/obj/structure/prop/vehicle/large_vehicles/mega_hauler_truck/kelland
	icon_state = "longtruck_kellandmining"

/obj/structure/prop/vehicle/large_vehicles/mega_hauler_truck/red_stripe
	icon_state = "longtruck_blue_redstripe"

/obj/structure/prop/vehicle/large_vehicles/mega_hauler_truck/blue_stripe
	icon_state = "longtruck_red_bluestripe"

/obj/structure/prop/vehicle/large_vehicles/mega_hauler_truck/brown
	icon_state = "longtruck_brown"

/obj/structure/prop/vehicle/large_vehicles/mega_hauler_truck/donk
	icon_state = "longtruck_donk"

//WY
/obj/structure/prop/vehicle/large_vehicles/mega_hauler_truck/nt_black
	name = "\improper Nanotrasen mega-hauler truck"
	icon_state = "longtruck_nt_black"

/obj/structure/prop/vehicle/large_vehicles/mega_hauler_truck/nt_blue
	name = "\improper Nanotrasen mega-hauler truck"
	icon_state = "longtruck_nt_blue"

// SUV
/obj/structure/prop/vehicle/suv
	name = "sport utility vehicle"
	desc = "Seems to be broken down."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'
	icon_state = "SUV"
	bound_height = 32
	bound_width = 64

/obj/structure/prop/vehicle/suv/suv_1
	icon_state = "SUV1"

/obj/structure/prop/vehicle/suv/suv_2
	icon_state = "SUV2"

/obj/structure/prop/vehicle/suv/suv_5
	icon_state = "SUV5"

/obj/structure/prop/vehicle/suv/suv_6
	icon_state = "SUV6"

/obj/structure/prop/vehicle/suv/suv_7
	icon_state = "SUV7"

/obj/structure/prop/vehicle/suv/suv_8
	icon_state = "SUV8"

// damaged suv

/obj/structure/prop/vehicle/suv/suvdamaged
	name = "heavily damaged SUV"
	desc = "A shell of a vehicle, broken down beyond repair."
	icon_state = "SUV_damaged"

/obj/structure/prop/vehicle/suv/suvdamaged/suv_damaged1
	icon_state = "SUV1_damaged"

/obj/structure/prop/vehicle/suv/suvdamaged/suv_damaged2
	icon_state = "SUV2_damaged"

// Meridian Cars - Damage States
/obj/structure/prop/vehicle/meridian
	name = "\improper Mono-Spectra"
	desc = "The 'Mono-Spectra', a mass-produced civilian vehicle for extraterrestrial markets, in and outside of Terra controlled space. Produced by 'Meridian' a car marque and associated operating division of the Nanotrasen Corporation."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_red.dmi'
	icon_state = "meridian_red"
	bound_height = 32
	bound_width = 64
	base_icon_state = "meridian_red"
	max_integrity = 600

/obj/structure/prop/vehicle/meridian/Initialize(mapload)
	. = ..()
	overlays.Cut()

/obj/structure/prop/vehicle/meridian/red
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_red.dmi'
	icon_state = "meridian_red"
	base_icon_state = "meridian_red"

/obj/structure/prop/vehicle/meridian/red/damageone
	icon_state = "meridian_red_damage_1"
	max_integrity = 500

/obj/structure/prop/vehicle/meridian/red/damagetwo
	icon_state = "meridian_red_damage_2"
	max_integrity = 400

/obj/structure/prop/vehicle/meridian/red/damagethree
	icon_state = "meridian_red_damage_3"
	max_integrity = 300

/obj/structure/prop/vehicle/meridian/red/damagefour
	icon_state = "meridian_red_damage_4"
	max_integrity = 200

/obj/structure/prop/vehicle/meridian/red/damagefive
	icon_state = "meridian_red_damage_5"
	max_integrity = 100

/obj/structure/prop/vehicle/meridian/black
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_black.dmi'
	icon_state = "meridian_black"
	base_icon_state = "meridian_black"

/obj/structure/prop/vehicle/meridian/black/damageone
	icon_state = "meridian_black_damage_1"
	max_integrity = 500

/obj/structure/prop/vehicle/meridian/black/damagetwo
	icon_state = "meridian_black_damage_2"
	max_integrity = 400

/obj/structure/prop/vehicle/meridian/black/damagethree
	icon_state = "meridian_black_damage_3"
	max_integrity = 300

/obj/structure/prop/vehicle/meridian/black/damagefour
	icon_state = "meridian_black_damage_4"
	max_integrity = 200

/obj/structure/prop/vehicle/meridian/black/damagefive
	icon_state = "meridian_black_damage_5"
	max_integrity = 100

/obj/structure/prop/vehicle/meridian/blue
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_blue.dmi'
	icon_state = "meridian_blue"
	base_icon_state = "meridian_blue"

/obj/structure/prop/vehicle/meridian/blue/damageone
	icon_state = "meridian_blue_damage_1"
	max_integrity = 500

/obj/structure/prop/vehicle/meridian/blue/damagetwo
	icon_state = "meridian_blue_damage_2"
	max_integrity = 400

/obj/structure/prop/vehicle/meridian/blue/damagethree
	icon_state = "meridian_blue_damage_3"
	max_integrity = 300

/obj/structure/prop/vehicle/meridian/blue/damagefour
	icon_state = "meridian_blue_damage_4"
	max_integrity = 200

/obj/structure/prop/vehicle/meridian/blue/damagefive
	icon_state = "meridian_blue_damage_5"
	max_integrity = 100

/obj/structure/prop/vehicle/meridian/brown
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_brown.dmi'
	icon_state = "meridian_brown"
	base_icon_state = "meridian_brown"

/obj/structure/prop/vehicle/meridian/brown/damageone
	icon_state = "meridian_brown_damage_1"
	max_integrity = 500

/obj/structure/prop/vehicle/meridian/brown/damagetwo
	icon_state = "meridian_brown_damage_2"
	max_integrity = 400

/obj/structure/prop/vehicle/meridian/brown/damagethree
	icon_state = "meridian_brown_damage_3"
	max_integrity = 300

/obj/structure/prop/vehicle/meridian/brown/damagefour
	icon_state = "meridian_brown_damage_4"
	max_integrity = 200

/obj/structure/prop/vehicle/meridian/brown/damagefive
	icon_state = "meridian_brown_damage_5"
	max_integrity = 100

/obj/structure/prop/vehicle/meridian/cop
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_cop.dmi'
	icon_state = "meridian_cop"
	base_icon_state = "meridian_cop"

/obj/structure/prop/vehicle/meridian/cop/damageone
	icon_state = "meridian_cop_damage_1"
	max_integrity = 500

/obj/structure/prop/vehicle/meridian/cop/damagetwo
	icon_state = "meridian_cop_damage_2"
	max_integrity = 400

/obj/structure/prop/vehicle/meridian/cop/damagethree
	icon_state = "meridian_cop_damage_3"
	max_integrity = 300

/obj/structure/prop/vehicle/meridian/cop/damagefour
	icon_state = "meridian_cop_damage_4"
	max_integrity = 200

/obj/structure/prop/vehicle/meridian/cop/damagefive
	icon_state = "meridian_cop_damage_5"
	max_integrity = 100

/obj/structure/prop/vehicle/meridian/desat_blue
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_desatblue.dmi'
	icon_state = "meridian_desatblue"
	base_icon_state = "meridian_desatblue"

/obj/structure/prop/vehicle/meridian/desat_blue/damageone
	icon_state = "meridian_desatblue_damage_1"
	max_integrity = 500

/obj/structure/prop/vehicle/meridian/desat_blue/damagetwo
	icon_state = "meridian_desatblue_damage_2"
	max_integrity = 400

/obj/structure/prop/vehicle/meridian/desat_blue/damagethree
	icon_state = "meridian_desatblue_damage_3"
	max_integrity = 300

/obj/structure/prop/vehicle/meridian/desat_blue/damagefour
	icon_state = "meridian_desatblue_damage_4"
	max_integrity = 200

/obj/structure/prop/vehicle/meridian/desat_blue/damagefive
	icon_state = "meridian_desatblue_damage_5"
	max_integrity = 100

/obj/structure/prop/vehicle/meridian/green
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_green.dmi'
	icon_state = "meridian_green"
	base_icon_state = "meridian_green"

/obj/structure/prop/vehicle/meridian/green/damageone
	icon_state = "meridian_green_damage_1"
	max_integrity = 500

/obj/structure/prop/vehicle/meridian/green/damagetwo
	icon_state = "meridian_green_damage_2"
	max_integrity = 400

/obj/structure/prop/vehicle/meridian/green/damagethree
	icon_state = "meridian_green_damage_3"
	max_integrity = 300

/obj/structure/prop/vehicle/meridian/green/damagefour
	icon_state = "meridian_green_damage_4"
	max_integrity = 200

/obj/structure/prop/vehicle/meridian/green/damagefive
	icon_state = "meridian_green_damage_5"
	max_integrity = 100

/obj/structure/prop/vehicle/meridian/light_blue
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_lightblue.dmi'
	icon_state = "meridian_lightblue"
	base_icon_state = "meridian_lightblue"

/obj/structure/prop/vehicle/meridian/light_blue/damageone
	icon_state = "meridian_lightblue_damage_1"
	max_integrity = 500

/obj/structure/prop/vehicle/meridian/light_blue/damagetwo
	icon_state = "meridian_lightblue_damage_2"
	max_integrity = 400

/obj/structure/prop/vehicle/meridian/light_blue/damagethree
	icon_state = "meridian_lightblue_damage_3"
	max_integrity = 300

/obj/structure/prop/vehicle/meridian/light_blue/damagefour
	icon_state = "meridian_lightblue_damage_4"
	max_integrity = 200

/obj/structure/prop/vehicle/meridian/light_blue/damagefive
	icon_state = "meridian_lightblue_damage_5"
	max_integrity = 100

/obj/structure/prop/vehicle/meridian/pink
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_pink.dmi'
	icon_state = "meridian_pink"
	base_icon_state = "meridian_pink"

/obj/structure/prop/vehicle/meridian/pink/damageone
	icon_state = "meridian_pink_damage_1"
	max_integrity = 500

/obj/structure/prop/vehicle/meridian/pink/damagetwo
	icon_state = "meridian_pink_damage_2"
	max_integrity = 400

/obj/structure/prop/vehicle/meridian/pink/damagethree
	icon_state = "meridian_pink_damage_3"
	max_integrity = 300

/obj/structure/prop/vehicle/meridian/pink/damagefour
	icon_state = "meridian_pink_damage_4"
	max_integrity = 200

/obj/structure/prop/vehicle/meridian/pink/damagefive
	icon_state = "meridian_pink_damage_5"
	max_integrity = 100

/obj/structure/prop/vehicle/meridian/purple
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_purple.dmi'
	icon_state = "meridian_purple"
	base_icon_state = "meridian_purple"

/obj/structure/prop/vehicle/meridian/purple/damageone
	icon_state = "meridian_purple_damage_1"
	max_integrity = 500

/obj/structure/prop/vehicle/meridian/purple/damagetwo
	icon_state = "meridian_purple_damage_2"
	max_integrity = 400

/obj/structure/prop/vehicle/meridian/purple/damagethree
	icon_state = "meridian_purple_damage_3"
	max_integrity = 300

/obj/structure/prop/vehicle/meridian/purple/damagefour
	icon_state = "meridian_purple_damage_4"
	max_integrity = 200

/obj/structure/prop/vehicle/meridian/purple/damagefive
	icon_state = "meridian_purple_damage_5"
	max_integrity = 100

/obj/structure/prop/vehicle/meridian/turquoise
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_turquoise.dmi'
	icon_state = "meridian_turquoise"
	base_icon_state = "meridian_turquoise"

/obj/structure/prop/vehicle/meridian/turquoise/damageone
	icon_state = "meridian_turquoise_damage_1"
	max_integrity = 500

/obj/structure/prop/vehicle/meridian/turquoise/damagetwo
	icon_state = "meridian_turquoise_damage_2"
	max_integrity = 400

/obj/structure/prop/vehicle/meridian/turquoise/damagethree
	icon_state = "meridian_turquoise_damage_3"
	max_integrity = 300

/obj/structure/prop/vehicle/meridian/turquoise/damagefour
	icon_state = "meridian_turquoise_damage_4"
	max_integrity = 200

/obj/structure/prop/vehicle/meridian/turquoise/damagefive
	icon_state = "meridian_turquoise_damage_5"
	max_integrity = 100

/obj/structure/prop/vehicle/meridian/orange
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_orange.dmi'
	icon_state = "meridian_orange"
	base_icon_state = "meridian_orange"

/obj/structure/prop/vehicle/meridian/orange/damageone
	icon_state = "meridian_orange_damage_1"
	max_integrity = 500

/obj/structure/prop/vehicle/meridian/orange/damagetwo
	icon_state = "meridian_orange_damage_2"
	max_integrity = 400

/obj/structure/prop/vehicle/meridian/orange/damagethree
	icon_state = "meridian_orange_damage_3"
	max_integrity = 300

/obj/structure/prop/vehicle/meridian/orange/damagefour
	icon_state = "meridian_orange_damage_4"
	max_integrity = 200

/obj/structure/prop/vehicle/meridian/orange/damagefive
	icon_state = "meridian_orange_damage_5"
	max_integrity = 100

/obj/structure/prop/vehicle/meridian/generic
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_wy.dmi'
	icon_state = "meridian_wy"
	base_icon_state = "meridian_wy"

/obj/structure/prop/vehicle/meridian/generic/damageone
	icon_state = "meridian_wy_damage_1"
	max_integrity = 500

/obj/structure/prop/vehicle/meridian/generic/damagetwo
	icon_state = "meridian_wy_damage_2"
	max_integrity = 400

/obj/structure/prop/vehicle/meridian/generic/damagethree
	icon_state = "meridian_wy_damage_3"
	max_integrity = 300

/obj/structure/prop/vehicle/meridian/generic/damagefour
	icon_state = "meridian_wy_damage_4"
	max_integrity = 200

/obj/structure/prop/vehicle/meridian/generic/damagefive
	icon_state = "meridian_wy_damage_5"
	max_integrity = 100

/obj/structure/prop/vehicle/meridian/taxi
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/meridian_taxi.dmi'
	icon_state = "meridian_taxi"
	base_icon_state = "meridian_taxi"

/obj/structure/prop/vehicle/meridian/taxi/damageone
	icon_state = "meridian_taxi_damage_1"
	max_integrity = 500

/obj/structure/prop/vehicle/meridian/taxi/damagetwo
	icon_state = "meridian_taxi_damage_2"
	max_integrity = 400

/obj/structure/prop/vehicle/meridian/taxi/damagethree
	icon_state = "meridian_taxi_damage_3"
	max_integrity = 300

/obj/structure/prop/vehicle/meridian/taxi/damagefour
	icon_state = "meridian_taxi_damage_4"
	max_integrity = 200

/obj/structure/prop/vehicle/meridian/taxi/damagefive
	icon_state = "meridian_taxi_damage_5"
	max_integrity = 100

// Car Chassis

/obj/structure/prop/vehicle/car/car_chassis
	desc = "A Mono-Spectra chassis in the early stages of assembly."

/obj/structure/prop/vehicle/car/car_chassis
	name = "\improper Mono-Spectra Chassis"
	icon_state = "MeridianCar_shell"

/obj/structure/prop/vehicle/car/car_chassis/Initialize(mapload)
	. = ..()
	overlays.Cut()

// small trucks

/obj/structure/prop/vehicle/truck
	name = "truck"
	icon_state = "zentruck1"
	desc = "Seems to be broken down."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'
	bound_height = 32
	bound_width = 64

/obj/structure/prop/vehicle/truck/truck1
	icon_state = "zentruck2"

/obj/structure/prop/vehicle/truck/truck2
	icon_state = "zentruck3"

/obj/structure/prop/vehicle/truck/truck3
	icon_state = "zentruck4"

/obj/structure/prop/vehicle/truck/truck4
	icon_state = "zentruck5"

/obj/structure/prop/vehicle/truck/truck5
	icon_state = "truck_cargo"

/obj/structure/prop/vehicle/truck/truck6
	icon_state = "truck"

/obj/structure/prop/vehicle/truck/garbage
	name = "garbage truck"
	icon_state = "zengarbagetruck"
	desc = "Seems to be broken down."

/obj/structure/prop/vehicle/truck/mining
	name = "mining supply truck"
	icon_state = "truck_mining"
	desc = "Seems to be broken down."
// large trucks

/obj/structure/prop/vehicle/largetruck
	name = "mega-hauler truck"
	icon_state = "zenithlongtruck4"
	desc = "Seems to be broken down."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'
	bound_height = 32
	bound_width = 64

/obj/structure/prop/vehicle/largetruck/largetruck1
	icon_state = "zenithlongtruck2"

/obj/structure/prop/vehicle/largetruck/largetruck2
	icon_state = "zenithlongtruck3"

/obj/structure/prop/vehicle/largetruck/largetruck3
	icon_state = "zenithlongtruck4"

/obj/structure/prop/vehicle/largetruck/largetruck4
	icon_state = "zenithlongtruck5"

// mining truck

/obj/structure/prop/vehicle/largetruck/largetruckmining
	icon_state = "zenithlongtruckkellandmining1"

/obj/structure/prop/vehicle/largetruck/largetruckmining
	name = "Kelland mining mega-hauler truck"

/obj/structure/prop/vehicle/largetruck/largetruckmining/mining
	icon_state = "zenithlongtruckkellandmining1"

// w-y truck

/obj/structure/prop/vehicle/largetruck/largetruckwy
	icon_state = "zenithlongtruckweyland1"

/obj/structure/prop/vehicle/largetruck/largetruckwy
	name = "\improper Nanotrasen mega-hauler truck"

/obj/structure/prop/vehicle/largetruck/largetruckwy/wy1
	icon_state = "zenithlongtruckweyland1"

/obj/structure/prop/vehicle/largetruck/largetruckwy/wy2
	icon_state = "zenithlongtruckweyland2"

// Colony Crawlers

/obj/structure/prop/vehicle/colonycrawlers
	icon_state = "crawler_wy2"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'
	bound_height = 32
	bound_width = 64

/obj/structure/prop/vehicle/colonycrawlers/mining
	icon_state = "miningcrawler1"
	desc = "It is a tread bound crawler used in harsh conditions. Supplied by The Kelland Mining Company; A subsidiary of Nanotrasen."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'

/obj/structure/prop/vehicle/colonycrawlers/mining2
	icon_state = "crawler_fuel"
	desc = "It is a tread bound crawler used in harsh conditions. Supplied by The Kelland Mining Company; A subsidiary of Nanotrasen."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'

/obj/structure/prop/vehicle/colonycrawlers/mining3
	icon_state = "crawler_covered_bed"
	desc = "It is a tread bound crawler used in harsh conditions. Supplied by The Kelland Mining Company; A subsidiary of Nanotrasen."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'

/obj/structure/prop/vehicle/colonycrawlers/science
	icon_state = "crawler_wy2"
	desc = "It is a tread bound crawler used in harsh conditions. This one is designed for personnel transportation. Supplied by Orbital Blue International; 'Your friends, in the Aerospace business.' A subsidiary of Nanotrasen."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'

// science crawlers

/obj/structure/prop/vehicle/colonycrawlers/science
	name = "\improper Nanotrasen colony crawler"

/obj/structure/prop/vehicle/colonycrawlers/science/science1
	icon_state = "crawler_wy1"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'

/obj/structure/prop/vehicle/colonycrawlers/science/science2
	icon_state = "crawler_wy2"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'

// Mining Crawlers

/obj/structure/prop/vehicle/colonycrawlers/mining
	name = "kelland mining colony crawler"

/obj/structure/prop/vehicle/colonycrawlers/mining/mining1
	desc = "It is a tread bound crawler used in harsh conditions. Supplied by The Kelland Mining Company; A subsidiary of Nanotrasen."
	icon_state = "miningcrawler2"

/obj/structure/prop/vehicle/colonycrawlers/mining/mining2
	desc = "It is a tread bound crawler used in harsh conditions. Supplied by The Kelland Mining Company; A subsidiary of Nanotrasen."
	icon_state = "miningcrawler3"

/obj/structure/prop/vehicle/colonycrawlers/mining/mining3
	desc = "It is a tread bound crawler used in harsh conditions. Supplied by The Kelland Mining Company; A subsidiary of Nanotrasen."
	icon_state = "miningcrawler4"

/obj/structure/prop/vehicle/colonycrawlers/mining/mining4
	desc = "It is a tread bound crawler used in harsh conditions. Supplied by The Kelland Mining Company; A subsidiary of Nanotrasen."
	icon_state = "miningcrawlerblank"

// Special SUV's

/obj/structure/prop/vehicle/suv/misc
	name = "\improper Nanotrasen rapid response vehicle"
	desc = "Seems to be broken down."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'
	icon_state = "WYSUV1"
	bound_height = 32
	bound_width = 64

/obj/structure/prop/vehicle/suv/misc/wy1
	icon_state = "WYSUV1"

/obj/structure/prop/vehicle/suv/misc/wy2
	icon_state = "WYSUV2"

/obj/structure/prop/vehicle/suv/misc/wy3
	icon_state = "WYSUV3"

/obj/structure/prop/vehicle/suv/misc/ambulance
	name = "emergency response medical van"
	desc = "Seems to be broken down."
	icon_state = "ambulance"

/obj/structure/prop/vehicle/suv/misc/whitevan
	name = "maintenance SUV"
	desc = "Seems to be broken down."
	icon_state = "whitevan"

/obj/structure/prop/vehicle/suv/misc/maintenance
	name = "maintenance SUV"
	desc = "Seems to be broken down."
	icon_state = "maintenaceSUV"

/obj/structure/prop/vehicle/suv/misc/marshalls
	name = "colonial marshalls rapid response SUV"
	desc = "Seems to be broken down."
	icon_state = "marshalls"

/obj/structure/prop/vehicle/suv/misc/marshalls2
	name = "colonial marshalls rapid response SUV"
	desc = "Seems to be broken down."
	icon_state = "marshalls2"

/obj/structure/prop/vehicle/suv/misc/expensive
	name = "Expensive looking SUV"
	desc = "Seems to be broken down."
	icon_state = "SUV9"

/obj/structure/prop/vehicle/suv/misc/expensive2
	name = "Expensive Nanotrasen SUV"
	desc = "Seems to be broken down."
	icon_state = "blackSUV"

/obj/structure/prop/vehicle/suv/misc/expensive3
	name = "The Pimp-Mobile"
	desc = "Seems to be broken down."
	icon_state = "pimpmobile"

// Vans

/obj/structure/prop/vehicle/van
	name = "van"
	desc = "Seems to be broken down."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/vehiclesexpanded.dmi'
	icon_state = "greyvan"
	bound_height = 32
	bound_width = 64

/obj/structure/prop/vehicle/van/vandamaged
	name = "van"
	desc = "A shell of a vehicle, broken down beyond repair."
	icon_state = "greyvan_damaged"

/obj/structure/prop/vehicle/van/vanpizza
	name = "pizza delivery van"
	icon_state = "pizzavan"

/obj/structure/prop/vehicle/van/vanmining
	name = "Kelland Mining van"
	icon_state = "kellandminingvan"

/obj/structure/prop/vehicle/van/hyperdynevan
	name = "Hyperdyne van"
	icon_state = "hyperdynevan"

/obj/structure/prop/vehicle/crashedcarsleft
	name = "car pileup"
	desc = "Burned out wrecked vehicles block your path."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/crashedcars.dmi'
	icon_state = "crashedcarsleft"
	bound_height = 64
	bound_width = 64
	layer = 5

/obj/structure/prop/vehicle/crashedcarsright
	name = "car pileup"
	desc = "Burned out wrecked vehicles block your path."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/crashedcars.dmi'
	icon_state = "crashedcarsright"
	bound_height = 64
	bound_width = 64

	layer = 5

// Cave props

/obj/structure/prop/urban/cavedecor
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	name = "stalagmite"
	icon_state = "stalagmite"
	desc = "A cave stalagmite."
	layer = TURF_LAYER
	plane = FLOOR_PLANE

/obj/structure/prop/urban/cavedecor/stalagmite0
	icon_state = "stalagmite"

/obj/structure/prop/urban/cavedecor/stalagmite1
	icon_state = "stalagmite1"

/obj/structure/prop/urban/cavedecor/stalagmite2
	icon_state = "stalagmite2"

/obj/structure/prop/urban/cavedecor/stalagmite3
	icon_state = "stalagmite3"

/obj/structure/prop/urban/cavedecor/stalagmite4
	icon_state = "stalagmite4"

/obj/structure/prop/urban/cavedecor/stalagmite5
	icon_state = "stalagmite5"


// Supermart

/obj/structure/rack/supermart
	name = "long rack"
	icon_state = "longrack1"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'

/obj/structure/rack/supermart/longrackempty
	name = "shelf"
	desc = "A long empty shelf."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "longrackempty"

/obj/structure/rack/supermart/longrack1
	name = "shelf"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "longrack1"

/obj/structure/rack/supermart/longrack2
	name = "shelf"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "longrack2"

/obj/structure/rack/supermart/longrack3
	name = "shelf"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "longrack3"

/obj/structure/rack/supermart/longrack4
	name = "shelf"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "longrack4"

/obj/structure/rack/supermart/longrack5
	name = "shelf"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "longrack5"

/obj/structure/rack/supermart/longrack6
	name = "shelf"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "longrack6"

/obj/structure/rack/supermart/longrack7
	name = "shelf"
	desc = "A long shelf filled with various foodstuffs"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "longrack7"

/obj/structure/prop/supermartbelt
	name = "conveyor belt"
	desc = "A conveyor belt."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "checkoutbelt"

/obj/structure/prop/freezer
	name = "commercial freezer"
	desc = "A commercial grade freezer."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "freezermid"
	density = TRUE

/obj/structure/prop/freezer/supermartfreezer1
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "freezerupper"
	bound_height = 16

/obj/structure/prop/freezer/supermartfreezer2
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "freezerlower"

/obj/structure/prop/freezer/supermartfreezer4
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "freezerupper1"

/obj/structure/prop/freezer/supermartfreezer5
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "freezerlower1"

/obj/structure/prop/freezer/supermartfreezer6
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "freezermid1"

/obj/structure/prop/supermartfruitbasketempty
	name = "basket"
	desc = "A basket."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "supermarketbasketempty"

/obj/structure/prop/supermartfruitbasketoranges
	name = "basket"
	desc = "A basket full of oranges."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "supermarketbasket1"

/obj/structure/prop/supermartfruitbasketpears
	name = "basket"
	desc = "A basket full of pears."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "supermarketbasket2"

/obj/structure/prop/supermartfruitbasketcarrots
	name = "basket"
	desc = "A basket full of carrots."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "supermarketbasket3"

/obj/structure/prop/supermartfruitbasketmelons
	name = "basket"
	desc = "A basket full of melons."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "supermarketbasket4"

/obj/structure/prop/supermartfruitbasketapples
	name = "basket"
	desc = "A basket full of apples."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/supermart.dmi'
	icon_state = "supermarketbasket5"

// Furniture
/obj/structure/table/urban/
	name = "large metal table"
	desc = "A large black metal table, looks very expensive."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbantables.dmi'
	icon_state = "blackmetaltable"
	bound_height = 32
	bound_width = 64

/obj/structure/table/urban/blacktablecomputer
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbantables.dmi'
	icon_state = "blackmetaltable_computer"

/obj/structure/table/urban/tablewood
	name = "large wood table"
	desc = "A large wooden table, looks very expensive."
	icon_state = "brownlargetable"

/obj/structure/table/urban/tablewoodcomputer
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbantables.dmi'
	icon_state = "brownlargetable_computer"

/obj/structure/table/urban/tablepool
	name = "pool table"
	desc = "A large table used for Pool."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbantables.dmi'
	icon_state = "table_pool"

/obj/structure/table/urban/tablegambling
	name = "gambling table"
	desc = "A large table used for gambling."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbantables.dmi'
	icon_state = "table_cards"

// Chairs
/obj/structure/chair/urban/
	name = "expensive chair"
	desc = "An expensive looking chair"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "comfychair_zenithblack"

/obj/structure/chair/urban/red
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "comfychair_zenithred"

/obj/structure/chair/urban/blue
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "comfychair_zenithblue"

/obj/structure/chair/urban/brown
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "comfychair_zenithbrown"

// Beds

/obj/structure/bed/hybrisa
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "hybrisa"

/obj/structure/bed/hybrisa/prisonbed
	name = "bunk bed"
	desc = "A sorry looking bunk-bed."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "prisonbed"

/obj/structure/bed/hybrisa/bunkbed1
	name = "bunk bed"
	desc = "A comfy looking bunk-bed."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "zbunkbed"

/obj/structure/bed/hybrisa/bunkbed2
	name = "bunk bed"
	desc = "A comfy looking bunk-bed."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "zbunkbed2"

/obj/structure/bed/hybrisa/bunkbed3
	name = "bunk bed"
	desc = "A comfy looking bunk-bed."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "zbunkbed3"

/obj/structure/bed/hybrisa/bunkbed4
	name = "bunk bed"
	desc = "A comfy looking bunk-bed."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "zbunkbed4"

/obj/structure/bed/hybrisa/hospitalbeds
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "hospital"

/obj/structure/bed/hybrisa/hospitalbeds/hospitalbed1
	name = "hospital bed"
	desc = "A mattress seated on a rectangular metallic frame with wheels. This is used to support a lying person in a comfortable manner."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "bigrollerempty2_up"

/obj/structure/bed/hybrisa/hospitalbeds/hospitalbed2
	name = "hospital bed"
	desc = "A mattress seated on a rectangular metallic frame with wheels. This is used to support a lying person in a comfortable manner."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "bigrollerempty_up"

/obj/structure/bed/hybrisa/hospitalbeds/hospitalbed3
	name = "hospital bed"
	desc = "A mattress seated on a rectangular metallic frame with wheels. This is used to support a lying person in a comfortable manner."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "bigrollerempty3_up"

/obj/structure/prop/refuelinghose
	name = "refueling hose"
	desc = "A long refueling hose that connects to various types of dropships."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x96-urbanrandomprops.dmi'
	icon_state = "fuelline1"
	bound_height = null
	bound_width = null


/obj/structure/prop/refuelinghose2
	name = "refueling hose"
	desc = "A long refueling hose that connects to various types of dropships."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x96-urbanrandomprops.dmi'
	icon_state = "fuelline2"
	bound_height = null
	bound_width = null

// Pilot body

/obj/structure/prop/deadpilot1
	name = "decapitated Nanotrasen Pilot"
	desc = "What remains of a Nanotrasen Pilot. Their entire head is missing. Where'd it roll off to?..."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x96-urbanrandomprops.dmi'
	icon_state = "pilotbody_decap1"
	bound_height = 64
	bound_width = 96

/obj/structure/prop/deadpilot2
	name = "decapitated Nanotrasen Pilot"
	desc = "What remains of a Nanotrasen Pilot. Their entire head is missing. Where'd it roll off to?..."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x96-urbanrandomprops.dmi'
	icon_state = "pilotbody_decap2"
	bound_height = 64
	bound_width = 96

// Floor props

/obj/structure/prop/floor/grate
	name = "solid metal grate"
	desc = "A metal grate."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "solidgrate1"

/obj/structure/prop/floor/grate2
	name = "solid metal grate"
	desc = "A metal grate."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "solidgrate5"

/obj/structure/prop/floor/grate3
	name = "solid metal grate"
	desc = "A metal grate."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "zhalfgrate1"

/obj/structure/prop/floor/floorglass
	name = "reinforced glass floor"
	desc = "A heavily reinforced glass floor panel, this looks almost indestructible."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "solidgrate2"

/obj/structure/prop/floor/floorglass2
	name = "reinforced glass floor"
	desc = "A heavily reinforced glass floor panel, this looks almost indestructible."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "solidgrate3"
	layer = BELOW_OBJ_LAYER

/obj/structure/prop/floor/floorglass3
	name = "reinforced glass floor"
	desc = "A heavily reinforced glass floor panel, this looks almost indestructible."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "solidgrate4"

// Fire

/obj/structure/prop/urban/misc/fire/firebarrel
	name = "barrel"
	desc = "A flaming barrel filled with hazardous substances."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x96-urbanrandomprops.dmi'
	icon_state = "zbarrelfireon"
	layer = 5
	light_on = TRUE
	light_power = 2
	light_range = 3

// Misc

/obj/structure/prop/urban/misc/commandosuitemptyprop
	name = "\improper Nanotrasen 'Ape-Suit' Showcase"
	desc = "A display model of the Nanotrasen 'Apesuit', shame it's only a model..."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "dogcatchersuitempty1"

/obj/structure/prop/urban/misc/cabinet
	name = "cabinet"
	desc = "a small cabinet with drawers."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "sidecabinet"

/obj/structure/prop/urban/misc/trash/green
	name = "trash bin"
	desc = "A Nanotrasen trash bin used for disposing your unwanted items, or you can just throw your shit on the ground like every other asshole."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "trashgreen"

/obj/structure/prop/urban/misc/trash/blue
	name = "trash bin"
	desc = "A Nanotrasen trash bin used for disposing your unwanted items, or you can just throw your shit on the ground like every other asshole."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "trashblue"

/obj/structure/prop/urban/misc/redmeter
	name = "meter"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "redmeter"

/obj/structure/prop/urban/misc/firebarreloff
	name = "barrel"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "zfirebarreloff"

/obj/structure/prop/urban/misc/trashbagfullprop
	name = "trash bag"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "ztrashbag"

/obj/structure/prop/urban/misc/slotmachine
	name = "slot machine"
	desc = "A slot machine."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x64_urbanrandomprops.dmi'
	icon_state = "slotmachine"
	anchored = TRUE
	density = TRUE

/obj/structure/prop/urban/misc/atm
	name = "\improper NanoTrasen Automatic Teller Machine"
	desc = "For all your monetary needs!"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x64_urbanrandomprops.dmi'
	icon_state = "atm"
	bound_width = 32
	bound_height = 32
	anchored = TRUE
	density = TRUE

/obj/structure/prop/urban/misc/slotmachine_broken
	name = "slot machine"
	desc = "A broken slot machine."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x64_urbanrandomprops.dmi'
	icon_state = "slotmachine_broken"
	bound_width = 32
	bound_height = 32
	anchored = TRUE
	density = TRUE

/obj/structure/prop/urban/misc/coffeestuff/coffeemachine1
	name = "coffee machine"
	desc = "A coffee machine."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "coffee"

/obj/structure/prop/urban/misc/coffeestuff/coffeemachine2
	name = "coffee machine"
	desc = "A coffee machine."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "coffee_cup"

/obj/structure/prop/urban/misc/machinery/computers
	name = "computer"
	icon_state = "mapping_comp"

/obj/structure/prop/urban/misc/machinery/computers/computerwhite/computer1
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "mapping_comp"

/obj/structure/prop/urban/misc/machinery/computers/computerwhite/computer2
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "mps"

/obj/structure/prop/urban/misc/machinery/computers/computerwhite/computer3
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "sensor_comp1"

/obj/structure/prop/urban/misc/machinery/computers/computerwhite/computer4
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "sensor_comp2"

/obj/structure/prop/urban/misc/machinery/computers/computerwhite/computer5
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "sensor_comp3"


/obj/structure/prop/urban/misc/machinery/computers/computerblack/computer1
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "blackmapping_comp"

/obj/structure/prop/urban/misc/machinery/computers/computerblack/computer2
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "blackmps"

/obj/structure/prop/urban/misc/machinery/computers/computerblack/computer3
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "blacksensor_comp1"

/obj/structure/prop/urban/misc/machinery/computers/computerblack/computer4
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "blacksensor_comp2"

/obj/structure/prop/urban/misc/machinery/computers/computerblack/computer5
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "blacksensor_comp3"


/obj/structure/prop/urban/misc/machinery/screens
	name = "monitor"
	desc = "A screen, useful for broadcasting events. It looks like it's seen better days."

/obj/structure/prop/urban/misc/machinery/screens/frame
	icon_state = "frame"

/obj/structure/prop/urban/misc/machinery/screens/security
	icon_state = "security"

/obj/structure/prop/urban/misc/machinery/screens/evac
	icon_state = "evac"

/obj/structure/prop/urban/misc/machinery/screens/redalert
	icon_state = "redalert"

/obj/structure/prop/urban/misc/machinery/screens/redalertblank
	icon_state = "redalertblank"

/obj/structure/prop/urban/misc/machinery/screens/entertainment
	icon_state = "entertainment"

/obj/structure/prop/urban/misc/machinery/screens/telescreen
	icon_state = "telescreen"

/obj/structure/prop/urban/misc/machinery/screens/telescreenbroke
	icon_state = "telescreenb"

/obj/structure/prop/urban/misc/machinery/screens/telescreenbrokespark
	icon_state = "telescreenbspark"

// Multi-Monitor

//Green
/obj/structure/prop/urban/misc/machinery/screens/multimonitorsmall_off
	icon_state = "multimonitorsmall_off"

/obj/structure/prop/urban/misc/machinery/screens/multimonitorsmall_on
	icon_state = "multimonitorsmall_on"

/obj/structure/prop/urban/misc/machinery/screens/multimonitormedium_off
	icon_state = "multimonitormedium_off"

/obj/structure/prop/urban/misc/machinery/screens/multimonitormedium_on
	icon_state = "multimonitormedium_on"

/obj/structure/prop/urban/misc/machinery/screens/multimonitorbig_off
	icon_state = "multimonitorbig_off"

/obj/structure/prop/urban/misc/machinery/screens/multimonitorbig_on
	icon_state = "multimonitorbig_on"

// Blue

/obj/structure/prop/urban/misc/machinery/screens/bluemultimonitorsmall_off
	icon_state = "bluemultimonitorsmall_off"

/obj/structure/prop/urban/misc/machinery/screens/bluemultimonitorsmall_on
	icon_state = "bluemultimonitorsmall_on"

/obj/structure/prop/urban/misc/machinery/screens/bluemultimonitormedium_off
	icon_state = "bluemultimonitormedium_off"

/obj/structure/prop/urban/misc/machinery/screens/bluemultimonitormedium_on
	icon_state = "bluemultimonitormedium_on"

/obj/structure/prop/urban/misc/machinery/screens/bluemultimonitorbig_off
	icon_state = "bluemultimonitorbig_off"

/obj/structure/prop/urban/misc/machinery/screens/bluemultimonitorbig_on
	icon_state = "bluemultimonitorbig_on"

/obj/structure/prop/urban/misc/fake/pipes
	name = "disposal pipe"
	desc = "A small pipe."

/obj/structure/prop/urban/misc/fake/pipes/pipe1
	layer = 2
	icon_state = "pipe-s"

/obj/structure/prop/urban/misc/fake/pipes/pipe2
	layer = 2
	icon_state = "pipe-c"

/obj/structure/prop/urban/misc/fake/pipes/pipe3
	layer = 2
	icon_state = "pipe-j1"

/obj/structure/prop/urban/misc/fake/pipes/pipe4
	layer = 2
	icon_state = "pipe-y"

/obj/structure/prop/urban/misc/fake/pipes/pipe5
	layer = 2
	icon_state = "pipe-b"

/obj/structure/prop/urban/misc/fake/wire
	name = "power cable"
	desc = "A small gauge wire for conducting electricity."

/obj/structure/prop/urban/misc/fake/wire/red
	layer = 2
	icon_state = "intactred"

/obj/structure/prop/urban/misc/fake/wire/yellow
	layer = 2
	icon_state = "intactyellow"

/obj/structure/prop/urban/misc/fake/wire/blue
	layer = 2
	icon_state = "intactblue"


/obj/structure/prop/urban/misc/fake/heavydutywire
	name = "heavy duty wire"
	desc = "A heavy duty wire for conducting electricity."

/obj/structure/prop/urban/misc/fake/heavydutywire/heavy1
	layer = 2
	icon_state = "0-1"

/obj/structure/prop/urban/misc/fake/heavydutywire/heavy2
	layer = 2
	icon_state = "1-2"

/obj/structure/prop/urban/misc/fake/heavydutywire/heavy3
	layer = 2
	icon_state = "1-4"

/obj/structure/prop/urban/misc/fake/heavydutywire/heavy4
	layer = 2
	icon_state = "1-2-4"

/obj/structure/prop/urban/misc/fake/heavydutywire/heavy5
	layer = 2
	icon_state = "1-2-4-8"

/obj/structure/prop/urban/misc/fake/lattice
	name = "structural lattice"

/obj/structure/prop/urban/misc/fake/lattice/full
	icon_state = "latticefull"
	layer = 2

// Barriers

/obj/structure/railing/road_barrier
	name = "road barrier"
	desc = "A deployable plastic barrier for controlling the flow of traffic."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "roadbarrier"

/obj/structure/railing/road_barrier/red
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "roadbarrier"

/obj/structure/railing/road_barrier/redlong
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "roadbarrier4"

/obj/structure/railing/road_barrier/blue
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "roadbarrier2"

/obj/structure/railing/road_barrier/bluelong
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "roadbarrier5"

/obj/structure/railing/road_barrier/roadbarrierwyblack
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "roadbarrier3"

/obj/structure/railing/road_barrier/roadbarrierwyblacklong
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "roadbarrier6"

/obj/structure/railing/road_barrier/roadbarrierwyblackjoined
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "roadbarrierjoined3"

/obj/structure/railing/road_barrier/roadbarrierjoined
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "roadbarrierjoined"

/obj/structure/railing/road_barrier/wood
	name = "road barrier"
	desc = "A wooden barrier for blocking entry."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "roadbarrierwood"

/obj/structure/railing/road_barrier/wood/roadbarrierwoodorange
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "roadbarrierwood"

/obj/structure/railing/road_barrier/wood/roadbarrierwoodblue
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "roadbarrierpolice"

// Cargo Containers extended

/obj/structure/shipping_container/containersextended
	name = "cargo container"
	desc = "a cargo container."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/containersextended.dmi'
	icon_state = "blackwyleft"

/obj/structure/shipping_container/containersextended/blueleft
	name = "cargo container"
	icon_state = "blueleft"

/obj/structure/shipping_container/containersextended/blueright
	name = "cargo container"
	icon_state = "blueright"

/obj/structure/shipping_container/containersextended/greenleft
	name = "cargo container"
	icon_state = "greenleft"

/obj/structure/shipping_container/containersextended/greenright
	name = "cargo container"
	icon_state = "greenright"

/obj/structure/shipping_container/containersextended/tanleft
	name = "cargo container"
	icon_state = "tanleft"

/obj/structure/shipping_container/containersextended/tanright
	name = "cargo container"
	icon_state = "tanright"

/obj/structure/shipping_container/containersextended/redleft
	name = "cargo container"
	icon_state = "redleft"

/obj/structure/shipping_container/containersextended/redright
	name = "cargo container"
	icon_state = "redright"

/obj/structure/shipping_container/containersextended/greywyleft
	name = "\improper Nanotrasen cargo container"
	icon_state = "greywyleft"

/obj/structure/shipping_container/containersextended/greywyright
	name = "\improper Nanotrasen cargo container"
	icon_state = "greywyright"

/obj/structure/shipping_container/containersextended/lightgreywyleft
	name = "\improper Nanotrasen cargo container"
	icon_state = "lightgreywyleft"

/obj/structure/shipping_container/containersextended/lightgreywyright
	name = "\improper Nanotrasen cargo container"
	icon_state = "lightgreywyright"

/obj/structure/shipping_container/containersextended/blackwyleft
	name = "\improper Nanotrasen cargo container"
	icon_state = "blackwyleft"

/obj/structure/shipping_container/containersextended/blackwyright
	name = "\improper Nanotrasen cargo container"
	icon_state = "blackwyright"

/obj/structure/shipping_container/containersextended/whitewyleft
	name = "\improper Nanotrasen cargo container"
	icon_state = "whitewyleft"

/obj/structure/shipping_container/containersextended/whitewyright
	name = "\improper Nanotrasen cargo container"
	icon_state = "whitewyright"

/obj/structure/shipping_container/containersextended/tanwywingsleft
	name = "cargo container"
	icon_state = "tanwywingsleft"

/obj/structure/shipping_container/containersextended/tanwywingsright
	name = "cargo container"
	icon_state = "tanwywingsright"

/obj/structure/shipping_container/containersextended/greenwywingsleft
	name = "cargo container"
	icon_state = "greenwywingsleft"

/obj/structure/shipping_container/containersextended/greenwywingsright
	name = "cargo container"
	icon_state = "greenwywingsright"

/obj/structure/shipping_container/containersextended/bluewywingsleft
	name = "cargo container"
	icon_state = "bluewywingsleft"

/obj/structure/shipping_container/containersextended/bluewywingsright
	name = "cargo container"
	icon_state = "bluewywingsright"

/obj/structure/shipping_container/containersextended/redwywingsleft
	name = "cargo container"
	icon_state = "redwywingsleft"

/obj/structure/shipping_container/containersextended/redwywingsright
	name = "cargo container"
	icon_state = "redwywingsright"

/obj/structure/shipping_container/containersextended/medicalleft
	name = "medical cargo containers"
	icon_state = "medicalleft"

/obj/structure/shipping_container/containersextended/medicalright
	name = "medical cargo containers"
	icon_state = "medicalright"

/obj/structure/shipping_container/containersextended/emptymedicalleft
	name = "medical cargo container"
	icon_state = "emptymedicalleft"

/obj/structure/shipping_container/containersextended/emptymedicalright
	name = "medical cargo container"
	icon_state = "emptymedicalright"

/obj/structure/shipping_container/containersextended/graffiti
	name = "defaced cargo container"
	icon_state = "grafcontain_l"

/obj/structure/shipping_container/containersextended/graffiti/two
	name = "defaced cargo container"
	icon_state = "grafcontain_rm"

/obj/structure/shipping_container/containersextended/graffiti/three
	name = "defaced cargo container"
	icon_state = "grafcontain_r"

/obj/structure/shipping_container/containersextended/graffiti/four
	name = "defaced cargo container"
	icon_state = "grafcontain2_l"

/obj/structure/shipping_container/containersextended/graffiti/five
	name = "defaced cargo container"
	icon_state = "grafcontain2_rm"

/obj/structure/shipping_container/containersextended/graffiti/six
	name = "defaced cargo container"
	icon_state = "grafcontain2_r"

/obj/structure/shipping_container/containersextended/graffiti/seven
	name = "defaced cargo container"
	icon_state = "grafcontain3_l"

/obj/structure/shipping_container/containersextended/graffiti/eight
	name = "defaced cargo container"
	icon_state = "grafcontain3_rm"

/obj/structure/shipping_container/containersextended/graffiti/nine
	name = "defaced cargo container"
	icon_state = "grafcontain3_r"

/// Fake Platforms

/obj/structure/prop/urban/fakeplatforms
	name = "platform"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/prop/urban/fakeplatforms/platform3
	icon_state = "platform"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'

/obj/structure/prop/urban/fakeplatforms/platform4
	icon_state = "zenithplatform3"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'

// Grille

/obj/structure/prop/urban/misc/highvoltagegrille
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "highvoltagegrille"

// Greeblies
/obj/structure/prop/urban/misc/buildinggreeblies
	name = "machinery"
	desc = "A strange piece of machinery attached to a wall..."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x64_urbanrandomprops.dmi'
	icon_state = "buildingventbig1"
	bound_width = 64
	bound_height = 32
	density = FALSE
	max_integrity = 200
	anchored = TRUE
	layer = 5

/obj/structure/prop/urban/misc/buildinggreeblies/greeble1
	icon_state = "buildingventbig2"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble2
	icon_state = "buildingventbig3"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble3
	icon_state = "buildingventbig4"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble4
	icon_state = "buildingventbig5"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble5
	icon_state = "buildingventbig6"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble6
	icon_state = "buildingventbig7"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble7
	icon_state = "buildingventbig8"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble8
	icon_state = "buildingventbig9"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble9
	icon_state = "buildingventbig10"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble10
	density = FALSE
	icon_state = "buildingventbig11"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble11
	density = FALSE
	icon_state = "buildingventbig12"

/obj/structure/prop/urban/misc/buildinggreeblies/greeble12
	density = FALSE
	icon_state = "buildingventbig13"

/obj/structure/prop/urban/misc/buildinggreebliessmall
	name = "wall vent"
	desc = "A small piece of odd looking machinery..."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "smallwallvent1"
	density = FALSE

/obj/structure/prop/urban/misc/buildinggreebliessmall2
	name = "wall vent"
	icon_state = "smallwallvent2"

/obj/structure/prop/urban/misc/buildinggreebliessmall2
	name = "wall vent"
	icon_state = "smallwallvent2"

/obj/structure/prop/urban/misc/buildinggreebliessmall3
	name = "wall vent"
	icon_state = "smallwallvent3"


/obj/structure/prop/urban/misc/buildinggreebliessmall/computer
	name = "machinery"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "zcomputermachine"
	density = TRUE

/obj/structure/prop/urban/misc/metergreen
	name = "meter"
	desc = "A power meter, useful for gauging energy fluctuations."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "biggreenmeter1"


// MISC

/obj/structure/prop/urban/misc/stoneplanterseats
	name = "concrete seated planter"
	desc = "A decorative concrete planter with seating attached, the seats are fitted with synthetic leather, they've faded in time.."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x64_urbanrandomprops.dmi'
	icon_state = "planterseats"
	bound_width = 32
	bound_height = 64
	density = TRUE
	max_integrity = 200
	anchored = TRUE

/obj/structure/prop/urban/misc/stoneplanterseats/empty
	name = "concrete planter"
	desc = "A decorative concrete planter."
	icon_state = "planterempty"

/obj/structure/prop/urban/misc/concretestatue
	name = "concrete statue"
	desc = "A decorative statue with the Nanotrasen 'Wings' adorned on it, A corporate brutalist piece of art."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x64_urbanrandomprops.dmi'
	icon_state = "concretesculpture"
	bound_width = 64
	bound_height = 64
	density = TRUE
	anchored = TRUE

/obj/structure/prop/urban/misc/detonator
	name = "detonator"
	desc = "A detonator for explosives, armed and ready."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "detonator"
	density = FALSE
	anchored = TRUE
	var/id = 1
	var/range = 15

/obj/structure/prop/urban/misc/firehydrant
	name = "fire hydrant"
	desc = "A fire hydrant public water outlet, designed for quick access to water."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "firehydrant"
	density = FALSE
	anchored = TRUE
	max_integrity = 150

/obj/structure/prop/urban/misc/phonebox
	name = "phonebox"
	desc = "A phone-box, it doesn't seem to be working, the line must be down."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x64_urbanrandomprops.dmi'
	icon_state = "phonebox_closed"
	layer = ABOVE_MOB_LAYER
	bound_width = 32
	bound_height = 32
	density = TRUE
	anchored = TRUE

/obj/structure/prop/urban/misc/phonebox/broken
	desc = "A phone-box, it doesn't seem to be working, the line must be down. The glass has been broken."
	icon_state = "phonebox_closed_broken"

/obj/structure/prop/urban/misc/phonebox/lightup
	desc = "A phone-box, it doesn't seem to be working, the line must be down."
	icon_state = "phonebox_closed_light"

/obj/structure/chair/pew/bench
	name = "bench"
	desc = "A metal frame, with seats that are fitted with synthetic leather, they've faded in time."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x64_urbanrandomprops.dmi'
	icon_state = "seatedbench"
	bound_width = 32
	bound_height = 64
	layer = 4
	density = FALSE
	max_integrity = 200
	anchored = TRUE

// Signs

/obj/structure/prop/urban/signs
	name = "neon sign"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urban64x64_signs.dmi'
	icon_state = "jacksopen_on"
	bound_height = 64
	bound_width = 64
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/urban/signs/casniosign
	name = "casino sign"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urban64x64_signs.dmi'
	icon_state = "nightgoldcasinoopen_on"

/obj/structure/prop/urban/signs/jackssign
	name = "jack's surplus sign"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urban64x64_signs.dmi'
	icon_state = "jacksopen_on"

/obj/structure/prop/urban/signs/opensign
	name = "open sign"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urban64x64_signs.dmi'
	icon_state = "open_on"

/obj/structure/prop/urban/signs/opensign2
	name = "open sign"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urban64x64_signs.dmi'
	icon_state = "open_on2"

/obj/structure/prop/urban/signs/pizzasign
	name = "pizza sign"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urban64x64_signs.dmi'
	icon_state = "pizzaneon_on"

/obj/structure/prop/urban/signs/weymartsign
	name = "weymart sign"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urban64x64_signs.dmi'
	icon_state = "weymartsign2"

/obj/structure/prop/urban/signs/mechanicsign
	name = "mechanic sign"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urban64x64_signs.dmi'
	icon_state = "mechanicopen_on2"

/obj/structure/prop/urban/signs/cuppajoessign
	name = "cuppa joe's sign"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urban64x64_signs.dmi'
	icon_state = "cuppajoes"

/obj/structure/prop/urban/signs/barsign
	name = "bar sign"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urban64x64_signs.dmi'
	icon_state = "barsign_on"

// Small Sign
/obj/structure/prop/urban/signs/high_voltage
	name = "warning sign"
	desc = "DANGER - HIGH VOLTAGE - DEATH!."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "shockyBig"

/obj/structure/prop/urban/signs/high_voltage/small
	name = "warning sign"
	desc = "DANGER - HIGH VOLTAGE - DEATH!."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urbanrandomprops.dmi'
	icon_state = "shockyTiny"

// billboards, Signs and Posters

/// Alien Isolation - posters used as reference (direct downscale of the image for some) If anyone wants to name the billboards individually ///
/obj/structure/billboard/bigbillboards
	name = "billboard"
	desc = "A advertisement billboard."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/32x64_urbanbillboards.dmi'
	icon_state = "billboard_bigger"
	bound_width = 64
	bound_height = 32
	density = FALSE
	max_integrity = 200
	anchored = TRUE

/obj/structure/billboard/billboardsmedium/billboard1
	name = "billboard"
	desc = "A advertisement billboard."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/32x64_urbanbillboards.dmi'
	icon_state = "billboard1"

/obj/structure/billboard/billboardsmedium/billboard2
	name = "billboard"
	desc = "A advertisement billboard."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/32x64_urbanbillboards.dmi'
	icon_state = "billboard2"

/obj/structure/billboard/billboardsmedium/billboard3
	name = "billboard"
	desc = "A advertisement billboard."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/32x64_urbanbillboards.dmi'
	icon_state = "billboard3"

/obj/structure/billboard/billboardsmedium/billboard4
	name = "billboard"
	desc = "A advertisement billboard."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/32x64_urbanbillboards.dmi'
	icon_state = "billboard4"

// Big Road Signs
/obj/structure/billboard/bigroadsigns
	name = "road sign"
	desc = "A road sign."
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x64_urbanrandomprops.dmi'
	icon_state = "roadsign_1"
	bound_width = 64
	bound_height = 32
	density = FALSE
	max_integrity = 200
	anchored = TRUE
	layer = 8

/obj/structure/billboard/bigroadsigns/road_sign_1
	icon_state = "roadsign_1"

/obj/structure/billboard/bigroadsigns/road_sign_2
	icon_state = "roadsign_2"

// Car Factory

/obj/structure/prop/urban/factory
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/64x64_urbanrandomprops.dmi'
	icon_state = "factory_roboticarm"

/obj/structure/prop/urban/factory/robotic_arm
	name = "Robotic arm"
	desc = "A robotic arm used in the construction of 'Meridian' Automobiles."
	icon_state = "factory_roboticarm"
	bound_width = 64
	bound_height = 32
	anchored = TRUE

/obj/structure/prop/urban/factory/robotic_arm/flipped
	icon_state = "factory_roboticarm2"

/obj/structure/prop/urban/factory/conveyor_belt
	name = "large conveyor belt"
	desc = "A large conveyor belt used in industrial factories."
	icon_state = "factory_conveyer"
	density = FALSE


// Hybrisa Lattice

/obj/structure/lattice/lattice_prop
	desc = "A support lattice."
	name = "lattice"
	icon = 'modular_np_lethal/massive_map_assets/icons/obj/props/urban_lattice.dmi'
	icon_state = "lattice1"
	density = FALSE
	layer = RIPPLE_LAYER
	max_integrity = 6000

/obj/structure/lattice/lattice_prop/lattice_1
	icon_state = "lattice1"

/obj/structure/lattice/lattice_prop/lattice_2
	icon_state = "lattice2"

/obj/structure/lattice/lattice_prop/lattice_3
	icon_state = "lattice3"

/obj/structure/lattice/lattice_prop/lattice_4
	icon_state = "lattice4"

/obj/structure/lattice/lattice_prop/lattice_5
	icon_state = "lattice5"

/obj/structure/lattice/lattice_prop/lattice_6
	icon_state = "lattice6"
