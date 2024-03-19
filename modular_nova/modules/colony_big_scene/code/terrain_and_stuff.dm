#define RED_PLANET_ATMOS "co2=40;o2=3;n2=7;TEMP=210"
#define RED_ROCK "#934b33"
#define DARK_ROCK "#2b2b2b"

/turf/open/misc/ironsand/redplanet
	initial_gas_mix = RED_PLANET_ATMOS
	planetary_atmos = TRUE

/turf/open/misc/ironsand/redplanet/randomrocks

/turf/open/misc/ironsand/redplanet/randomrocks/Initialize(mapload)
	. = ..()

	if(prob(2))
		new /obj/structure/flora/rock/style_random(get_turf(src))
	else if(prob(2))
		new /obj/structure/flora/rock/pile/style_random(get_turf(src))

/turf/open/misc/asteroid/basalt/redplanet
	baseturfs = /turf/baseturf_bottom
	initial_gas_mix = RED_PLANET_ATMOS
	planetary_atmos = TRUE

/turf/open/misc/asteroid/basalt/redplanet/randomrocks

/turf/open/misc/asteroid/basalt/redplanet/randomrocks/Initialize(mapload)
	. = ..()

	if(prob(2))
		new /obj/structure/flora/rock/style_random(get_turf(src))
	else if(prob(2))
		new /obj/structure/flora/rock/pile/style_random(get_turf(src))

/turf/open/lava/smooth/redplanet
	initial_gas_mix = RED_PLANET_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/lava/smooth/redplanet

/turf/closed/mineral/random/redplanet
	baseturfs = /turf/baseturf_bottom
	mineralChance = 25
	mineralAmt = 10
	color = DARK_ROCK
	tool_mine_speed = 10 SECONDS

/turf/closed/mineral/random/redplanet/mineral_chances()
	return list(
		/obj/item/stack/ore/uranium = 5,
		/obj/item/stack/ore/diamond = 1,
		/obj/item/stack/ore/gold = 10,
		/obj/item/stack/ore/silver = 12,
		/obj/item/stack/ore/plasma = 20,
		/obj/item/stack/ore/iron = 40,
		/obj/item/stack/ore/titanium = 11,
		/obj/item/stack/ore/bluespace_crystal = 1
	)

/turf/closed/mineral/random/redplanet/dark
	baseturfs = /turf/open/misc/asteroid/basalt/redplanet
	color = DARK_ROCK

/area/redplanet
	icon = 'icons/area/areas_station.dmi'
	icon_state = "mining"
	name = "Red Planet Outdoors"
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = UNIQUE_AREA
	always_unpowered = TRUE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	ambience_index = AMBIENCE_MINING
	sound_environment = SOUND_AREA_LAVALAND
	min_ambience_cooldown = 70 SECONDS
	max_ambience_cooldown = 220 SECONDS
	ambient_buzz = 'sound/ambience/magma.ogg'
	outdoors = TRUE
	base_lighting_alpha = 45

/area/redplanet/Initialize(mapload)
	. = ..()
	luminosity = 1

// This doesn't really belong here but I dont want to clear my clipboard
// It's that one mining shuttle landing designator for the aux base, except it makes a cargo shuttle landing spot instead

/obj/structure/cargo_shuttle_beacon
	name = "cargo shuttle beacon"
	desc = "A powerful radio beacon able to designate a landing zone for the cargo shuttle."
	anchored = FALSE
	density = FALSE
	var/shuttle_ID = "landing_zone_dock"
	icon = 'icons/obj/mining.dmi'
	icon_state = "miningbeacon"
	var/obj/docking_port/stationary/newport //Linked docking port for the mining shuttle
	pressure_resistance = 200 //So it does not get blown into lava.
	var/anti_spam_cd = 0 //The linking process might be a bit intensive, so this here to prevent over use.
	var/console_range = 15 //Wifi range of the beacon to find the aux base console

/obj/structure/cargo_shuttle_beacon/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return

	if(anchored)
		to_chat(user, span_warning("Landing zone already set."))
		return

	if(anti_spam_cd)
		to_chat(user, span_warning("[src] is currently recalibrating. Please wait."))
		return

	anti_spam_cd = 1
	addtimer(CALLBACK(src, PROC_REF(clear_cooldown)), 50)

	var/turf/landing_spot = get_turf(src)
	var/area/our_area = get_area(landing_spot)

	newport = new(landing_spot)
	newport.shuttle_id = "cargo_home"
	newport.name = "Cargo Landing Zone"
	newport.dwidth = 5
	newport.width = 12
	newport.height = 7
	newport.setDir(dir)
	newport.area_type = our_area.type

	var/obj/docking_port/mobile/cargo_shuttle
	var/list/landing_turfs = list() //List of turfs where the mining shuttle may land.
	for(var/obj/docking_port/mobile/mobile_newport as anything in SSshuttle.mobile_docking_ports)
		if(mobile_newport.shuttle_id != "cargo")
			continue
		cargo_shuttle = mobile_newport
		landing_turfs = cargo_shuttle.return_ordered_turfs(x,y,z,dir)
		break

	for(var/i in 1 to landing_turfs.len) //You land NEAR the base, not IN it.
		var/turf/landing_location = landing_turfs[i]
		if(!landing_location) //This happens at map edges
			to_chat(user, span_warning("Unable to secure a valid docking zone. Please try again in an open area."))
			SSshuttle.stationary_docking_ports.Remove(newport)
			qdel(newport)
			return

	if(cargo_shuttle.canDock(newport) != SHUTTLE_CAN_DOCK)
		to_chat(user, span_warning("Unable to secure a valid docking zone. Please try again in an open area."))
		SSshuttle.stationary_docking_ports.Remove(newport)
		qdel(newport)
		return

	to_chat(user, span_notice("Landing zone configuration locked in, cargo shuttle may be operated through cargo consoles."))
	set_anchored(TRUE) //Locks in place to mark the landing zone.
	playsound(loc, 'sound/machines/ping.ogg', 50, FALSE)
	log_shuttle("[key_name(usr)] has registered the cargo shuttle beacon at [COORD(landing_spot)].")

/obj/structure/cargo_shuttle_beacon/proc/clear_cooldown()
	anti_spam_cd = 0

/obj/structure/cargo_shuttle_beacon/attack_robot(mob/user)
	return attack_hand(user) //So borgies can help
