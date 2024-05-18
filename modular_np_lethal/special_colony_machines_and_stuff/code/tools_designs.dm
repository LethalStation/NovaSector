/datum/techweb_node/colony_fabricator_special_tools_lethalstation
	id = "colony_fabricator_tools"
	display_name = "Colony Fabricator Tool Designs"
	description = "Contains all of the colony fabricator's tool designs."
	design_ids = list(
		"colony_extraction_axe",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000000000000000) // God save you
	hidden = TRUE
	show_on_wiki = FALSE
	starting_node = TRUE

// It's the metal hydrogen axe except you'll actually see it once in a bazillion years

/datum/design/colony_extraction_axe
	name = "Emergency Extraction Axe"
	id = "colony_extraction_axe"
	build_type = COLONY_FABRICATOR
	build_path = /obj/item/fireaxe/metal_h2_axe/extraction_tool
	materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 3,
		/datum/material/plasma = SHEET_MATERIAL_AMOUNT,
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 5,
	)
	category = list(
		RND_CATEGORY_INITIAL,
		RND_CATEGORY_TOOLS + RND_SUBCATEGORY_TOOLS_ENGINEERING_ADVANCED,
	)
