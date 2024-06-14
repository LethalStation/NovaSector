/datum/biome/vintage/regular_soil
	open_turf_type = /turf/open/misc/regular_soil
	closed_turf_type = null

	weighted_flora_spawn_list = list()
	weighted_feature_spawn_list = list(
		/obj/effect/spawner/random/rock_and_roll = 3,
		/obj/effect/spawner/random/rock_and_roll/super = 2,
		/obj/effect/spawner/random/rock_and_roll/lots_of_them = 1,
	)

	mob_spawn_chance = 0
	flora_spawn_chance = 0
	feature_spawn_chance = 5

/datum/biome/vintage/cracked_earth
	open_turf_type = /turf/open/misc/dry_soil
	closed_turf_type = null

	weighted_flora_spawn_list = list()
	weighted_feature_spawn_list = list(
		/obj/effect/spawner/random/rock_and_roll = 3,
		/obj/effect/spawner/random/rock_and_roll/super = 2,
		/obj/effect/spawner/random/rock_and_roll/lots_of_them = 1,
	)

	mob_spawn_chance = 0
	flora_spawn_chance = 0
	feature_spawn_chance = 3

/datum/biome/vintage/desert
	open_turf_type = /turf/open/misc/desert_sand
	closed_turf_type = null

	weighted_flora_spawn_list = list()
	weighted_feature_spawn_list = list()

	mob_spawn_chance = 0
	flora_spawn_chance = 0
	feature_spawn_chance = 0
