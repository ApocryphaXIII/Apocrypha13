/datum/action/cooldown/power/saiyan

/atom/movable/screen/alert/status_effect/saiyan
	icon = 'modular_darkpack/modules/dragon_ball/icons/assets.dmi'
	// icon_state = "bg_gift"
	overlay_icon = 'modular_darkpack/modules/dragon_ball/icons/assets.dmi'


/datum/action/cooldown/power/saiyan/super_saiyan
	desc = "An advanced transformation."
	button_icon_state = "aura"
	cooldown_time = 3 SCENES


/datum/action/cooldown/power/saiyan/super_saiyan/Activate(atom/target)
	. = ..()
	playsound(owner, 'modular_darkpack/modules/dragon_ball/sounds/WAVE_SE_1B.wav', 75, FALSE)
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
		owner.set_haircolor("#F0E2B6")

		human_owner.st_add_stat_mod(STAT_DEXTERITY, 5, "super_saiyan")
		human_owner.st_add_stat_mod(STAT_STRENGTH, 5, "super_saiyan")
		human_owner.st_add_stat_mod(STAT_STAMINA, 5, "super_saiyan")

		human_owner.remove_overlay(MUTATIONS_LAYER)
		var/mutable_appearance/song_overlay = mutable_appearance('modular_darkpack/modules/dragon_ball/icons/assets.dmi', "aura", -FRONT_MUTATIONS_LAYER)
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
	overlay_state = /datum/action/cooldown/power/saiyan/super_saiyan::button_icon_state


/datum/action/cooldown/power/saiyan/kamehameha
	name = "Kamehameha"
	desc = "A signature attack of the students of the Turtle School."
	click_to_activate = TRUE


/datum/action/cooldown/power/saiyan/kamehameha/Activate(atom/target)
	. = ..()

	var/obj/projectile/beam/kamehameha/blast = new(owner.loc)
	blast.firer = owner
	blast.def_zone = ran_zone(owner.zone_selected)
	blast.aim_projectile(target, owner)
	INVOKE_ASYNC(blast, TYPE_PROC_REF(/obj/projectile, fire))
	playsound(owner, 'modular_darkpack/modules/dragon_ball/sounds/BCCMNSND_00045.wav', 75, TRUE)

	StartCooldown()
	return TRUE


/obj/projectile/beam/kamehameha
	hitscan = TRUE

	muzzle_type = /obj/effect/projectile/muzzle/kamehameha
	tracer_type = /obj/effect/projectile/tracer/kamehameha
	impact_type = /obj/effect/projectile/impact/kamehameha

	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = COLOR_BLUE_LIGHT

/obj/effect/projectile/muzzle/kamehameha
	icon_state = "muzzle"
	icon = 'modular_darkpack/modules/dragon_ball/icons/kamehameha.dmi'

/obj/effect/projectile/tracer/kamehameha
	icon_state = "tracer"
	icon = 'modular_darkpack/modules/dragon_ball/icons/kamehameha.dmi'

/obj/effect/projectile/impact/kamehameha
	icon_state = "impact"
	icon = 'modular_darkpack/modules/dragon_ball/icons/kamehameha.dmi'

// /datum/action/cooldown/power/saiyan/energy_ball

/obj/projectile/beam/energy_ball

// /datum/action/cooldown/power/saiyan/flight
