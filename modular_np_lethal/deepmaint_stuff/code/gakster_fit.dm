/datum/job/assistant
	title = "Scavenger"
	description = "Scrap an abandoned underground facility for all that it's worth, or die trying."
	supervisors = "absolutely nobody"
	outfit = /datum/outfit/job/gakster
	alt_titles = null

/datum/outfit/job/gakster
	name = "Scavenger"
	jobtype = /datum/job/assistant
	id_trim = /datum/id_trim/job/assistant
	belt = null

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

// Makes every other job have no slots

/datum/job/New()
	. = ..()
	total_positions = 0
	spawn_positions = 0
