/mob/living/basic/trader/grey_gakdog
	name = "0 Grey"
	desc = "A newer face around the pentola, they've already made a name for themself with their famous meat."
	basic_mob_flags = NONE
	gender = PLURAL
	species_path = /datum/species/human/felinid
	ranged_attack_casing = /obj/item/ammo_casing/c35sol
	held_weapon_visual = /obj/item/gun/ballistic/automatic/sol_smg/evil

	ai_controller = /datum/ai_controller/basic_controller/trader

	spawner_path = /obj/effect/mob_spawn/corpse/human/grey_gakdog
	loot = list(/obj/effect/mob_spawn/corpse/human/grey_gakdog)

	trader_data_path = /datum/trader_data/grey_gakdog

/mob/living/basic/trader/old_fisherman
	name = "73 Bar"
	desc = "An old hand around the Pentola. Plenty of successful runs but he never did quite get out. He's too \
	too old for the cache raids these days, but he's one of the few people who know how to coax a fish out of the \
	sad little puddles of Pluto, so he still gets by."
	basic_mob_flags = NONE
	gender = MALE
	held_weapon_visual = /obj/item/fishing_rod

	ai_controller = /datum/ai_controller/basic_controller/trader

	spawner_path = /obj/effect/mob_spawn/corpse/human/old_fisherman
	loot = list(/obj/effect/mob_spawn/corpse/human/old_fisherman)

	trader_data_path = /datum/trader_data/old_fisherman

/mob/living/basic/trader/stalker
	name = "147 Bolshevik"
	desc = "An intense looking man pushing into middle age. His gaze is sharp and distant."
	basic_mob_flags = NONE
	gender = MALE
	ranged_attack_casing = /obj/item/ammo_casing/c40sol
	held_weapon_visual = /obj/item/gun/ballistic/automatic/sol_rifle/evil

	ai_controller = /datum/ai_controller/basic_controller/trader/jumpscare

	spawner_path = /obj/effect/mob_spawn/corpse/human/gakstermob
	loot = list(/obj/effect/mob_spawn/corpse/human/gakstermob)

	trader_data_path = /datum/trader_data/stalker

/mob/living/basic/trader/lethal_pusher
	name = "43 Knives"
	desc = "A woman you haven't seen much of, even though she's definitely been around. She looks sketchy, even for Pluto."
	basic_mob_flags = NONE
	gender = FEMALE
	ranged_attack_casing = /obj/item/ammo_casing/c585trappiste
	held_weapon_visual = /obj/item/gun/ballistic/automatic/xhihao_smg

	ai_controller = /datum/ai_controller/basic_controller/trader/

	spawner_path = /obj/effect/mob_spawn/corpse/human/lethal_pusher
	loot = list(/obj/effect/mob_spawn/corpse/human/lethal_pusher)

	trader_data_path = /datum/trader_data/lethal_pusher
