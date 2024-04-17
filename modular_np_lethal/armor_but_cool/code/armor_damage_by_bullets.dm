/// Checks the armor that the person is wearing when they are attacked and damages it under the correct conditions
/mob/living/proc/damage_armor(damage = 0, damage_flag = MELEE, damage_type = BRUTE, sharpness = NONE, def_zone = BODY_ZONE_CHEST)
	return FALSE

/mob/living/carbon/human/damage_armor(damage = 0, damage_type = BRUTE, def_zone = BODY_ZONE_CHEST)
	var/obj/item/bodypart/affecting
	if(def_zone)
		if(isbodypart(def_zone))
			affecting = def_zone
		else
			affecting = get_bodypart(check_zone(def_zone))

	if(!affecting)
		return FALSE

	var/list/clothings = get_clothing_on_part(affecting)
	for(var/obj/item/clothing/clothing in clothings)
		if(clothing.take_damage_zone(def_zone, damage, damage_type, 100))
			return TRUE

	return FALSE

// Override of living bullet_act that also damages the armor someone is wearing

/mob/living/bullet_act(obj/projectile/hitting_projectile, def_zone, piercing_hit = FALSE)
	. = ..()
	if(. != BULLET_ACT_HIT)
		return .
	if(!hitting_projectile.is_hostile_projectile())
		return BULLET_ACT_HIT

	// we need a second, silent armor check to actually know how much to reduce damage taken, as opposed to
	// on [/atom/proc/bullet_act] where it's just to pass it to the projectile's on_hit().
	var/armor_check = check_projectile_armor(def_zone, hitting_projectile, is_silent = TRUE)

	var/flat_reduction = getarmor(def_zone, impacting_projectile.armor_flag) / 4
	var/armor_damage = ((hitting_projectile.armour_penetration + 100) / 100) * (hitting_projectile.damage - (hitting_projectile.damage - flat_reduction))

	apply_damage(
		damage = max(0, hitting_projectile.damage - flat_reduction),
		damagetype = hitting_projectile.damage_type,
		def_zone = def_zone,
		blocked = min(ARMOR_MAX_BLOCK, armor_check),  //cap damage reduction at 90%
		wound_bonus = hitting_projectile.wound_bonus,
		bare_wound_bonus = hitting_projectile.bare_wound_bonus,
		sharpness = hitting_projectile.sharpness,
		attack_direction = get_dir(hitting_projectile.starting, src),
	)
	apply_effects(
		stun = hitting_projectile.stun,
		knockdown = hitting_projectile.knockdown,
		unconscious = hitting_projectile.unconscious,
		slur = (mob_biotypes & MOB_ROBOTIC) ? 0 SECONDS : hitting_projectile.slur, // Don't want your cyborgs to slur from being ebow'd
		stutter = (mob_biotypes & MOB_ROBOTIC) ? 0 SECONDS : hitting_projectile.stutter, // Don't want your cyborgs to stutter from being tazed
		eyeblur = hitting_projectile.eyeblur,
		drowsy = hitting_projectile.drowsy,
		blocked = armor_check,
		stamina = hitting_projectile.stamina,
		jitter = (mob_biotypes & MOB_ROBOTIC) ? 0 SECONDS : hitting_projectile.jitter, // Cyborgs can jitter but not from being shot
		paralyze = hitting_projectile.paralyze,
		immobilize = hitting_projectile.immobilize,
	)

	// If the damage type isn't one of the types that already does clothing damage, then we damage armor
	if((hitting_projectile.damage_type == BRUTE) && !(hitting_projectile.sharpness = SHARP_EDGED))
		damage_armor(
			armor_damage,
			hitting_projectile.damage_type,
			def_zone,
		)

	if(hitting_projectile.dismemberment)
		check_projectile_dismemberment(hitting_projectile, def_zone)
	return BULLET_ACT_HIT
