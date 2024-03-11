GLOBAL_DATUM(suit_up_controller, /datum/suit_up_controller)

/datum/suit_up_controller
	/// List of cargo supply crate datums to drop pod in at the start of the round
	var/static/list/roundstart_crates = list(
		/datum/supply_pack/engineering/colony_starter,
		/datum/supply_pack/engineering/colony_starter,
		/datum/supply_pack/emergency/mothic_rations,
		/datum/supply_pack/engineering/portascrubber,
		/datum/supply_pack/materials/plastic50,
		/datum/supply_pack/materials/watertank,
		/datum/supply_pack/medical/defibs,
		/datum/supply_pack/medical/heavy_duty_medical,
		/datum/supply_pack/medical/supplies,
		/datum/supply_pack/organic/seeds,
		/datum/supply_pack/engineering/omnilathe_drop_pod,
	)

/datum/suit_up_controller/New()
	. = ..()
	RegisterSignal(SSdcs, COMSIG_GLOB_CREWMEMBER_JOINED, .proc/new_colonist)

/datum/suit_up_controller/Destroy(force, ...)
	. = ..()
	UnregisterSignal(SSdcs, COMSIG_GLOB_CREWMEMBER_JOINED)

/// Tracks if a new colonist spawns, telling them to get their outfit on
/datum/suit_up_controller/proc/new_colonist(datum/source, mob/living/new_crewmember, rank)
	SIGNAL_HANDLER

	suit_up_mf(new_crewmember)

/// Spawns the required colonist outfit on someone
/datum/suit_up_controller/proc/suit_up_mf(mob/living/carbon/human/target_player)
	for(var/obj/item/item in target_player.get_equipped_items())
		qdel(item)

	var/obj/item/organ/internal/brain/human_brain = target_player.get_organ_slot(BRAIN)
	human_brain.destroy_all_skillchips()

	var/outfit_to_equip_to_mob = new /datum/outfit/event_colonizer
	target_player.equipOutfit(outfit_to_equip_to_mob)

/// Starts the countdown callback to making a bunch of supply pods that crash down with all of the station's supplies (Based)
/datum/suit_up_controller/proc/start_the_cargo_countdown()
	addtimer(CALLBACK(src, PROC_REF(drop_the_cargo)), 20 SECONDS)

/// Checks the roundstart crates list, spawns those crates, then loads them into drop pods that fall on one of the random latejoin markers
/datum/suit_up_controller/proc/drop_the_cargo()
	for(var/datum/supply_pack/roundstart_pack in roundstart_crates)
		var/obj/structure/closet/supplypod/centcompod/new_pod = new()
		var/datum/supply_pack/new_pack = new roundstart_pack
		new_pack.admin_spawned = TRUE
		new_pack.generate(new_pod)
		var/obj/effect/landmark/latejoin/latejoin_marker = pick(SSjob.latejoin_trackers)
		new /obj/effect/pod_landingzone(get_turf(latejoin_marker), new_pod)

// I'm lazy, so here's the box that spawns the super lathe board that players can use later
/datum/supply_pack/engineering/omnilathe_drop_pod
	name = "Technology Fabricator Board"
	desc = "Contains a single circuitboard for a technology fabricator."
	cost = CARGO_CRATE_VALUE * 20

	special = TRUE
	contains = list(
		/obj/item/circuitboard/machine/protolathe/offstation = 1,
	)
	crate_name = "technology fabricator circuitboard"
	crate_type = /obj/structure/closet/crate/engineering
