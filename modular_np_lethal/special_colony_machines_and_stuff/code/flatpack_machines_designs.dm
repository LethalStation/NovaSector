// Machine categories

#define FABRICATOR_CATEGORY_FLATPACK_MACHINES "/Flatpacked Machines"
#define FABRICATOR_SUBCATEGORY_MANUFACTURING "/Manufacturing"
#define FABRICATOR_SUBCATEGORY_POWER "/Power"
#define FABRICATOR_SUBCATEGORY_MATERIALS "/Materials"
#define FABRICATOR_SUBCATEGORY_ATMOS "/Atmospherics"
#define FABRICATOR_SUBCATEGORY_MEDICAL "/Medical"

// Techweb node that shouldnt show up anywhere ever specifically for the fabricator to work with

/datum/techweb_node/colony_fabricator_flatpacks_lethalstation
	id = "colony_fabricator_flatpacks_lethalstation"
	display_name = "Colony Fabricator Flatpack Designs"
	description = "Contains all of the colony fabricator's flatpack machine designs."
	design_ids = list(
		"flatpack_thumper",
		"flatpack_organics_printer",
		"flatpack_gps_beacon",
		"flatpack_afk_pod",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000000000000000) // God save you
	hidden = TRUE
	show_on_wiki = FALSE
	starting_node = TRUE

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

#undef FABRICATOR_CATEGORY_FLATPACK_MACHINES
#undef FABRICATOR_SUBCATEGORY_MANUFACTURING
#undef FABRICATOR_SUBCATEGORY_POWER
#undef FABRICATOR_SUBCATEGORY_MATERIALS
#undef FABRICATOR_SUBCATEGORY_ATMOS
#undef FABRICATOR_SUBCATEGORY_MEDICAL
