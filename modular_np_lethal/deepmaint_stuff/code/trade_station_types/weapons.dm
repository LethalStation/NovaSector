/obj/structure/epic_loot_crafting_bench/war
	name = "weapons trade station"
	desc = "A direct connection to an underworld trader known only as 'warlord', \
		who will exchange goods for many different types of weapons of war."
	icon_state = "trade_war"

	allowed_choices = list(
		// Grenades
		/datum/crafting_bench_recipe_real/concussion_grenade,
		/datum/crafting_bench_recipe_real/pipe_bomb,
		/datum/crafting_bench_recipe_real/stingbang,
		/datum/crafting_bench_recipe_real/flashbang,
		// Gun stuff
		/datum/crafting_bench_recipe_real/suppressor,
		/datum/crafting_bench_recipe_real/eland,
		/datum/crafting_bench_recipe_real/bobr,
		/datum/crafting_bench_recipe_real/projector,
		/datum/crafting_bench_recipe_real/sindano,
		/datum/crafting_bench_recipe_real/shotgun,
		/datum/crafting_bench_recipe_real/sakhno,
		/datum/crafting_bench_recipe_real/boxer,
	)

// Grenades

/datum/crafting_bench_recipe_real/concussion_grenade
	recipe_name = "concussion grenade"
	recipe_requirements = list(
		/obj/item/epic_loot/grenade_fuze = 1,
		/obj/item/epic_loot/plasma_explosive = 1,
	)
	resulting_item = /obj/item/grenade/syndieminibomb/concussion

/datum/crafting_bench_recipe_real/pipe_bomb
	recipe_name = "improvised explosive"
	recipe_requirements = list(
		/obj/item/epic_loot/grenade_fuze = 1,
		/obj/item/epic_loot/water_filter = 1,
	)
	resulting_item = /obj/item/grenade/iedcasing/spawned

/datum/crafting_bench_recipe_real/stingbang
	recipe_name = "stingbang"
	recipe_requirements = list(
		/obj/item/epic_loot/thermometer = 1,
		/obj/item/epic_loot/nail_box = 1,
	)
	resulting_item = /obj/item/grenade/stingbang

/datum/crafting_bench_recipe_real/flashbang
	recipe_name = "flashbang"
	recipe_requirements = list(
		/obj/item/epic_loot/thermometer = 1,
	)
	resulting_item = /obj/item/grenade/flashbang

// Gun stuff

/datum/crafting_bench_recipe_real/suppressor
	recipe_name = "suppressor"
	recipe_requirements = list(
		/obj/item/epic_loot/water_filter = 1,
	)
	resulting_item = /obj/item/suppressor/standard

/datum/crafting_bench_recipe_real/eland
	recipe_name = "eland revolver"
	recipe_requirements = list(
		/obj/item/epic_loot/device_fan = 2,
	)
	resulting_item = /obj/item/gun/ballistic/revolver/sol

/datum/crafting_bench_recipe_real/bobr
	recipe_name = "12ga revolver"
	recipe_requirements = list(
		/obj/item/epic_loot/display = 1,
	)
	resulting_item = /obj/item/gun/ballistic/revolver/shotgun_revolver

/datum/crafting_bench_recipe_real/projector
	recipe_name = "plasma projector"
	recipe_requirements = list(
		/obj/item/epic_loot/display_broken = 2,
	)
	resulting_item = /obj/item/gun/ballistic/automatic/pistol/plasma_thrower

/datum/crafting_bench_recipe_real/sindano
	recipe_name = "sindano submachinegun"
	recipe_requirements = list(
		/obj/item/epic_loot/graphics = 1,
	)
	resulting_item = /obj/item/gun/ballistic/automatic/sol_smg

/datum/crafting_bench_recipe_real/shotgun
	recipe_name = "renoster shotgun"
	recipe_requirements = list(
		/obj/item/epic_loot/military_circuit = 1,
		/obj/item/epic_loot/civilian_circuit = 1,
	)
	resulting_item = /obj/item/gun/ballistic/shotgun/riot/sol

/datum/crafting_bench_recipe_real/sakhno
	recipe_name = "sakhno M2442 rifle"
	recipe_requirements = list(
		/obj/item/epic_loot/processor = 1,
	)
	resulting_item = /obj/item/gun/ballistic/rifle/boltaction/surplus

/datum/crafting_bench_recipe_real/boxer
	recipe_name = "bogseo submachinegun"
	recipe_requirements = list(
		/obj/item/epic_loot/power_supply = 1,
		/obj/item/epic_loot/disk_drive = 1,
	)
	resulting_item = /obj/item/gun/ballistic/automatic/xhihao_smg
