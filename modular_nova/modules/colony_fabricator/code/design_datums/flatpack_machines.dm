// Machine categories

#define FABRICATOR_CATEGORY_FLATPACK_MACHINES "/Flatpacked Machines"
#define FABRICATOR_SUBCATEGORY_MANUFACTURING "/Manufacturing"
#define FABRICATOR_SUBCATEGORY_MEDICAL "/Medical"
#define FABRICATOR_SUBCATEGORY_POWER "/Power"
#define FABRICATOR_SUBCATEGORY_MATERIALS "/Materials"
#define FABRICATOR_SUBCATEGORY_ATMOS "/Atmospherics"

// Techweb node that shouldnt show up anywhere ever specifically for the fabricator to work with

/datum/techweb_node/colony_fabricator_flatpacks
	id = "colony_fabricator_flatpacks"
	display_name = "Colony Fabricator Flatpack Designs"
	description = "Contains all of the colony fabricator's flatpack machine designs."
	design_ids = list(
		"flatpack_solar_panel",
		"flatpack_solar_tracker",
		"flatpack_arc_furnace",
		"flatpack_colony_fab",
		"flatpack_station_battery",
		"flatpack_station_battery_large",
		"flatpack_fuel_generator",
		"flatpack_rtg",
		"flatpack_thermo",
		"flatpack_ore_silo",
		"flatpack_turbine_team_fortress_two",
		"flatpack_bootleg_teg",
		"flatpack_thumper",
		"flatpack_organics_printer",
		"flatpack_gps_beacon",
		"flatpack_afk_pod",
		"flatpack_cryopod",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000000000000000) // God save you
	hidden = TRUE
	show_on_wiki = FALSE
	starting_node = TRUE

// Lets the colony lathe make more colony lathes but at very hihg cost, for fun

/datum/design/flatpack_colony_fabricator
	name = "Flat-Packed Colony Fabricator"
	desc = "A deployable fabricator capable of producing other flat-packed machines and other special equipment tailored for \
		rapidly constructing functional structures given resources and power. While it cannot be upgraded, it can be repacked \
		and moved to any location you see fit."
	id = "flatpack_colony_fab"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 10,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 7.5,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 2.5,
		/datum/material/gold = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/flatpacked_machine
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_MANUFACTURING,
	)
	construction_time = 2 MINUTES

// Solar panels and trackers

/datum/design/flatpack_solar_panel
	name = "Flat-Packed Solar Panel"
	desc = "A deployable solar panel, able to be repacked after placement for relocation or recycling."
	id = "flatpack_solar_panel"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 1.5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 1,
	)
	build_path = /obj/item/flatpacked_machine/solar
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_POWER,
	)
	construction_time = 5 SECONDS

/datum/design/flatpack_solar_tracker
	name = "Flat-Packed Solar Tracker"
	desc = "A deployable solar tracker, able to be repacked after placement for relocation or recycling."
	id = "flatpack_solar_tracker"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT * 3.5,
	)
	build_path = /obj/item/flatpacked_machine/solar_tracker
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_POWER,
	)
	construction_time = 7 SECONDS

// Arc furance

/datum/design/flatpack_arc_furnace
	name = "Flat-Packed Arc Furnace"
	desc = "A deployable furnace for refining ores. While slower and less safe than conventional refining methods, \
		it multiplies the output of refined materials enough to still outperform simply recycling ore."
	id = "flatpack_arc_furnace"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 7.5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 3,
	)
	build_path = /obj/item/flatpacked_machine/arc_furnace
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_MATERIALS,
	)
	construction_time = 15 SECONDS

// Power storage structures

/datum/design/flatpack_power_storage
	name = "Flat-Packed Stationary Battery"
	desc = "A deployable station-scale power cell with an overall low capacity, but high input and output rate."
	id = "flatpack_station_battery"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 7,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/silver = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/flatpacked_machine/station_battery
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_POWER,
	)
	construction_time = 20 SECONDS

/datum/design/flatpack_power_storage_large
	name = "Flat-Packed Large Stationary Battery"
	desc = "A deployable station-scale power cell with an overall extremely high capacity, but low input and output rate."
	id = "flatpack_station_battery_large"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 12,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 4,
		/datum/material/gold = SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/flatpacked_machine/large_station_battery
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_POWER,
	)
	construction_time = 40 SECONDS

// PACMAN generator but epic!!

/datum/design/flatpack_solids_generator
	name = "Flat-Packed S.O.F.I.E. Generator"
	desc = "A deployable plasma-burning generator capable of outperforming even upgraded P.A.C.M.A.N. type generators, \
		at expense of creating hot carbon dioxide exhaust."
	id = "flatpack_fuel_generator"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT,
		/datum/material/gold = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/flatpacked_machine/fuel_generator
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_POWER,
	)
	construction_time = 30 SECONDS

// Buildable RTG that is quite radioactive

/datum/design/flatpack_rtg
	name = "Flat-Packed Radioisotope Thermoelectric Generator"
	desc = "A deployable radioisotope generator capable of producing a practically free trickle of power. \
		Free if you can tolerate the radiation that the machine makes while deployed, that is."
	id = "flatpack_rtg"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 15,
		/datum/material/uranium = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/plasma = HALF_SHEET_MATERIAL_AMOUNT,
		/datum/material/gold = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/flatpacked_machine/rtg
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_POWER,
	)
	construction_time = 30 SECONDS

// Thermomachine with decent temperature change rate, but a limited max/min temperature

/datum/design/flatpack_thermomachine
	name = "Flat-Packed Atmospheric Temperature Regulator"
	desc = "A deployable temperature control device for use with atmospherics pipe systems. \
		Limited in its temperature range, however comes with a higher than normal heat capacity."
	id = "flatpack_thermo"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 7.5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/flatpacked_machine/thermomachine
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_ATMOS,
	)
	construction_time = 20 SECONDS

// Ore silo except it beeps

/datum/design/flatpack_ore_silo
	name = "Flat-Packed Ore Silo"
	desc = "An all-in-one materials management solution. Connects resource-using machines \
		through a network of distrobution systems."
	id = "flatpack_ore_silo"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 5,
	)
	build_path = /obj/item/flatpacked_machine/ore_silo
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_MATERIALS,
	)
	construction_time = 1 MINUTES

// Wind turbine, produces tiny amounts of power when placed outdoors in an atmosphere, but makes significantly more if there's a storm in that area

/datum/design/flatpack_turbine_team_fortress_two
	name = "Flat-Packed Miniature Wind Turbine"
	desc = "A deployable fabricator capable of producing other flat-packed machines and other special equipment tailored for \
		rapidly constructing functional structures given resources and power. While it cannot be upgraded, it can be repacked \
		and moved to any location you see fit. This one makes specialized engineering designs and tools."
	id = "flatpack_turbine_team_fortress_two"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/gold = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/flatpacked_machine/wind_turbine
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_POWER,
	)
	construction_time = 30 SECONDS

// Stirling generator, kinda like a TEG but on a smaller scale and producing less insane amounts of power

/datum/design/flatpack_bootleg_teg
	name = "Flat-Packed Stirling Generator"
	desc = "An industrial scale stirling generator. Stirling generators operate by intaking \
		hot gasses through their inlet pipes, and being cooled by the ambient air around them. \
		The cycling compression and expansion that this creates creates power, and this one is made \
		to make power on the scale of small stations and outposts."
	id = "flatpack_bootleg_teg"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 15,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/plasma = SHEET_MATERIAL_AMOUNT * 10,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/gold = SHEET_MATERIAL_AMOUNT * 5,
	)
	build_path = /obj/item/flatpacked_machine/stirling_generator
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_POWER,
	)
	construction_time = 2 MINUTES

// The ore thumper, it hits the ground really hard and ores come up

/datum/design/flatpack_ore_thumper
	name = "Flat-Packed Ore Thumper"
	desc = "A frame with a heavy block of metal suspended atop a pipe. \
		Must be deployed outdoors and given a wired power connection. \
		Forces pressurized gas into the ground which brings up buried resources."
	id = "flatpack_thumper"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 15,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT,
		/datum/material/gold = HALF_SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/flatpacked_machine/ore_thumper
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_MATERIALS,
	)
	construction_time = 2 MINUTES

// The organics printer, aka we have colony core at home, aka we have biogenerator at home

/datum/design/flatpack_organics_printer
	name = "Organic Materials Printer Parts Kit"
	desc = "An advanced machine seen in frontier outposts and colonies capable of turning organic plant matter into \
		reagents and items of use that a fabricator can't typically make. While the exact designs these machines have differs from \
		location to location, and upon who designed them, this one should be able to at the very least provide you with \
		some clothing, and basic materials."
	id = "flatpack_organics_printer"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 10,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/plasma = SHEET_MATERIAL_AMOUNT,
		/datum/material/gold = SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/flatpacked_machine/stirling_generator
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_MANUFACTURING,
	)
	construction_time = 1 MINUTES

// It's a GPS but stationary

/datum/design/flatpack_gps_beacon
	name = "Packed GPS Beacon"
	desc = "A GPS beacon, anchored to the ground to prevent loss or accidental movement."
	id = "flatpack_gps_beacon"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 1,
	)
	build_path = /obj/item/flatpacked_machine/gps_beacon
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES,
	)
	construction_time = 15 SECONDS

// A pod with atmosphere that puts you on stasis, for going afk in

/datum/design/flatpack_afk_pod
	name = "Cryostasis Pod Parts Kit"
	desc = "The parts to build a cryostasis pod, a pod where you can sleep theoretically forever in a safe environment, so long as there is power."
	id = "flatpack_afk_pod"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/silver = SHEET_MATERIAL_AMOUNT,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/flatpacked_machine/afk_pod
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_MEDICAL,
	)
	construction_time = 15 SECONDS

// A pod with atmosphere that puts you on stasis, for going afk in

/datum/design/flatpack_cryopod
	name = "Mounted Cryogenic Freezer"
	desc = "A wall-mount for a cryogenic freezer, able to store personnel that will be effected by extended periods of 'oh so eepy sleepy'."
	id = "flatpack_cryopod"
	build_type = COLONY_FABRICATOR
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/gold = SHEET_MATERIAL_AMOUNT,
	)
	build_path = /obj/item/wallframe/wall_cryopod
	category = list(
		RND_CATEGORY_INITIAL,
		FABRICATOR_CATEGORY_FLATPACK_MACHINES + FABRICATOR_SUBCATEGORY_MEDICAL,
	)
	construction_time = 15 SECONDS

#undef FABRICATOR_CATEGORY_FLATPACK_MACHINES
#undef FABRICATOR_SUBCATEGORY_MANUFACTURING
#undef FABRICATOR_SUBCATEGORY_POWER
#undef FABRICATOR_SUBCATEGORY_MATERIALS
#undef FABRICATOR_SUBCATEGORY_ATMOS
