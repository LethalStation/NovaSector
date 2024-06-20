/// A component that makes a mob talk on aggro
/datum/component/aggro_speech
	/// Blackboard key in which target data is stored
	var/target_key
	/// If we want to limit emotes to only play at mobs
	var/living_only
	/// List of phrases to say
	var/list/speech_list
	/// Chance to say something
	var/speech_chance
	/// Chance to subtract every time we say something
	var/subtract_chance
	/// Minimum chance to say something
	var/minimum_chance

/datum/component/aggro_speech/Initialize(
	target_key = BB_BASIC_MOB_CURRENT_TARGET,
	living_only = FALSE,
	list/speech_list,
	speech_chance = 30,
	minimum_chance = 2,
	subtract_chance = 7,
)
	. = ..()
	if (!isatom(parent))
		return COMPONENT_INCOMPATIBLE
	var/atom/atom_parent = parent
	if (!atom_parent.ai_controller)
		return COMPONENT_INCOMPATIBLE

	src.target_key = target_key
	src.speech_list = speech_list
	src.speech_chance = speech_chance
	src.minimum_chance = minimum_chance
	src.subtract_chance = subtract_chance

/datum/component/aggro_speech/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_AI_BLACKBOARD_KEY_SET(target_key), PROC_REF(on_target_changed))

/datum/component/aggro_speech/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_AI_BLACKBOARD_KEY_SET(target_key))
	return ..()

/// When we get a new target, see if we want to yell at it
/datum/component/aggro_speech/proc/on_target_changed(mob/source)
	SIGNAL_HANDLER
	var/atom/new_target = source.ai_controller.blackboard[target_key]
	if (isnull(new_target) || !prob(speech_chance))
		return
	if (living_only && !isliving(new_target))
		return
	speech_chance = max(speech_chance - subtract_chance, minimum_chance)
	source.say(message = pick(speech_list))

/// gakster mob ai controllers
/datum/ai_controller/basic_controller/trooper/gakster
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
		BB_AGGRO_RANGE = 9,
		BB_VISION_RANGE = 9,
		BB_EMOTE_KEY = "swear",
		BB_CURRENT_HUNTING_TARGET = null,
		BB_TARGET_MINIMUM_STAT = HARD_CRIT,
		BB_BASIC_MOB_FLEE_DISTANCE = 12,
		BB_REINFORCEMENTS_EMOTE = "reaches up to their comtac and utters a code phrase.",
	)

	ai_movement = /datum/ai_movement/jps
	idle_behavior = /datum/idle_behavior/walk_near_target
	interesting_dist = 20
	can_idle = FALSE // want them to remain responsive

	planning_subtrees = list(
		/datum/ai_planning_subtree/flee_target/from_flee_key,
		/datum/ai_planning_subtree/find_and_hunt_target/gakster,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/attack_obstacle_in_path/trooper,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		/datum/ai_planning_subtree/run_emote,
	)

/datum/ai_controller/basic_controller/trooper/gakster/ranged
	planning_subtrees = list(
		/datum/ai_planning_subtree/flee_target/from_flee_key,
		/datum/ai_planning_subtree/find_and_hunt_target/gakster,
		/datum/ai_planning_subtree/simple_find_target,
		//datum/ai_planning_subtree/ranged_skirmish/gakster,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/gakster,
		/datum/ai_planning_subtree/maintain_distance/cover_minimum_distance/gakster_ranged,
		/datum/ai_planning_subtree/run_emote,
	)

/datum/ai_planning_subtree/basic_ranged_attack_subtree/gakster
	ranged_attack_behavior = /datum/ai_behavior/basic_ranged_attack/gakster

/datum/ai_behavior/basic_ranged_attack/gakster
	action_cooldown = 1 SECONDS
	required_distance = 7
	avoid_friendly_fire = TRUE

/datum/ai_planning_subtree/ranged_skirmish/gakster
	min_range = 0

/datum/ai_planning_subtree/maintain_distance/cover_minimum_distance/gakster_ranged
	minimum_distance = 1
	maximum_distance = 7
	view_distance = 7

/datum/ai_behavior/hunt_target/gakster
	behavior_flags = AI_BEHAVIOR_REQUIRE_MOVEMENT
	always_reset_target = TRUE

/datum/ai_behavior/hunt_target/gakster/target_caught(mob/living/hunter, atom/hunted)
	return

/datum/ai_planning_subtree/find_and_hunt_target/gakster
	finish_planning = FALSE
	hunt_targets = list(/mob/living/carbon/human)
	finding_behavior = /datum/ai_behavior/find_hunt_target/gakster_through_walls
	hunting_behavior = /datum/ai_behavior/hunt_target/gakster
	hunt_range = 9

/datum/ai_behavior/find_hunt_target/gakster_through_walls

/datum/ai_behavior/find_hunt_target/gakster_through_walls/valid_dinner(mob/living/source, atom/dinner, radius, datum/ai_controller/controller, seconds_per_tick)
	// totally ignores walls. TERROR INCARNATE. you WILL JUMP SCARE PEOPLE.
	if (isliving(dinner))
		var/mob/living/living_target = dinner
		if (living_target.stat == DEAD)
			return FALSE

	return get_dist(source, dinner) <= radius
