/obj/structure/epic_loot_crafting_bench
	name = "trade station debug basetype"
	desc = "GOOOOOD MORNING VIETNAM! This is not a test, this is rock and roll."
	icon = 'modular_np_lethal/deepmaint_stuff/icons/trade_machine.dmi'
	icon_state = "debug"

	anchored = TRUE
	density = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

	light_power = 1
	light_range = 1

	/// What the currently picked recipe is
	var/datum/crafting_bench_recipe_real/selected_recipe
	/// What recipes are we allowed to choose from?
	var/list/allowed_choices = list(
		/datum/crafting_bench_recipe_real/coolglasses,
	)
	/// Radial options for recipes in the allowed_choices list, populated by populate_radial_choice_list
	var/list/radial_choice_list = list()
	/// An associative list of names --> recipe path that the radial recipe picker will choose from later
	var/list/recipe_names_to_path = list()
	/// List of random construction sounds to play when crafting stuff
	var/list/construction_sounds = list(
		'sound/items/wirecutter.ogg',
		'sound/items/welder2.ogg',
		'sound/items/welder.ogg',
		'sound/items/trayhit2.ogg',
		'sound/items/trayhit1.ogg',
		'sound/items/sheath.ogg',
		'sound/items/screwdriver2.ogg',
		'sound/items/screwdriver.ogg',
		'sound/items/rped.ogg',
		'sound/items/ratchet.ogg',
		'sound/items/jaws_pry.ogg',
		'sound/items/jaws_cut.ogg',
		'sound/items/hammering_wood.ogg',
		'sound/items/foodcanopen.ogg',
		'sound/items/electronic_assembly_emptying.ogg',
		'sound/items/duct_tape_rip.ogg',
		'sound/items/drill_use.ogg',
		'sound/items/drill_hit.ogg',
		'sound/items/crowbar.ogg',
		'sound/items/change_jaws.ogg',
		'sound/items/change_drill.ogg',
		'sound/items/ceramic_break.ogg',
		'sound/items/car_engine_start.ogg',
		'sound/items/boxcutter_activate.ogg',
		'sound/items/box_cut.ogg',
		'sound/items/ampoule_snap.ogg',
	)

/obj/structure/epic_loot_crafting_bench/Initialize(mapload)
	. = ..()
	populate_radial_choice_list()
	update_appearance()

/obj/structure/epic_loot_crafting_bench/proc/populate_radial_choice_list()
	if(!length(allowed_choices))
		return

	if(length(radial_choice_list) && length(recipe_names_to_path)) // We already have both of these and don't need it, if this is called after these are generated for some reason
		return

	for(var/recipe in allowed_choices)
		var/datum/crafting_bench_recipe_real/recipe_to_take_from = new recipe()
		var/obj/recipe_resulting_item = recipe_to_take_from.resulting_item
		radial_choice_list[recipe_to_take_from.recipe_name] = image(icon = initial(recipe_resulting_item.icon), icon_state = initial(recipe_resulting_item.icon_state))
		recipe_names_to_path[recipe_to_take_from.recipe_name] = recipe
		qdel(recipe_to_take_from)

/obj/structure/epic_loot_crafting_bench/examine(mob/user)
	. = ..()

	. += span_engradio("You can <b>examine closer</b> to get a list of <b>everything</b> this station trades for.")
	. += span_engradio("To use the trade station, select a trade and gather the requirements <b>near</b> the station \
		on the ground. Once the requirements are nearby, <b>control-click</b> to finish the trade.")

	if(!selected_recipe)
		return

	var/obj/resulting_item = selected_recipe.resulting_item
	. += span_notice("The selected recipe's resulting item is: <b>[initial(resulting_item.name)]</b> <br>")
	. += span_notice("Gather the required materials, listed below, <b>near the bench</b>, then start <b>control-click</b> to complete it! <br>")

	if(!length(selected_recipe.recipe_requirements))
		. += span_boldwarning("Somehow, this recipe has no requirements, report this as this shouldn't happen.")
		return

	for(var/obj/requirement_item as anything in selected_recipe.recipe_requirements)
		if(!selected_recipe.recipe_requirements[requirement_item])
			. += span_boldwarning("[requirement_item] does not have an amount required set, this should not happen, report it.")
			continue

		. += span_notice("<b>[selected_recipe.recipe_requirements[requirement_item]]</b> - [initial(requirement_item.name)]")

	return .

/obj/structure/epic_loot_crafting_bench/examine_more(mob/user)
	. = ..()

	. += span_notice("This station trades for the following items:")

/obj/structure/epic_loot_crafting_bench/update_overlays()
	. = ..()
	. += emissive_appearance(icon, "light_mask", src)

/obj/structure/epic_loot_crafting_bench/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	update_appearance()

	if(selected_recipe)
		clear_recipe()
		balloon_alert_to_viewers("recipe cleared")
		update_appearance()
		return

	var/chosen_recipe = show_radial_menu(user, src, radial_choice_list, radius = 38, require_near = TRUE, tooltips = TRUE)

	if(!chosen_recipe)
		balloon_alert(user, "no recipe choice")
		return

	var/datum/crafting_bench_recipe_real/recipe_to_use = recipe_names_to_path[chosen_recipe]
	selected_recipe = new recipe_to_use

	balloon_alert(user, "recipe chosen")
	update_appearance()

/// Clears the current recipe and sets hits to completion to zero
/obj/structure/epic_loot_crafting_bench/proc/clear_recipe()
	QDEL_NULL(selected_recipe)

/obj/structure/epic_loot_crafting_bench/wrench_act(mob/living/user, obj/item/tool)
	tool.play_tool_sound(src)
	deconstruct(disassembled = TRUE)
	return ITEM_INTERACT_SUCCESS

/// Takes the given list of item requirements and checks the surroundings for them, returns TRUE unless return_ingredients_list is set, in which case a list of all the items to use is returned
/obj/structure/epic_loot_crafting_bench/proc/can_we_craft_this(list/required_items, return_ingredients_list = FALSE)
	if(!length(required_items))
		message_admins("[src] just tried to check for ingredients nearby without having a list of items to check for!")
		return FALSE

	var/list/surrounding_items = list()
	var/list/requirement_items = list()

	for(var/obj/item/potential_requirement in get_environment())
		surrounding_items += potential_requirement

	for(var/obj/item/requirement_path as anything in required_items)
		var/required_amount = required_items[requirement_path]

		for(var/obj/item/nearby_item as anything in surrounding_items)
			if(!istype(nearby_item, requirement_path))
				continue

			if(isstack(nearby_item)) // If the item is a stack, check if that stack has enough material in it to fill out the amount
				var/obj/item/stack/nearby_stack = nearby_item
				if(required_amount > 0)
					requirement_items += nearby_item
				required_amount -= nearby_stack.amount
			else // Otherwise, we still exist and should subtract one from the required number of items
				if(required_amount > 0)
					requirement_items += nearby_item
				required_amount -= 1

		if(required_amount > 0)
			return FALSE

	if(return_ingredients_list)
		return requirement_items
	else
		return TRUE

/obj/structure/epic_loot_crafting_bench/click_ctrl(mob/user)
	if(!can_interact(user) || !user.can_perform_action(src))
		return CLICK_ACTION_BLOCKING

	if(!selected_recipe)
		balloon_alert(user, "no recipe selected")
		return CLICK_ACTION_BLOCKING

	if(!can_we_craft_this(selected_recipe.recipe_requirements))
		balloon_alert(user, "missing ingredients")
		return CLICK_ACTION_BLOCKING

	var/list/things_to_use = can_we_craft_this(selected_recipe.recipe_requirements, TRUE)

	create_thing_from_requirements(things_to_use, selected_recipe, user)

	return CLICK_ACTION_SUCCESS

/// Passes the list of found ingredients + the recipe to use_or_delete_recipe_requirements, then spawns the given recipe's result
/obj/structure/epic_loot_crafting_bench/proc/create_thing_from_requirements(list/things_to_use, datum/crafting_bench_recipe_real/recipe_to_follow, mob/living/user)

	if(!recipe_to_follow)
		message_admins("[src] just tried to complete a recipe without having a recipe!")
		return FALSE

	if(!length(things_to_use))
		message_admins("[src] just tried to craft something from requirements, but was not given a list of requirements!")
		return FALSE

	use_or_delete_recipe_requirements(things_to_use, recipe_to_follow)
	var/obj/newly_created_thing
	for(var/iterator in 1 to recipe_to_follow.amount_to_make)
		newly_created_thing = new recipe_to_follow.resulting_item(drop_location())
	playsound(src, pick(construction_sounds), 50, TRUE)

	if(!newly_created_thing)
		message_admins("[src] just failed to create something while crafting!")
		return FALSE

	clear_recipe()
	update_appearance()

/// Takes the given list, things_to_use, compares it to recipe_to_follow's requirements, then either uses items from a stack, or deletes them otherwise. Returns custom material of forge items in the end.
/obj/structure/epic_loot_crafting_bench/proc/use_or_delete_recipe_requirements(list/things_to_use, datum/crafting_bench_recipe_real/recipe_to_follow)
	for(var/obj/requirement_item as anything in things_to_use)
		if(isstack(requirement_item))
			var/stack_type
			for(var/recipe_thing_to_reference as anything in recipe_to_follow.recipe_requirements)
				if(!istype(requirement_item, recipe_thing_to_reference))
					continue
				stack_type = recipe_thing_to_reference
				break

			var/obj/item/stack/requirement_stack = requirement_item

			if(requirement_stack.amount < recipe_to_follow.recipe_requirements[stack_type])
				recipe_to_follow.recipe_requirements[stack_type] -= requirement_stack.amount
				requirement_stack.use(requirement_stack.amount)
				continue

			requirement_stack.use(recipe_to_follow.recipe_requirements[stack_type])

		else
			qdel(requirement_item)

/// Gets movable atoms within one tile of range of the crafting bench
/obj/structure/epic_loot_crafting_bench/proc/get_environment()
	. = list()

	if(!get_turf(src))
		return

	for(var/atom/movable/found_movable_atom in range(1, src))
		if((found_movable_atom.flags_1 & HOLOGRAM_1))
			continue
		. += found_movable_atom
	return .
