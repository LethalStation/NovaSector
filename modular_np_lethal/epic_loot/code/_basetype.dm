/obj/structure/maintenance_loot_structure
	name = "abandoned crate"
	icon = 'modular_np_lethal/epic_loot/icons/loot_structures.dmi'
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	obj_flags = CAN_BE_HIT
	pass_flags_self = LETPASSTHROW|LETPASSCLICKS
	max_integrity = 100

	/// What storage datum we use
	var/storage_datum_to_use = /datum/storage/maintenance_loot_structure
	/// Weighted list of the loot that can spawn in this
	var/list/loot_weighted_list = list(
		/obj/effect/spawner/random/maintenance = 1,
	)
	/// This one is going to be weird, a string of dice to use when rolling number of contents
	var/loot_spawn_dice_string = "2d4+1"

/obj/structure/maintenance_loot_structure/Initialize(mapload)
	. = ..()
	create_storage(storage_type = storage_datum_to_use)
	make_contents()

/obj/structure/maintenance_loot_structure/examine(mob/user)
	. = ..()
	. += span_engradio("If it's <b>empty</b>, perhaps you should check it again at a <b>later</b> time?")
	return .

// Since it doesn't want to play nice for whatever reason
/obj/structure/maintenance_loot_structure/attack_hand(mob/living/user)
	if(!user.can_perform_action(src, NEED_HANDS))
		return ..()
	atom_storage.open_storage(user)
	return TRUE

/// Fills random contents into this structure's inventory, starting a loop to respawn loot if the container is empty later
/obj/structure/maintenance_loot_structure/proc/make_contents()
	var/refill_check_time = 10 MINUTES
	if(!length(contents))
		spawn_loot()
		refill_check_time = 30 MINUTES
	addtimer(CALLBACK(src, PROC_REF(make_contents)), refill_check_time)

/// Spawns a random amount of loot into the structure, random numbers based on the amount of storage slots inside it
/obj/structure/maintenance_loot_structure/proc/spawn_loot()
	var/random_loot_amount = roll(loot_spawn_dice_string)
	for(var/loot_spawn in 1 to random_loot_amount)
		var/obj/new_loot = pick_weight(loot_weighted_list)
		new new_loot(src)
	Shake(2, 2, 1 SECONDS)

/datum/storage/maintenance_loot_structure
	max_slots = 9
	max_specific_storage = WEIGHT_CLASS_BULKY
	max_total_storage = WEIGHT_CLASS_BULKY * 6
	numerical_stacking = FALSE
	rustle_sound = FALSE
	screen_max_columns = 3
	/// What sound this makes when people open it's storage
	var/opening_sound = 'modular_np_lethal/epic_loot/sound/containers/plastic.mp3'

/datum/storage/maintenance_loot_structure/open_storage(mob/to_show)
	. = ..()
	if(!.)
		return
	playsound(parent, opening_sound, 50, TRUE)

// Loot items basetype, for convenience
/obj/item/epic_loot
	name = "epic loot!!!!!"
	desc = "Unknown purpose, unknown maker, unknown value. The only thing I know for real: There will be loot."
	icon = 'modular_np_lethal/epic_loot/icons/epic_loot.dmi'
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	inhand_icon_state = "binoculars"
	w_class = WEIGHT_CLASS_SMALL

/*
/obj/item/epic_loot/examine(mob/user)
	. = ..()
	. += span_engradio("You can probably <b>sell</b> this for some good money if you have no other use for it.")
	return .
*/
