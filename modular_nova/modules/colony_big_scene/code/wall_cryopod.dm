/obj/item/wallframe/wall_cryopod
	name = "unmounted wall cryogenic freezer"
	desc = "A wall-mount for a cryogenic freezer, able to store personnel that will be effected by extended periods of 'oh so eepy sleepy'."
	icon = 'modular_nova/modules/cryosleep/icons/cryogenics.dmi'
	icon_state = "prisonpod"
	w_class = WEIGHT_CLASS_NORMAL
	result_path = /obj/machinery/cryopod/prison
	pixel_shift = 18
	custom_materials = list(
		/datum/material/iron = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/glass = SHEET_MATERIAL_AMOUNT * 5,
		/datum/material/gold = SHEET_MATERIAL_AMOUNT,
	)
