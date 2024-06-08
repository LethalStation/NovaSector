/datum/supply_pack/engineering/random_lathe_boards
	name = "Technology Fabricator Board Triple Pack"
	desc = "Three random technology fabricator boards from the various departments."
	cost = CARGO_CRATE_VALUE * 10
	contains = list(
		/obj/item/circuitboard/machine/techfab/department/cargo,
		/obj/item/circuitboard/machine/techfab/department/engineering,
		/obj/item/circuitboard/machine/techfab/department/medical,
		/obj/item/circuitboard/machine/techfab/department/science,
		/obj/item/circuitboard/machine/techfab/department/security,
		/obj/item/circuitboard/machine/techfab/department/service,
	)
	crate_name = "technology fabricator circuits crate"

/datum/supply_pack/engineering/random_lathe_boards/fill(obj/structure/closet/crate/my_house_in_the_middle)
	for(var/iteraor in 1 to 3)
		var/obj/new_board = pick(contains)
		new new_board(my_house_in_the_middle)

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
	COOLDOWN_DECLARE(roundstart_lockout_timer)

/obj/structure/cargo_shuttle_beacon/Initialize(mapload)
	. = ..()
	COOLDOWN_START(src, roundstart_lockout_timer, 30 MINUTES)

/obj/structure/cargo_shuttle_beacon/examine(mob/user)
	. = ..()

	if(!COOLDOWN_FINISHED(src, roundstart_lockout_timer))
		var/time_left = DisplayTimeText(COOLDOWN_TIMELEFT(src, roundstart_lockout_timer), 1)
		. += span_notice("The beacon is calculating a shuttle route through the nearby dust storms, this will take approximately <b>[time_left]</b>.")
	else
		. += span_notice("The beacon is <b>ready</b> for use.")

	return ..()

/obj/structure/cargo_shuttle_beacon/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return

	if(!COOLDOWN_FINISHED(src, roundstart_lockout_timer))
		var/time_left = DisplayTimeText(COOLDOWN_TIMELEFT(src, roundstart_lockout_timer), 1)
		to_chat(user, span_warning("The beacon is calculating a shuttle route through the nearby dust storms, this will take approximately <b>[time_left]</b>."))
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
