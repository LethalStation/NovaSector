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
		BB_AGGRO_RANGE = 16,
		BB_EMOTE_KEY = "swear",
	)
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/attack_obstacle_in_path/trooper,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		/datum/ai_planning_subtree/travel_to_point/and_clear_target/reinforce,
		/datum/ai_planning_subtree/run_emote,
	)

/datum/ai_controller/basic_controller/trooper/gakster/ranged
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/trooper,
		/datum/ai_planning_subtree/travel_to_point/and_clear_target/reinforce,
		/datum/ai_planning_subtree/run_emote,
		/datum/ai_planning_subtree/ranged_skirmish,
	)
