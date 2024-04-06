// Vein finder, uses strong LED lights to reveal veins in someone's body. Perhaps the name "LEDX" rings a bell
/obj/item/epic_loot/vein_finder
	name = "medical vein locator"
	desc = "A small device with a number of high intensity lights on one side. Used by medical professionals to locate veins in someone's body."
	icon_state = "vein_finder"
	inhand_icon_state = "headset"
	drop_sound = 'sound/items/handling/component_drop.ogg'
	pickup_sound = 'sound/items/handling/component_pickup.ogg'

/obj/item/epic_loot/vein_finder/afterattack(atom/target, mob/user, proximity_flag)
	. = ..()
	if(!proximity_flag)
		return
	if(!ishuman(target))
		return
	user.visible_message(
		"[user] determines that [target] does, in fact, have veins.",
		"You determine that [target] does, in fact, have veins."
	)
	new /obj/effect/temp_visual/medical_holosign(get_turf(target), user)

// Eyescope, a now rare device that was used to check the eyes of patients before the universal health scanner became common
/obj/item/epic_loot/eye_scope
	name = "medical eye-scope"
	desc = "An outdated device used to examine a patient's eyes. Rare now due to the outbreak of the universal health scanner."
	icon_state = "eyescope"
	inhand_icon_state = "zippo"
	drop_sound = 'sound/items/handling/component_drop.ogg'
	pickup_sound = 'sound/items/handling/component_pickup.ogg'
