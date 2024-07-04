/obj/item/stack/medical/wound_recovery/robofoam_super/interact_with_atom(obj/item/clothing/target, mob/user, proximity_flag, click_parameters)
    . = ..()
    if(!proximity_flag || !istype(target))
        return FALSE
    target.balloon_alert(user, "repairing...")
    if(do_after(user, 10 SECONDS, target))
        if(use(1, check = TRUE))
            target.repair(user)
            playsound(target, treatment_sound, 100, TRUE)
    else
        return FALSE
