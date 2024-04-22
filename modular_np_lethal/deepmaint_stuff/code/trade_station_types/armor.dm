/obj/structure/epic_loot_crafting_bench/armor
	name = "armor trade station"
	desc = "A direct connection to an underworld merchant known as either 'outfitter' or 'pac-3', \
		who will exchange goods for various pieces of wearable equipment and gear."
	icon_state = "trade_gear"

	allowed_choices = list(
		// Glasses
		/datum/crafting_bench_recipe_real/coolglasses,
		/datum/crafting_bench_recipe_real/nvg,
		/datum/crafting_bench_recipe_real/thermals,
		// Armor
		/datum/crafting_bench_recipe_real/flak_jacket,
		/datum/crafting_bench_recipe_real/flak_helmet,
		/datum/crafting_bench_recipe_real/soft_vest,
		/datum/crafting_bench_recipe_real/un_helmet,
		/datum/crafting_bench_recipe_real/sacrificial_vest,
		/datum/crafting_bench_recipe_real/sacrificial_helmet,
		// Headsets
		/datum/crafting_bench_recipe_real/talker_set,
		/datum/crafting_bench_recipe_real/bowman,
	)

// Glasses

/datum/crafting_bench_recipe_real/coolglasses
	recipe_name = "sunglasses"
	recipe_requirements = list(
		/obj/item/epic_loot/slim_diary = 1,
	)
	resulting_item = /obj/item/clothing/glasses/sunglasses/big

/datum/crafting_bench_recipe_real/nvg
	recipe_name = "night vision goggles"
	recipe_requirements = list(
		/obj/item/epic_loot/signal_amp = 1,
		/obj/item/epic_loot/current_converter = 1,
	)
	resulting_item = /obj/item/clothing/glasses/thermal

/datum/crafting_bench_recipe_real/thermals
	recipe_name = "thermal vision goggles"
	recipe_requirements = list(
		/obj/item/epic_loot/cold_weld = 1,
		/obj/item/epic_loot/signal_amp = 1,
		/obj/item/epic_loot/thermal_camera = 1,
	)
	resulting_item = /obj/item/clothing/glasses/thermal

// Armor

/datum/crafting_bench_recipe_real/flak_jacket
	recipe_name = "flak jacket"
	recipe_requirements = list(
		/obj/item/epic_loot/aramid = 1,
	)
	resulting_item = /obj/item/clothing/suit/frontier_colonist_flak

/datum/crafting_bench_recipe_real/flak_helmet
	recipe_name = "soft helmet"
	recipe_requirements = list(
		/obj/item/epic_loot/aramid = 1,
	)
	resulting_item = /obj/item/clothing/head/frontier_colonist_helmet

/datum/crafting_bench_recipe_real/soft_vest
	recipe_name = "soft armor vest"
	recipe_requirements = list(
		/obj/item/epic_loot/ripstop = 1,
		/obj/item/epic_loot/cordura = 1,
	)
	resulting_item = /obj/item/clothing/suit/armor/sf_peacekeeper/debranded

/datum/crafting_bench_recipe_real/un_helmet
	recipe_name = "ballistic helmet"
	recipe_requirements = list(
		/obj/item/epic_loot/electric_motor = 1,
		/obj/item/epic_loot/cordura = 1,
	)
	resulting_item = /obj/item/clothing/head/helmet/sf_peacekeeper/debranded

/datum/crafting_bench_recipe_real/sacrificial_vest
	recipe_name = "sacrificial armor vest"
	recipe_requirements = list(
		/obj/item/epic_loot/shuttle_gyro = 1,
	)
	resulting_item = /obj/item/clothing/suit/armor/sf_sacrificial

/datum/crafting_bench_recipe_real/sacrificial_helmet
	recipe_name = "sacrificial helmet"
	recipe_requirements = list(
		/obj/item/epic_loot/shuttle_battery = 1,
	)
	resulting_item = /obj/item/clothing/head/helmet/sf_sacrificial/spawns_with_shield

// Headsets

/datum/crafting_bench_recipe_real/talker_set
	recipe_name = "frontier headset"
	recipe_requirements = list(
		/obj/item/epic_loot/fuel_conditioner = 1,
	)
	resulting_item = /obj/item/radio/headset/headset_frontier_colonist

/datum/crafting_bench_recipe_real/bowman
	recipe_name = "bowman headset"
	recipe_requirements = list(
		/obj/item/epic_loot/phased_array = 2,
	)
	resulting_item = /obj/item/radio/headset/headset_sec/alt
