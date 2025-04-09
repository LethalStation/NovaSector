/mob/living/simple_animal/hostile/zombie
	name = "Shambling Corpse"
	desc = "When there is no more room in hell, the dead will walk in outer space."
	icon = 'icons/mob/simple/simple_human.dmi'
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	sentience_type = SENTIENCE_HUMANOID
	speak_chance = 0
	stat_attack = HARD_CRIT //braains
	maxHealth = 100
	health = 100
	harm_intent_damage = 5
	melee_damage_lower = 21
	melee_damage_upper = 21
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	attack_vis_effect = ATTACK_EFFECT_BITE
	combat_mode = TRUE
	atmos_requirements = null
	minbodytemp = 0
	status_flags = CANPUSH
	death_message = "collapses, flesh gone in a pile of bones!"
	del_on_death = TRUE
	loot = list(/obj/effect/decal/remains/human)
	/// The probability that we give people real zombie infections on hit.
	var/infection_chance = 0
	/// Outfit the zombie spawns with for visuals.
	var/outfit = /datum/outfit/corpse_doctor

/mob/living/simple_animal/hostile/zombie/Initialize(mapload)
	. = ..()
	apply_dynamic_human_appearance(src, outfit, /datum/species/zombie, bloody_slots = ITEM_SLOT_OCLOTHING)

/mob/living/simple_animal/hostile/zombie/AttackingTarget(atom/attacked_target)
	. = ..()
	if(. && ishuman(target) && prob(infection_chance))
		try_to_zombie_infect(target)

/datum/outfit/corpse_doctor
	name = "Corpse Doctor"
	suit = /obj/item/clothing/suit/toggle/labcoat
	uniform = /obj/item/clothing/under/rank/medical/doctor
	shoes = /obj/item/clothing/shoes/sneakers/white
	back = /obj/item/storage/backpack/medic

/datum/outfit/corpse_assistant
	name = "Corpse Assistant"
	mask = /obj/item/clothing/mask/gas
	uniform = /obj/item/clothing/under/color/grey
	shoes = /obj/item/clothing/shoes/sneakers/black
	back = /obj/item/storage/backpack

//LETHAL zombie test - survival horror type zombie

/mob/living/simple_animal/hostile/zombie/lethal
	name = "Test Subject"
	desc = "Some things are best left buried under the surface of Pluto. Unfortunately, not all of them are so easy to keep in the ground."
	icon = 'icons/mob/simple/simple_human.dmi'
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	sentience_type = SENTIENCE_HUMANOID
	speak_chance = 0
	stat_attack = HARD_CRIT //braains
	maxHealth = 800
	health = 800
	harm_intent_damage = 5
	melee_damage_lower = 50
	melee_damage_upper = 76 //I want it to hurt
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	attack_vis_effect = ATTACK_EFFECT_BITE
	combat_mode = TRUE
	atmos_requirements = null
	minbodytemp = 0
	status_flags = CANPUSH
	damage_coeff = list(BRUTE = 1, BURN = 2, TOX = -1, STAMINA = 0, OXY = 0) //weak to burn, heals from tox. can't suffocate (is a zombie)
	speed = 8 //higher speed = slower. this idea is they're slow and shambly but hit like a truck
	death_message = "collapses onto the floor, lifelessly."
	del_on_death = FALSE
	loot = list(/obj/effect/decal/remains/human)
	/// The probability that we give people real zombie infections on hit.
	infection_chance = 1 //:3c
	/// Outfit the zombie spawns with for visuals.
	outfit = /datum/outfit/prisoner
