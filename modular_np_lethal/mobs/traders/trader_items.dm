//grey's stuff

/obj/effect/mob_spawn/corpse/human/grey_gakdog
	name = "\improper Corpse of 0 Grey"
	outfit = /datum/outfit/grey_gakdog
	hairstyle = "McSqueeb"
	haircolor = "#436ea7"
	facial_hairstyle = "Shaved"
	mob_name = "0 Grey"

/datum/outfit/grey_gakdog
	name = "\improper Corpse of 0 Grey"
	uniform = /obj/item/clothing/under/frontier_colonist
	suit = /obj/item/clothing/suit/jacket/leather/biker
	shoes = /obj/item/clothing/shoes/jackboots/frontier_colonist
	gloves = /obj/item/clothing/gloves/frontier_colonist
	ears = /obj/item/radio/headset/headset_frontier_colonist
	head = /obj/item/clothing/head/soft/frontier_colonist
	back = /obj/item/storage/backpack/industrial/frontier_colonist/satchel

/obj/structure/trader_sign/grey_gakdog
	name = "'DOG STAR MAN' Hot Dogs"
	desc = "Auspiciously known as the Pentola's first restraunt venture, this stand sells hot dog and buys \
	scavenged, shelf-stable food products. The sign, depicting a human sized hot dog man gleefully applying \
	ketchup and mustard to himsself, is the best or worst part of this place according to who you ask."
	icon = 'modular_np_lethal/mobs/traders/trader_icons.dmi'
	icon_state = "DOG_STAR_MAN"
	max_integrity = 2000

//special food for grey

/datum/reagent/consumable/mustard
	name = "Mustard"
	description = "A paste of ground mustard seeds, vinegar, and largely synthetic emulsifiers."
	nutriment_factor = 5
	color = "#c79800"
	taste_description = "mustard"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED
	default_container = /obj/item/reagent_containers/condiment/mustard

/obj/item/reagent_containers/condiment/mustard
	name = "mustard"
	desc = "A bottle of mustard rendered shelf stable through the power of chemical additives."
	icon = 'modular_np_lethal/mobs/traders/trader_icons.dmi'
	icon_state = "mustard"
	list_reagents = list(/datum/reagent/consumable/mustard = 50)
	fill_icon_thresholds = null

//bar's stuff

/obj/effect/mob_spawn/corpse/human/old_fisherman
	name = "\improper Corpse of 73 Bar"
	outfit = /datum/outfit/old_fisherman
	hairstyle = "Balding Hair"
	haircolor = "#d8d8d8"
	facial_hairstyle = "Tentacle Beard"
	facial_haircolor = "#d8d8d8"
	mob_name = "73 Bar"

/datum/outfit/old_fisherman
	name = "\improper Corpse of 73 Bar"
	uniform = /obj/item/clothing/under/frontier_colonist
	suit = /obj/item/clothing/suit/jacket/miljacket
	shoes = /obj/item/clothing/shoes/jackboots/frontier_colonist
	gloves = /obj/item/clothing/gloves/frontier_colonist
	ears = /obj/item/radio/headset/headset_frontier_colonist
	head = /obj/item/clothing/head/beanie/red

/obj/structure/trader_sign/old_fisherman
	name = "Ol' Fishin Stand"
	desc = "Auspiciously known as the Pentola's first restraunt venture, this stand sells hot dog and buys \
	scavenged, shelf-stable food products."
	icon = 'modular_np_lethal/mobs/traders/trader_icons.dmi'
	icon_state = "catfish"
	max_integrity = 2000

//bolshevik's stuff

/obj/structure/trader_sign/stalker
	name = "Guns n' Ammo"
	desc = "One of the more daring commercial ventures in the area, selling gear right in the raid."
	icon = 'modular_np_lethal/mobs/traders/trader_icons.dmi'
	icon_state = "sindano_evil"
	max_integrity = 2000

/obj/item/lethal_morale_patch
	name = "morale patch"
	desc = "These patches are usually affixed to garments, plate carriers, and bags, and represent their wearer's affiliations, tastes, and sense of memetic humor."
	icon = 'modular_np_lethal/mobs/traders/trader_icons.dmi'
	icon_state = "morale_patch_1"
	w_class = WEIGHT_CLASS_TINY
	var/list/random_icon_states = list(
		"morale_patch_1",
		"morale_patch_2",
		"morale_patch_3",
		"morale_patch_4",
		"morale_patch_5",
		"morale_patch_6",
		"morale_patch_7",
	)

/obj/item/lethal_morale_patch/Initialize(mapload)
	. = ..()
	icon_state = pick(random_icon_states)
	update_appearance()

//knives' stuff

/obj/effect/mob_spawn/corpse/human/lethal_pusher
	name = "\improper Corpse of 43 Knives"
	outfit = /datum/outfit/lethal_pusher
	hairstyle = "Emo"
	haircolor = "#49003f"
	facial_hairstyle = "Shaved"
	mob_name = "43 Knives"

/datum/outfit/lethal_pusher
	name = "\improper Corpse of 43 Knives"
	uniform = /obj/item/clothing/under/frontier_colonist
	suit = /obj/item/clothing/suit/kimjacket
	shoes = /obj/item/clothing/shoes/jackboots/frontier_colonist
	gloves = /obj/item/clothing/gloves/frontier_colonist
	ears = /obj/item/radio/headset/headset_frontier_colonist
	mask = /obj/item/clothing/mask/gas/respirator
	glasses = /obj/item/clothing/glasses/kim
	head = /obj/item/clothing/head/soft/frontier_colonist
	back = /obj/item/storage/backpack/industrial/frontier_colonist/messenger

/obj/structure/trader_sign/lethal_pusher
	name = "The Shit"
	desc = "Narcotics are one of humankind's earliest creations. With Pluto's functionally \
	nonexistent law enforcement, shops like this thrive so long as they stay within the graces \
	of the locals."
	icon = 'modular_np_lethal/mobs/traders/trader_icons.dmi'
	icon_state = "pill"
	max_integrity = 2000
