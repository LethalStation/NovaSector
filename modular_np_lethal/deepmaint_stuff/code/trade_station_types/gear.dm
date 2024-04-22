/obj/structure/epic_loot_crafting_bench/gear
	name = "equipment trade station"
	desc = "A direct connection to an underworld supplier known only as 'tekkie', \
		who will exchange goods for various pieces of important equipment."
	icon_state = "trade_gear"

	allowed_choices = list(
		/datum/crafting_bench_recipe_real/binoculars,
		/datum/crafting_bench_recipe_real/duffelpack,
		/datum/crafting_bench_recipe_real/dogtag_case,
		/datum/crafting_bench_recipe_real/sick_case,
		/datum/crafting_bench_recipe_real/docs_bag,
		/datum/crafting_bench_recipe_real/ballistic_shield,
		/datum/crafting_bench_recipe_real/black_keycard,
	)

// Misc tools

/datum/crafting_bench_recipe_real/binoculars
	recipe_name = "binoculars"
	recipe_requirements = list(
		/obj/item/epic_loot/ssd = 1,
	)
	resulting_item = /obj/item/binoculars

/datum/crafting_bench_recipe_real/duffelpack
	recipe_name = "assault pack"
	recipe_requirements = list(
		/obj/item/epic_loot/hdd = 1,
	)
	resulting_item = /obj/item/storage/backpack/duffelbag/syndie/nri/captain

/datum/crafting_bench_recipe_real/dogtag_case
	recipe_name = "tag case"
	recipe_requirements = list(
		/obj/item/epic_loot/military_flash = 1,
	)
	resulting_item = /obj/item/storage/epic_loot_tag_case

/datum/crafting_bench_recipe_real/sick_case
	recipe_name = "organizational pouch"
	recipe_requirements = list(
		/obj/item/epic_loot/corpo_folder = 1,
	)
	resulting_item = /obj/item/storage/epic_loot_org_pouch

/datum/crafting_bench_recipe_real/docs_bag
	recipe_name = "organizational pouch"
	recipe_requirements = list(
		/obj/item/epic_loot/silver_chainlet = 1,
		/obj/item/epic_loot/gold_chainlet = 1,
	)
	resulting_item = /obj/item/storage/epic_loot_docs_case

/datum/crafting_bench_recipe_real/ballistic_shield
	recipe_name = "ballistic shield"
	recipe_requirements = list(
		/obj/item/epic_loot/diary = 1,
	)
	resulting_item = /obj/item/shield/ballistic

/datum/crafting_bench_recipe_real/black_keycard
	recipe_name = "black keycard"
	recipe_requirements = list(
		/obj/item/epic_loot/intel_folder = 3,
	)
	resulting_item = /obj/item/keycard/epic_loot/black
