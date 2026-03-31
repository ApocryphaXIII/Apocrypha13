/datum/action/cooldown/power/saiyan
	background_icon_state = "bg_saiyan"
	background_icon = 'modular_darkpack/modules/dragon_ball/icons/hud.dmi'

	button_icon = 'modular_darkpack/modules/dragon_ball/icons/hud.dmi'

/atom/movable/screen/alert/status_effect/saiyan
	icon_state = /datum/action/cooldown/power/saiyan::background_icon_state
	icon = /datum/action/cooldown/power/saiyan::background_icon

/datum/action/cooldown/power/saiyan/super_saiyan
	name = "Super Saiyan"
	desc = "An advanced transformation."

	button_icon_state = "super_saiyan"
	cooldown_time = 3 SCENES

/datum/action/cooldown/power/saiyan/super_saiyan/Activate(atom/target)
	. = ..()
	playsound(owner, 'modular_darkpack/modules/dragon_ball/sounds/wave.wav', 75, FALSE)
	owner.emote("scream")
	var/mob/living/living_owner = astype(owner)
	living_owner?.apply_status_effect(/datum/status_effect/super_saiyan)

/datum/status_effect/super_saiyan
	id = "super_saiyan"
	duration = 1 SCENES
	status_type = STATUS_EFFECT_REPLACE
	alert_type = /atom/movable/screen/alert/status_effect/saiyan/super_saiyan
	var/old_hair_color

/datum/status_effect/super_saiyan/on_apply()
	. = ..()

	var/mob/living/carbon/human/human_owner = astype(owner)
	if(human_owner)
		old_hair_color = human_owner.hair_color
		human_owner.set_haircolor("#fffbbc")

		human_owner.st_add_stat_mod(STAT_DEXTERITY, 10, "super_saiyan")
		human_owner.st_add_stat_mod(STAT_STRENGTH, 5, "super_saiyan")
		human_owner.st_add_stat_mod(STAT_STAMINA, 5, "super_saiyan")

		// This is a acctually a bad implementation for anyone curious despite this being how we are doing all our disc stuff rn.
		// See `addtimer(CALLBACK(src, TYPE_PROC_REF(/atom, cut_overlay` for how you would acctually wanna do this
		human_owner.remove_overlay(MUTATIONS_LAYER)
		var/mutable_appearance/song_overlay = mutable_appearance('modular_darkpack/modules/dragon_ball/icons/aura.dmi', "aura", -FRONT_MUTATIONS_LAYER)
		human_owner.overlays_standing[MUTATIONS_LAYER] = song_overlay
		human_owner.apply_overlay(MUTATIONS_LAYER)


/datum/status_effect/super_saiyan/on_remove()
	var/mob/living/carbon/human/human_owner = astype(owner)
	if(human_owner)
		human_owner.set_haircolor(old_hair_color)

		human_owner.st_remove_stat_mod(STAT_DEXTERITY, "super_saiyan")
		human_owner.st_remove_stat_mod(STAT_STRENGTH, "super_saiyan")
		human_owner.st_remove_stat_mod(STAT_STAMINA, "super_saiyan")

		human_owner.remove_overlay(MUTATIONS_LAYER)

	return ..()

/atom/movable/screen/alert/status_effect/saiyan/super_saiyan
	name = /datum/action/cooldown/power/saiyan/super_saiyan::name
	desc = /datum/action/cooldown/power/saiyan/super_saiyan::desc
	overlay_icon = /datum/action/cooldown/power/saiyan/super_saiyan::button_icon
	overlay_state = /datum/action/cooldown/power/saiyan/super_saiyan::button_icon_state


/datum/action/cooldown/power/saiyan/projectile
	click_to_activate = TRUE
	// Its shitcode
	shared_cooldown = MOB_SHARED_COOLDOWN_1
	var/projectile_type
	var/projectile_sound_effect = 'modular_darkpack/modules/dragon_ball/sounds/blast.wav'

/datum/action/cooldown/power/saiyan/projectile/Activate(atom/target)
	. = ..()

	var/obj/projectile/blast = new projectile_type(owner.loc)
	blast.firer = owner
	blast.def_zone = ran_zone(owner.zone_selected)
	blast.aim_projectile(target, owner)
	INVOKE_ASYNC(blast, TYPE_PROC_REF(/obj/projectile, fire))
	playsound(owner, projectile_sound_effect, 75, TRUE)

	StartCooldown()
	return TRUE


/datum/action/cooldown/power/saiyan/projectile/kamehameha
	name = "Kamehameha"
	desc = "A signature attack of the students of the Turtle School."
	button_icon_state = "laser"
	click_to_activate = TRUE
	projectile_type = /obj/projectile/beam/kamehameha

/obj/projectile/beam/kamehameha
	hitscan = TRUE

	damage = 75

	muzzle_type = /obj/effect/projectile/muzzle/kamehameha
	tracer_type = /obj/effect/projectile/tracer/kamehameha
	impact_type = /obj/effect/projectile/impact/kamehameha

	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = COLOR_BLUE_LIGHT

/obj/projectile/beam/kamehameha/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(. == BULLET_ACT_HIT)
		explosion(target, light_impact_range = 2, flame_range = 0, flash_range = 1, adminlog = FALSE)
		playsound(target.loc, 'sound/effects/meteorimpact.ogg', 40, TRUE)


/obj/effect/projectile/muzzle/kamehameha
	icon_state = "muzzle"
	icon = 'modular_darkpack/modules/dragon_ball/icons/kamehameha.dmi'

/obj/effect/projectile/tracer/kamehameha
	icon_state = "tracer"
	icon = 'modular_darkpack/modules/dragon_ball/icons/kamehameha.dmi'

/obj/effect/projectile/impact/kamehameha
	icon_state = "impact"
	icon = 'modular_darkpack/modules/dragon_ball/icons/kamehameha.dmi'


/datum/action/cooldown/power/saiyan/projectile/energy_ball
	name = "Energy Ball"
	desc = "A generic ki blast."
	button_icon_state = "ball"
	projectile_type = /obj/projectile/beam/energy_ball

/obj/projectile/beam/energy_ball
	icon_state = "ball"
	icon = 'modular_darkpack/modules/dragon_ball/icons/kamehameha.dmi'

	damage = 125

	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = COLOR_BLUE_LIGHT

/obj/projectile/beam/energy_ball/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(. == BULLET_ACT_HIT)
		explosion(target, light_impact_range = 2, flame_range = 0, flash_range = 1, adminlog = FALSE)
		playsound(target.loc, 'sound/effects/meteorimpact.ogg', 40, TRUE)

// /datum/action/cooldown/power/saiyan/flight
