/obj/item/vintage_stone
	name = "rock"
	desc = "What if I kil you wit a rock."
	icon = 'modular_vintage/random_resources/icons/rocks.dmi'
	icon_state = "rock_1"
	base_icon_state = "rock"
	w_class = WEIGHT_CLASS_NORMAL
	/// How many variations of sprite does this have?
	var/icon_variations = 3

/obj/item/vintage_stone/Initialize(mapload)
	. = ..()
	icon_state = "[base_icon_state]_[rand(1, icon_variations)]"

/obj/item/vintage_stone/flint
	name = "flint"
	desc = "The cooler rock."
	icon_state = "flint_1"
	base_icon_state = "flint"
