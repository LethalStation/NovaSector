GLOBAL_DATUM(colored_assistant, /datum/colored_assistant)

/*
Assistant
*/
/datum/job/assistant
	title = JOB_ASSISTANT
	description = "Scrap an abandoned underground facility for all that it's worth, or die trying."
	faction = FACTION_STATION
	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely nobody"
	exp_granted_type = EXP_TYPE_CREW
	outfit = /datum/outfit/job/gakster
	paycheck = 0 // GET A REAL JOB

	paycheck_department = ACCOUNT_CIV
	display_order = JOB_DISPLAY_ORDER_ASSISTANT

	liver_traits = list(TRAIT_MAINTENANCE_METABOLISM)

	department_for_prefs = /datum/job_department/assistant

	family_heirlooms = list(/obj/item/storage/toolbox/mechanical/old/heirloom, /obj/item/clothing/gloves/cut/heirloom)

	job_flags = STATION_JOB_FLAGS
	rpg_title = "Lout"

/datum/outfit/job/gakster
	name = "Scavenger"
	jobtype = /datum/job/assistant
	id_trim = /datum/id_trim/job/assistant

	shoes = /obj/item/clothing/shoes/jackboots/frontier_colonist
	gloves = /obj/item/clothing/gloves/frontier_colonist
	uniform = /obj/item/clothing/under/frontier_colonist
	mask = /obj/item/clothing/mask/gas/sechailer/half_mask
	glasses = /obj/item/clothing/glasses/heat
	backpack = /obj/item/storage/backpack/industrial/frontier_colonist
	satchel = /obj/item/storage/backpack/industrial/frontier_colonist/satchel
	messenger = /obj/item/storage/backpack/industrial/frontier_colonist/messenger
	duffelbag = /obj/item/storage/backpack/industrial/frontier_colonist
	neck = /obj/item/clothing/neck/link_scryer/loaded/ultra

/obj/item/clothing/neck/link_scryer/loaded/ultra/Initialize(mapload)
	. = ..()
	if(cell)
		QDEL_NULL(cell)

	cell = new /obj/item/stock_parts/cell/infinite/abductor(src)
