/turf/open/misc/desert_sand
	name = "sand"
	desc = "Dark desert sand, the most common type of ground around. Completely devoid of water, \
		and prone to blowing up into large dust storms with devastating power. It's coarse and it \
		gets everywhere."
	gender = PLURAL

	icon = 'modular_vintage/turfs/icons/sand.dmi'
	icon_state = "sand"
	base_icon_state = "sand"
	tiled_dirt = FALSE

	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_CARPET_SIMPLE_NEON_PINK_NODOTS
	canSmoothWith = SMOOTH_GROUP_CARPET_SIMPLE_NEON_PINK_NODOTS + SMOOTH_GROUP_CLOSED_TURFS
	layer = HIGH_TURF_LAYER

	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/misc/desert_sand

	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/misc/desert_sand/Initialize(mapload)
	. = ..()
	if(smoothing_flags)
		var/matrix/translation = new
		translation.Translate(-8, -8)
		transform = translation

/turf/open/misc/dry_soil
	name = "parched earth"
	desc = "While this may have been normal, vibrant earth in some time past, that time is certainly not the present. \
		This soil is extremely dry, with a wicked looking cracked surface. The only thing stopping it from becoming sand \
		is how tightly packed the material is."
	gender = PLURAL

	icon = 'modular_vintage/turfs/icons/dry_dirt.dmi'
	icon_state = "dry_dirt"
	base_icon_state = "dry_dirt"
	tiled_dirt = FALSE

	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_CARPET_SIMPLE_NEON_VIOLET_NODOTS
	canSmoothWith = SMOOTH_GROUP_CARPET_SIMPLE_NEON_PINK_NODOTS + SMOOTH_GROUP_CARPET_SIMPLE_NEON_VIOLET_NODOTS + SMOOTH_GROUP_CLOSED_TURFS
	layer = HIGH_TURF_LAYER - 0.001

	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/misc/dry_soil

	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/misc/dry_soil/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/turf_farm, 0.5)
	if(smoothing_flags)
		var/matrix/translation = new
		translation.Translate(-8, -8)
		transform = translation

/turf/open/misc/regular_soil
	name = "rocky soil"
	desc = "Some pretty average, and remarkably hydrated looking soil that doesn't look like it will try to kill you \
		when the wind picks up again."
	gender = PLURAL

	icon = 'modular_vintage/turfs/icons/dirt.dmi'
	icon_state = "dirt"
	base_icon_state = "dirt"
	tiled_dirt = FALSE

	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_CARPET_SIMPLE_NEON_PURPLE_NODOTS
	canSmoothWith = SMOOTH_GROUP_CARPET_SIMPLE_NEON_PINK_NODOTS + SMOOTH_GROUP_CARPET_SIMPLE_NEON_VIOLET_NODOTS + SMOOTH_GROUP_CARPET_SIMPLE_NEON_PURPLE_NODOTS + SMOOTH_GROUP_CLOSED_TURFS
	layer = HIGH_TURF_LAYER - 0.002

	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/misc/regular_soil

	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/misc/regular_soil/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/turf_farm, 0.7)
	if(smoothing_flags)
		var/matrix/translation = new
		translation.Translate(-8, -8)
		transform = translation

/turf/open/misc/muck_slop
	name = "rich mud"
	desc = "A rare sight in the vest deserts and wastelands, mud saturated with water. \
		The basis of civilization in a place such as this, providing many of the basic needs such as \
		shelter, or farming."
	gender = PLURAL

	icon = 'modular_vintage/turfs/icons/mud.dmi'
	icon_state = "mud"
	base_icon_state = "mud"
	tiled_dirt = FALSE

	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_CARPET_SIMPLE_NEON_BLUE_NODOTS
	canSmoothWith = SMOOTH_GROUP_CARPET_SIMPLE_NEON_PINK_NODOTS + SMOOTH_GROUP_CARPET_SIMPLE_NEON_VIOLET_NODOTS + SMOOTH_GROUP_CARPET_SIMPLE_NEON_PURPLE_NODOTS + SMOOTH_GROUP_CARPET_SIMPLE_NEON_BLUE_NODOTS + SMOOTH_GROUP_CLOSED_TURFS
	layer = HIGH_TURF_LAYER - 0.003

	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/misc/muck_slop

	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

	slowdown = 0.3

/turf/open/misc/muck_slop/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/turf_farm, 1)
	if(smoothing_flags)
		var/matrix/translation = new
		translation.Translate(-8, -8)
		transform = translation

/turf/open/misc/fire_clay
	name = "fire clay"
	desc = "On today's tier list of things to bring when starting civilization, fire clay such as this makes top five. \
		While no good for growing in, it has a much more important use, bricks and pottery."
	gender = PLURAL

	icon = 'modular_vintage/turfs/icons/clay.dmi'
	icon_state = "clay"
	base_icon_state = "clay"
	tiled_dirt = FALSE

	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_CARPET_SIMPLE_NEON_CYAN_NODOTS
	canSmoothWith = SMOOTH_GROUP_CARPET_SIMPLE_NEON_PINK_NODOTS + SMOOTH_GROUP_CARPET_SIMPLE_NEON_VIOLET_NODOTS + SMOOTH_GROUP_CARPET_SIMPLE_NEON_PURPLE_NODOTS + SMOOTH_GROUP_CARPET_SIMPLE_NEON_BLUE_NODOTS + SMOOTH_GROUP_CARPET_SIMPLE_NEON_CYAN_NODOTS + SMOOTH_GROUP_CLOSED_TURFS
	layer = HIGH_TURF_LAYER - 0.004

	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/misc/fire_clay

	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/misc/fire_clay/Initialize(mapload)
	. = ..()
	if(smoothing_flags)
		var/matrix/translation = new
		translation.Translate(-8, -8)
		transform = translation
