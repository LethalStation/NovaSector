/datum/component/spawn_scavenger
	// How long does this atom have to be left on the ground unattended before it spawns something?
	var/duration = 5 MINUTES
	// ID for the timer we use to handle despawning
	var/timer_id
	// Thing we're supposed to spawn
	var/mob/living/scavenger
	// Weak ref to the thing we spawned
	var/datum/weakref/spawned_ref
	// Should we delete the item once we spawn, or should we move it to nullspace?
	var/delete_object = FALSE
	// Areas to pick from if we're spawning the scavenger randomly on the station.
	var/list/spawn_areas
	// Should we spawn below the item, or randomly in a safe area?
	var/spawn_in_random_area = FALSE

/datum/component/spawn_scavenger/Initialize(mob/living/scav, duration = 5 MINUTES, list/spawn_area = null, random_area_spawn = FALSE, delete_after = FALSE)
	. = ..()
	if (!isitem(parent))
		return COMPONENT_INCOMPATIBLE

	if (!scav)
		CRASH("Tried to create a spawn_scavenger component with no supplied scavenger entity to spawn!")

	src.duration = duration
	src.scavenger = scav
	src.delete_object = delete_after

	if (random_area_spawn && spawn_area)
		src.spawn_in_random_area = random_area_spawn
		src.spawn_areas = spawn_area

	RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(check_decay))
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(check_decay))
	RegisterSignal(parent, COMSIG_ATOM_CAN_BE_PULLED, PROC_REF(check_decay))
	RegisterSignal(parent, COMSIG_ATOM_ENTERED, PROC_REF(check_decay))
	RegisterSignal(parent, COMSIG_ATOM_EXAMINE, PROC_REF(do_examine))

/datum/component/spawn_scavenger/proc/do_examine(obj/item/source, mob/examiner, list/examine_list)
	SIGNAL_HANDLER

	examine_list += "<br>You get the impression that this thing <b>may draw in nearby scavengers</b> if left <i>on the floor or unattended.</i></br>"

/datum/component/spawn_scavenger/proc/check_decay()
	SIGNAL_HANDLER
	var/atom/movable/atom_parent = parent
	if (isturf(atom_parent.loc))
		// we're on the ground, so we should be decaying
		start_decay_timer()
	else
		stop_decay_timer()

/datum/component/spawn_scavenger/proc/start_decay_timer()
	// starts the timer or resets it if it's running
	if (timer_id)
		deltimer(timer_id)
		timer_id = null

	timer_id = addtimer(CALLBACK(src, PROC_REF(item_decayed), parent), duration, TIMER_STOPPABLE | TIMER_DELETE_ME)

/datum/component/spawn_scavenger/proc/stop_decay_timer()
	if (timer_id)
		deltimer(timer_id)
		timer_id = null

/datum/component/spawn_scavenger/proc/item_decayed()
	// Handles spawning the scavenger NPC and also extra checks to see if we should spawn at all
	if (scavenger)
		var/atom/movable/atom_parent = parent
		if (atom_parent.pulledby)
			start_decay_timer() // reset it if we're being pulled still
			return

		for(var/mob/living/carbon/human/watcher in oview(get_turf(atom_parent), 7))
			if (watcher.stat != DEAD)
				start_decay_timer() // someone alive is in view, so don't decay and just reset the timer
				return

		// finally, spawn our scav in.
		var/spawnloc = spawn_in_random_area ? get_safe_random_station_turf(spawn_areas) : atom_parent.drop_location()
		if (spawnloc)
			var/mob/living/new_scav = new scavenger(spawnloc)
			spawned_ref = WEAKREF(new_scav)
			message_admins("[parent] has summoned a scavenger after being left unattended. [ADMIN_LOOKUPFLW(new_scav)]")

			if (delete_object)
				qdel(parent)
				cleanup()
				return
			else
				atom_parent.moveToNullspace() // safely tuck it away into nullspace
				RegisterSignal(new_scav, COMSIG_LIVING_DEATH, PROC_REF(drop_loot)) // and register the signal to drop it when it dies
				stop_decay_timer()
		else
			CRASH("Couldn't find a valid location to spawn in a scavenger mob.")


/datum/component/spawn_scavenger/proc/cleanup()
	scavenger = null
	if (timer_id)
		deltimer(timer_id)
		timer_id = null
	qdel(src)

/datum/component/spawn_scavenger/proc/drop_loot()
	SIGNAL_HANDLER

	var/atom/movable/atom_parent = parent // we should only be dropping from nullspace, so
	var/mob/living/our_scav = spawned_ref.resolve()
	if (our_scav)
		atom_parent.Move(get_turf(our_scav))
		UnregisterSignal(our_scav, COMSIG_LIVING_DEATH)
		cleanup()
