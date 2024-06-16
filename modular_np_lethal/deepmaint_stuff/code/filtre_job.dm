/datum/job/filtre
	title = "Filtre"
	description = "Protect the facility you are stationed in from attack and looting by the Gaksters. \
		Your only friends are your fellow Filtres who have been hired with you."
	faction = FACTION_STATION
	total_positions = 0
	spawn_positions = 3
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "FILTRE"

	outfit = /datum/outfit/job/filtre
	plasmaman_outfit = /datum/outfit/plasmaman/filtre

	paycheck = PAYCHECK_COMMAND

	liver_traits = list(TRAIT_ENGINEER_METABOLISM, TRAIT_ROYAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_SECURITY_MEDIC
	bounty_types = CIV_JOB_BASIC
	department_for_prefs = /datum/job_department/security
	departments_list = list(
		/datum/job_department/security,
	)

	family_heirlooms = list(/obj/item/lead_pipe)

	rpg_title = "Dungeon Guard"
	job_flags = STATION_JOB_FLAGS | JOB_CANNOT_OPEN_SLOTS & ~JOB_REOPEN_ON_ROUNDSTART_LOSS

/datum/job/filtre/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	ADD_TRAIT(spawned, TRAIT_VIRUSIMMUNE, JOB_TRAIT)
	ADD_TRAIT(spawned, TRAIT_EXTRACT_TO_FILTRE_SHIP, JOB_TRAIT)
	ADD_TRAIT(spawned, TRAIT_LIMBATTACHMENT, JOB_TRAIT)

/datum/job/filtre/get_latejoin_spawn_point()
	var/list/spawn_markers_to_use = list()
	for(var/obj/effect/landmark/start/spawn_point as anything in GLOB.start_landmarks_list)
		if(spawn_point.name != job_spawn_title)
			continue
		spawn_markers_to_use += spawn_point
	return pick(spawn_markers_to_use)

/datum/outfit/job/filtre
	name = "Filtre"
	jobtype = /datum/job/filtre

	id_trim = /datum/id_trim/job/security_officer/filtre

	uniform = /obj/item/clothing/under/syndicate/combat
	box = null
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/deforest/captagon = 1,
		/obj/item/motiondetector = 1,
	)
	belt = null
	ears = /obj/item/radio/headset/headset_cent/alt
	gloves = /obj/item/clothing/gloves/frontier_colonist
	head = null
	shoes = /obj/item/clothing/shoes/jackboots/frontier_colonist
	l_pocket = /obj/item/switchblade
	r_pocket = /obj/item/flashlight/flare

	backpack = /obj/item/storage/backpack/industrial/frontier_colonist
	satchel = /obj/item/storage/backpack/industrial/frontier_colonist/satchel
	duffelbag = /obj/item/storage/backpack/industrial/frontier_colonist
	messenger = /obj/item/storage/backpack/industrial/frontier_colonist/messenger

/datum/outfit/job/filtre/post_equip(mob/living/carbon/human/squaddie, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/radio/radio = squaddie.ears
	radio.set_frequency(FREQ_CENTCOM)
	radio.freqlock = RADIO_FREQENCY_LOCKED

	squaddie.faction |= FACTION_ERT
	return ..()

/datum/outfit/plasmaman/filtre
	name = "Filtre Plasmaman"

	uniform = /obj/item/clothing/under/plasmaman/security
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	r_hand= /obj/item/tank/internals/plasmaman/belt/full
	internals_slot = ITEM_SLOT_HANDS

/datum/id_trim/job/security_officer/filtre
	assignment = "Filtre"

/obj/effect/landmark/start/lethal_filtre
	delete_after_roundstart = FALSE
	name = "Filtre"
