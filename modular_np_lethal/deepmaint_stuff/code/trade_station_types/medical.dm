/obj/structure/epic_loot_crafting_bench/medical
	name = "medical trade station"
	desc = "A direct connection to an underworld doctor known only as 'archangel', who will exchange goods for \
		medical supplies and possibly even implants."
	icon_state = "trade_med"

	allowed_choices = list(
		/datum/crafting_bench_recipe_real/super_medkit,
		/datum/crafting_bench_recipe_real/super_medkit_ultra,
		/datum/crafting_bench_recipe_real/slewa,
	)

// Medical stuff

/datum/crafting_bench_recipe_real/super_medkit
	recipe_name = "satchel medical kit"
	recipe_requirements = list(
		/obj/item/epic_loot/eye_scope = 1,
	)
	resulting_item = /obj/item/storage/backpack/duffelbag/deforest_medkit/stocked

/datum/crafting_bench_recipe_real/super_medkit_ultra
	recipe_name = "advanced satchel medical kit"
	recipe_requirements = list(
		/obj/item/epic_loot/vein_finder = 1,
	)
	resulting_item = /obj/item/storage/backpack/duffelbag/deforest_medkit/stocked/super

/datum/crafting_bench_recipe_real/slewa
	recipe_name = "frontier first aid kit"
	recipe_requirements = list(
		/obj/item/epic_loot/press_pass = 1,
	)
	resulting_item = /obj/item/storage/medkit/frontier/stocked
