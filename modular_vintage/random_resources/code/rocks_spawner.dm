/obj/effect/spawner/random/rock_and_roll
	name = "Random Rocks Spawner"
	loot = list(
		/obj/item/vintage_stone = 4,
		/obj/item/vintage_stone/flint = 1,
	)
	spawn_random_offset = TRUE
	spawn_loot_count = 3
	spawn_scatter_radius = 1

/obj/effect/spawner/random/rock_and_roll/super
	name = "Random Rocks Spawner +"
	spawn_loot_count = 5

/obj/effect/spawner/random/rock_and_roll/lots_of_them
	name = "Random Rocks Spawner ++"
	spawn_loot_count = 7
	spawn_scatter_radius = 2
