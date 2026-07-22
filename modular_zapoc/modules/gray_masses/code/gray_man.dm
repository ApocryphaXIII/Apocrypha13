// Gray Man
/mob/living/basic/mining/legion/gray_masses
	name = "gray man"
	desc = "You can still see what was once a human under the shifting mass of corruption."
	icon = 'modular_zapoc/modules/gray_masses/icons/gray_masses.dmi'
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	corpse_type = /obj/effect/mob_spawn/corpse/human/gray_masses
	brood_type = /mob/living/basic/mining/legion_brood/gray_masses

/// Create what we want to drop on death, in proc form so we can always return a static list
/mob/living/basic/mining/legion/gray_masses/get_loot_list()
	var/static/list/death_loot = list(/obj/item/organ/monster_core/regenerative_core/legion/gray_masses)
	return death_loot

/mob/living/basic/mining/legion/spawner_made
	corpse_type = /obj/effect/mob_spawn/corpse/human/legioninfested/skeleton/charred/gray_masses

/// Like a Gray Man but shorter and faster
/mob/living/basic/mining/legion/dwarf/gray_masses
	name = "small gray man"
	desc = "You can still see what was once a rather small human under the shifting mass of corruption."
	icon = 'modular_zapoc/modules/gray_masses/icons/gray_masses.dmi'
	corpse_type = /obj/effect/mob_spawn/corpse/human/gray_masses/dwarf

// HUGE sovlful Gray Man
/mob/living/basic/mining/legion/large/gray_masses
	name = "enormous gray man"
	desc = "A dead end to whatever form the Gray Masses were attempting to create."
	icon = 'modular_zapoc/modules/gray_masses/icons/gray_masses_64x64.dmi'
	spawn_type = /mob/living/basic/mining/legion/gray_masses

/mob/living/basic/mining/legion/large/gray_masses/get_loot_list()
	var/static/list/death_loot = list(/obj/item/organ/monster_core/regenerative_core/legion/gray_masses = 3, /obj/effect/mob_spawn/corpse/human/gray_masses = 4)
	return death_loot

/mob/living/basic/mining/legion_brood/gray_masses
	name = "spore"
	desc = "A mass of spores shaped like a charred skull vomiting fungus. Yuck."
	icon = 'modular_zapoc/modules/gray_masses/icons/gray_masses.dmi'
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID

/mob/living/basic/mining/legion_brood/gray_masses/get_legion_type(mob/living/carbon/human/target)
	if(ismonkey(target) || HAS_TRAIT(target, TRAIT_DWARF))
		return /mob/living/basic/mining/legion/dwarf/gray_masses
	return /mob/living/basic/mining/legion/gray_masses


/obj/effect/spawner/random/lavaland_mob/legion/gray_masses
	name = "random gray man"
	desc = "Chance to spawn a rare shiny version."
	icon = 'modular_zapoc/modules/gray_masses/icons/gray_masses.dmi'
	icon_state = "legion"
	loot = list(
		/mob/living/basic/mining/legion/gray_masses = 19,
		/mob/living/basic/mining/legion/dwarf/gray_masses = 1,
	)
