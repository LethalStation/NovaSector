/area/shuttle/personally_bought
	name = "Personal Shuttle Debug Area"
	requires_power = TRUE
	area_limited_icon_smoothing = /area/shuttle/personally_bought
	// Ambience brought to you by the nri shuttle, thanks guys
	ambient_buzz = 'modular_nova/modules/encounters/sounds/amb_ship_01.ogg'
	ambient_buzz_vol = 50
	ambientsounds = list(
		'modular_nova/modules/encounters/sounds/alarm_radio.ogg',
		'modular_nova/modules/encounters/sounds/gear_loop.ogg',
		'modular_nova/modules/encounters/sounds/gear_start.ogg',
		'modular_nova/modules/encounters/sounds/gear_stop.ogg',
		'modular_nova/modules/encounters/sounds/intercom_loop.ogg',
	)
	min_ambience_cooldown = 10 SECONDS
	max_ambience_cooldown = 30 SECONDS

/obj/docking_port/mobile/personally_bought
	name = "personal shuttle"
	shuttle_id = "shuttle_personal"
	callTime = 15 SECONDS
	rechargeTime = 30 SECONDS
	prearrivalTime = 5 SECONDS
	preferred_direction = EAST
	dir = NORTH
	port_direction = EAST
	movement_force = list(
		"KNOCKDOWN" = 2,
		"THROW" = 0,
	)

/obj/item/circuitboard/computer/personally_bought
	name = "Personal Ship Console"
	greyscale_colors = CIRCUIT_COLOR_GENERIC
	build_path = /obj/machinery/computer/shuttle/personally_bought

/obj/machinery/computer/shuttle/personally_bought
	name = "Personal Ship Console"
	desc = "Used to control the ship its currently in, ideally."
	circuit = /obj/item/circuitboard/computer/personally_bought
	shuttleId = "shuttle_personal"
	possible_destinations = "whiteship_away;whiteship_home;whiteship_z4;whiteship_waystation;whiteship_lavaland;personal_ship_custom"
	/// What our GPS tag name is
	var/shuttle_gps_tag = "Shuttle Homing Beacon"

/obj/machinery/computer/shuttle/personally_bought/Initialize(mapload, obj/item/circuitboard/C)
	. = ..()
	AddComponent(/datum/component/gps, shuttle_gps_tag)

/obj/machinery/computer/shuttle/personally_bought/mothership
	name = "Mothership Control Console"
	desc = "Used to control the ship its currently in, ideally."
	circuit = /obj/item/circuitboard/computer/personally_bought
	shuttleId = "shuttle_personal"
	possible_destinations = "whiteship_away;whiteship_home;whiteship_z4;whiteship_waystation;whiteship_lavaland;personal_ship_custom"
	shuttle_gps_tag = "Mothership Homing Beacon"

/obj/machinery/computer/camera_advanced/shuttle_docker/personally_bought
	name = "Personal Ship Navigation Computer"
	desc = "Used to designate a precise transit location for the ship its currently in, ideally."
	shuttleId = "shuttle_personal"
	lock_override = NONE
	shuttlePortId = "personal_ship_custom"
	jump_to_ports = list("whiteship_away" = 1, "whiteship_home" = 1, "whiteship_z4" = 1, "whiteship_waystation" = 1)
	designate_time = 5 SECONDS

/obj/machinery/computer/camera_advanced/shuttle_docker/personally_bought/mothership
	name = "Moterhship Navigation Computer"
	desc = "Used to designate a precise transit location for the ship its currently in, ideally."
	shuttleId = "shuttle_personal"
	lock_override = NONE
	shuttlePortId = "personal_ship_custom"
	jump_to_ports = list("whiteship_away" = 1, "whiteship_home" = 1, "whiteship_z4" = 1, "whiteship_waystation" = 1)
	designate_time = 10 SECONDS

// Decorative parts for the ships

/turf/open/floor/engine/hull/shuttle_white_plate
	icon = 'modular_np_lethal/ships_r_us/icons/ship_items.dmi'
	icon_state = "hull"

/obj/structure/railing/eva_handhold
	name = "EVA handrail"
	desc = "Basic handrailing meant to keep idiots like you from floating off into space."
	icon = 'modular_np_lethal/ships_r_us/icons/ship_items.dmi'
	icon_state = "eva_rail"
	max_integrity = 50

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/railing/eva_handhold, 17)

// Buttons and blast doors galore

// Exterior windows

/obj/machinery/button/door/personal_shuttle_windows
	name = "Exterior Window Shutter Control"
	id = "personal_shuttle_ext_window"

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/button/door/personal_shuttle_windows, 28)

/obj/machinery/door/poddoor/preopen/personal_shuttle_windows
	id = "personal_shuttle_ext_window"

// Cargo bays/hangars, one through four

// Bay one

/obj/machinery/button/door/personal_shuttle_bay_one
	name = "Bay 1 External Shutter Control"
	id = "personal_shuttle_bay_one"

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/button/door/personal_shuttle_bay_one, 28)

/obj/machinery/door/poddoor/preopen/personal_bay_one
	id = "personal_shuttle_bay_one"

// Bay two

/obj/machinery/button/door/personal_shuttle_bay_two
	name = "Bay 2 External Shutter Control"
	id = "personal_shuttle_bay_two"

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/button/door/personal_shuttle_bay_two, 28)

/obj/machinery/door/poddoor/preopen/personal_bay_two
	id = "personal_shuttle_bay_two"

// Bay three

/obj/machinery/button/door/personal_shuttle_bay_three
	name = "Bay 3 External Shutter Control"
	id = "personal_shuttle_bay_three"

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/button/door/personal_shuttle_bay_three, 28)

/obj/machinery/door/poddoor/preopen/personal_bay_three
	id = "personal_shuttle_bay_three"

// Bay four

/obj/machinery/button/door/personal_shuttle_bay_four
	name = "Bay 4 External Shutter Control"
	id = "personal_shuttle_bay_four"

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/button/door/personal_shuttle_bay_four, 28)

/obj/machinery/door/poddoor/preopen/personal_bay_four
	id = "personal_shuttle_bay_four"

// Emergency Equipment lockers

/obj/structure/closet/emcloset/personal_shuttle

/obj/structure/closet/emcloset/personal_shuttle/PopulateContents()
	new /obj/item/storage/toolbox/emergency(src)
	new /obj/item/storage/medkit/civil_defense/stocked(src)
	new /obj/item/storage/medkit/civil_defense/stocked(src)
	new /obj/item/storage/medkit/frontier/stocked(src)
	new /obj/item/storage/medkit/robotic_repair/stocked(src)
	new /obj/item/radio(src)
	new /obj/item/radio(src)
	new /obj/item/folded_navigation_gigabeacon(src)
	new /obj/item/flatpacked_machine/gps_beacon(src)
	new /obj/item/crowbar/large/doorforcer(src)

/obj/structure/closet/firecloset/personal_shuttle

/obj/structure/closet/firecloset/personal_shuttle/PopulateContents()
	new /obj/item/clothing/mask/gas/atmos/frontier_colonist(src)
	new /obj/item/clothing/mask/gas/atmos/frontier_colonist(src)
	new /obj/item/tank/internals/emergency_oxygen/engi(src)
	new /obj/item/tank/internals/emergency_oxygen/engi(src)
	new /obj/item/flatpacked_machine/co2_cracker(src)
	new /obj/item/extinguisher/advanced(src)
	new /obj/item/holosign_creator/atmos(src)

/obj/structure/closet/secure_closet/personal_shuttle
	name = "damage control locker"

/obj/structure/closet/secure_closet/personal_shuttle/PopulateContents()
	new /obj/item/stack/sheet/plastic_wall_panel/ten(src)
	new /obj/item/storage/inflatable(src)
	new /obj/item/oxygen_candle/super(src)
	new /obj/item/grenade/chem_grenade/smart_metal_foam(src)
	new /obj/item/door_seal(src)
	new /obj/item/door_seal(src)
	new /obj/item/door_seal(src)

/obj/structure/closet/crate/engineering/electrical/personal_shuttle_backup_power
	name = "emergency power storage"

/obj/structure/closet/crate/engineering/electrical/personal_shuttle_backup_power/PopulateContents()
	new /obj/item/flatpacked_machine/fuel_generator(src)
	new /obj/item/stack/sheet/mineral/plasma/thirty(src)
	new /obj/item/flatpacked_machine/station_battery(src)
	new /obj/item/flatpacked_machine/rtg(src)
	new /obj/item/flatpacked_machine/rtg(src)

// Big oxygen candle lmao

/obj/item/oxygen_candle/super
	name = "large oxygen candle"
	processes_left = 100
	w_class = WEIGHT_CLASS_BULKY

/obj/item/oxygen_candle/super/Initialize(mapload)
	. = ..()
	transform = transform.Scale(1.5, 1.5)

// Suit storage unit for a free emergency eva suit

/obj/machinery/suit_storage_unit/industrial/personal_shuttle
	mask_type = /obj/item/clothing/mask/gas/atmos/frontier_colonist
	mod_type = /obj/item/mod/control/pre_equipped/frontier_colonist
	storage_type = /obj/item/tank/internals/oxygen/yellow

// Micro reactor but it's not insane

/obj/machinery/power/micro_reactor/personal_shuttle
	power_gen = 40 KILO WATTS
