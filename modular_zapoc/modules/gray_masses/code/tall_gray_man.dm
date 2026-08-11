// TALL GRAY MAN - Legionnaire
/mob/living/simple_animal/hostile/asteroid/elite/legionnaire/gray_masses
	name = "tall gray man"
	desc = "A towering skeleton, embodying the terrifying power of the Gray Masses."
	icon = 'modular_zapoc/modules/gray_masses/icons/gray_masses_tall.dmi'
	loot_drop = list(/obj/effect/spawner/random/occult/artifact)
	attack_action_types = list(
		/datum/action/innate/elite_attack/legionnaire_charge,
		/datum/action/innate/elite_attack/head_detach,
		/datum/action/innate/elite_attack/bonfire_teleport,
		/datum/action/innate/elite_attack/spew_smoke
	)
	bonfire_type = /obj/structure/legionnaire_bonfire/gray_masses

/mob/living/simple_animal/hostile/asteroid/elite/legionnairehead/gray_masses
	name = "spore sac"
	desc = "The gray man's head floating by itself.  One shouldn't get too close, though once it sees you, you really don't have a choice."
	icon = 'modular_zapoc/modules/gray_masses/icons/gray_masses_tall.dmi'

/obj/structure/legionnaire_bonfire/gray_masses
	name = "fungal membrane"
	desc = "A big mushroom which seems to occasionally move a little.  It's probably a good idea to smash it. Don't inhale the spores, though."
	icon = 'modular_zapoc/modules/gray_masses/icons/gray_masses.dmi'
	light_color = COLOR_VERY_SOFT_YELLOW
