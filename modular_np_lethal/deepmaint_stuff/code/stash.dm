GLOBAL_LIST_EMPTY(ckey_to_storage_box)

// Stash storage datum

/datum/storage/stash_storage
	max_slots = 6
	max_specific_storage = WEIGHT_CLASS_NORMAL
	max_total_storage = WEIGHT_CLASS_NORMAL * 6
	numerical_stacking = FALSE
	rustle_sound = TRUE
	screen_max_columns = 3
	/// What ckey this storage is linked to
	var/linked_ckey

/datum/storage/stash_storage/open_storage(mob/to_show)
	if(to_show.mind.key != linked_ckey)
		parent.balloon_alert(to_show, "you cannot access this!")

	return ..()
