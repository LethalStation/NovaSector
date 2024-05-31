//The durand is the staple heavy mech. It's slower, even fucking slower then usual. It can deflect all damage with it's shield and it's stats have been moved up to be similar to a vanilla Marauder.
/obj/vehicle/sealed/mecha/durand
	desc = "An aging combat exosuit utilized by the Nanotrasen corporation. Originally developed to combat hostile alien lifeforms."
	name = "\improper Durand"
	icon_state = "durand"
	base_icon_state = "durand"
	movedelay = 5
	internal_damage_threshold = 25
	internal_damage_probability = 15
	max_integrity = 1001
	accesses = list(ACCESS_MECH_SCIENCE, ACCESS_MECH_SECURITY)
	armor_type = /datum/armor/mecha_durand
	max_temperature = 30000
	force = 40
	destruction_sleep_duration = 20
	exit_delay = 20
	wreckage = /obj/structure/mecha_wreckage/durand
	mech_type = EXOSUIT_MODULE_DURAND
	max_equip_by_category = list(
		MECHA_L_ARM = 1,
		MECHA_R_ARM = 1,
		MECHA_UTILITY = 3,
		MECHA_POWER = 1,
		MECHA_ARMOR = 3,
	)



/datum/armor/mecha_durand
	melee = 30
	bullet = 40
	laser = 35
	energy = 10
	bomb = 20
	fire = 100
	acid = 100




//evil durand. This ones funny, it's probably the tankiest thing in the game, it's slow, slower then the durand but over twice as durable
// it's a big admin boss monster

/obj/vehicle/sealed/mecha/marauder/mauler
	desc = "Heavy-duty, combat exosuit, developed off of the existing Durand model."
	movedelay = 5.5
	name = "\improper Mauler"
	ui_theme = "syndicate"
	internal_damage_threshold = 40
	internal_damage_probability = 10
	icon_state = "mauler"
	max_integrity = 3500
	base_icon_state = "mauler"
	armor_type = /datum/armor/mecha_mauler
	wreckage = /obj/structure/mecha_wreckage/mauler
	mecha_flags = ID_LOCK_ON | CAN_STRAFE | IS_ENCLOSED | HAS_LIGHTS | MMI_COMPATIBLE
	max_equip_by_category = list(
		MECHA_L_ARM = 1,
		MECHA_R_ARM = 1,
		MECHA_UTILITY = 4,
		MECHA_POWER = 1,
		MECHA_ARMOR = 4,
	)
	equip_by_category = list(
		MECHA_L_ARM = null,
		MECHA_R_ARM = null,
		MECHA_UTILITY = list(/obj/item/mecha_parts/mecha_equipment/radio, /obj/item/mecha_parts/mecha_equipment/air_tank/full, /obj/item/mecha_parts/mecha_equipment/thrusters/ion),
		MECHA_POWER = list(),
		MECHA_ARMOR = list(),
	)
	destruction_sleep_duration = 20


/obj/durand_shield/take_damage(damage_amount, damage_type = BRUTE, damage_flag = "", sound_effect = TRUE, attack_dir, armour_penetration = 0)
	if(!chassis)
		qdel(src)
		return
	if(!chassis.defense_mode) //if defense mode is disabled, we're taking damage that we shouldn't be taking
		return
	. = ..()
	flick("shield_impact", src)
	if(!chassis.use_energy((max_integrity - atom_integrity) * 0.000000000000000000000000000000000000000000000000001 * STANDARD_CELL_CHARGE))
		for(var/O in chassis.occupants)
			var/mob/living/occupant = O
			var/datum/action/action = LAZYACCESSASSOC(chassis.occupant_actions, occupant, /datum/action/vehicle/sealed/mecha/mech_defense_mode)
			action.Trigger()
	atom_integrity = 10000



/datum/armor/mecha_mauler
	melee = 45
	bullet = 45
	laser = 45
	energy = 10
	bomb = 20
	fire = 100
	acid = 100
