#define BIOME_POND ( /datum/biome/vintage/water_pond )
#define BIOME_POND_SURROUNDINGS ( /datum/biome/vintage/water_pond_surroundings )
#define BIOME_SLOP ( /datum/biome/vintage/the_slop )
#define BIOME_REGULAR_SOIL ( /datum/biome/vintage/regular_soil )
#define BIOME_CRACKED_EARTH ( /datum/biome/vintage/cracked_earth )
#define BIOME_DE_DESERT ( /datum/biome/vintage/desert )

/datum/map_generator/vintage_surface_generator
	var/name = "DE_DESERT Surface Generator"

	/// Used to select "zoom" level into the perlin noise, higher numbers result in slower transitions
	var/perlin_zoom = 40
	/// The zoom level of the perlin generator for the dunegrass around the map, higher number = slower transition
	var/perlin_grass_zoom = 10
	/// List of turfs we ignore for grass generation
	var/list/no_flora_turfs = list(
		/turf/open/misc/desert_sand,
		/turf/open/water/vintage,
	)

/datum/map_generator/vintage_surface_generator/generate_terrain(list/turfs, area/generate_in)
	. = ..()

	var/mobs_allowed = (generate_in.area_flags & MOB_SPAWN_ALLOWED)

	var/biome_seed = rand(0, 50000)
	var/grass_seed = rand(0, 50000)

	var/start_time = REALTIMEOFDAY

	var/closed = FALSE

	// Makes rivers, REMEMBER TO UNCOMMENT THIS AT SOME POINT
	//spawn_rivers(generate_in.z, 7, /turf/open/water/stream, generate_in, 1, 1, 318, 318)

	for(var/iterated_turf in turfs) //Go through all the turfs and generate them
		if(!istype(iterated_turf, /turf/open/genturf))
			continue

		var/turf/gen_turf = iterated_turf

		var/perlin_x = gen_turf.x / perlin_zoom
		var/perlin_y = gen_turf.y / perlin_zoom

		var/biome_type = text2num(rustg_noise_get_at_coordinates("[biome_seed]", "[perlin_x]", "[perlin_y]"))

		var/datum/biome/selected_biome

		switch(biome_type)
			if(0 to 0.015)
				selected_biome = BIOME_POND
			if(0.015 to 0.05)
				selected_biome = BIOME_POND_SURROUNDINGS
			if(0.05 to 0.1)
				selected_biome = BIOME_SLOP
			if(0.1 to 0.25)
				selected_biome = BIOME_REGULAR_SOIL
			if(0.25 to 0.5)
				selected_biome = BIOME_CRACKED_EARTH
			if(0.5 to 1)
				selected_biome = BIOME_DE_DESERT

		selected_biome = SSmapping.biomes[selected_biome] //Get the instance of this biome from SSmapping
		selected_biome.generate_turf(gen_turf, closed, generate_in, mobs_allowed)

		CHECK_TICK

	for(var/iterated_turf in turfs) // Now we go through and add all the extra stuff
		// We won't even bother generating flora onto a turf we can't do flora on
		if(is_type_in_list(iterated_turf, no_flora_turfs))
			continue

		var/turf/our_turf = iterated_turf

		var/grass_perlin_x = our_turf.x / perlin_grass_zoom
		var/grass_perlin_y = our_turf.y / perlin_grass_zoom

		var/grass_type = text2num(rustg_noise_get_at_coordinates("[grass_seed]", "[grass_perlin_x]", "[grass_perlin_y]"))

		if(grass_type <= 0.3)
			new /obj/structure/flora/dunegrass(our_turf)

		CHECK_TICK


	var/message = "[name] finished in [(REALTIMEOFDAY - start_time)/10]s!"

	add_startup_message(message)
	log_world(message)
