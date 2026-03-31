/mob/living/basic/saibamen
	name = "saibamen"
	// desc = "The pinnacle of bestial terror. Unbelievably tough."

	icon = 'modular_darkpack/modules/dragon_ball/icons/saibamen.dmi'
	icon_state = "saibamen"
	icon_living = "saibamen"

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
