/mob/living/basic/saibamen
	name = "saibamen"
	// desc = "The pinnacle of bestial terror. Unbelievably tough."

	icon = 'modular_darkpack/modules/dragon_ball/icons/saibamen.dmi'
	icon_state = "saibamen"
	icon_living = "saibamen"
	icon_dead = "saibamen"

	faction = list(FACTION_HOSTILE)

	mob_biotypes = MOB_PLANT|MOB_HUMANOID
	mob_size = MOB_SIZE_SMALL
	maxHealth = 200
	health = 200
	butcher_results = list(
		/obj/effect/spawner/random/medical/organs = 1,
		/obj/effect/spawner/random/food_or_drink/seed = 3,
	)
	melee_damage_lower = 30
	melee_damage_upper = 30
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/items/weapons/slash.ogg'
	combat_mode = TRUE

	ai_controller = /datum/ai_controller/basic_controller/simple/simple_hostile_obstacles

/mob/living/basic/saibamen/death()
	. = ..()
	visible_message(span_warning("[src] explodes!"))
	explosion(src, flame_range = 3, adminlog = FALSE)
	gib(DROP_ALL_REMAINS)

/obj/item/saibamen_seed
	name = "saibamen seed"
	desc = "Can be used to grow a saibamen of a power level of up to 1200 if grown on earth!!"
	icon = 'modular_darkpack/modules/dragon_ball/icons/beans.dmi'
	ONFLOOR_ICON_HELPER('modular_darkpack/modules/dragon_ball/icons/beans_onfloor.dmi')
	icon_state = "seed"

	w_class = WEIGHT_CLASS_SMALL

/obj/item/saibamen_seed/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(!isturf(interacting_with))
		return

	var/static/list/turfs_to_consider = typecacheof(list(
		/turf/open/misc/asteroid,
		/turf/open/misc/beach,
		/turf/open/misc/dirt,
		/turf/open/misc/grass,
		/turf/open/misc/basalt,
		/turf/open/misc/ashplanet,
		/turf/open/misc/snow,
		/turf/open/misc/sandy_dirt,
	))

	if(!is_type_in_typecache(interacting_with, turfs_to_consider))
		to_chat(user, span_warning("[src] has to be planted in the ground."))
		return NONE

	if(!do_after(user, 1 SECONDS, src))
		return

	user.visible_message(
		span_warning("[user] plants a seed that sprouts out of the ground rapidy, shifting and contorting into a creature!"),
		span_warning("You plant [src] and it quickly starts to grow into a creature."),
		span_warning("You hear shifting roots and soil.")
	)

	var/mob/living/carbon/human/human_user = astype(user)
	human_user?.add_beastmaster_minion(/mob/living/basic/saibamen, interacting_with)

	qdel(src)

