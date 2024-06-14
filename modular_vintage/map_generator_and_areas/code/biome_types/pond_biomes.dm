/datum/biome/vintage/water_pond
	open_turf_type = /turf/open/water/vintage
	closed_turf_type = null

	weighted_flora_spawn_list = list()
	weighted_feature_spawn_list = list(
		/obj/effect/spawner/random/rock_and_roll = 3,
		/obj/effect/spawner/random/rock_and_roll/super = 2,
		/obj/effect/spawner/random/rock_and_roll/lots_of_them = 1,
	)

	mob_spawn_chance = 0
	flora_spawn_chance = 0
	feature_spawn_chance = 10

/datum/biome/vintage/water_pond_surroundings
	open_turf_type = /turf/open/misc/fire_clay
	closed_turf_type = null

	weighted_flora_spawn_list = list()
	weighted_feature_spawn_list = list()

	mob_spawn_chance = 0
	flora_spawn_chance = 0
	feature_spawn_chance = 0

/datum/biome/vintage/the_slop
	open_turf_type = /turf/open/misc/muck_slop
	closed_turf_type = null

	weighted_flora_spawn_list = list()
	weighted_feature_spawn_list = list()

	mob_spawn_chance = 0
	flora_spawn_chance = 0
	feature_spawn_chance = 0
