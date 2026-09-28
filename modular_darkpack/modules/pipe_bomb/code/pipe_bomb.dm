/obj/item/grenade/frag/pipe_bomb
	name = "pipe bomb"
	desc = "A haphazardly put together explosive device, often used by militia and domestic terrorist forces."
	icon = 'modular_darkpack/modules/pipe_bomb/icons/pipe_bomb.dmi'
	icon_state = "pipe_bomb"
	inhand_icon_state = "pipe_bomb"
	lefthand_file = 'modular_darkpack/modules/pipe_bomb/icons/inhand_lefthand.dmi'
	righthand_file = 'modular_darkpack/modules/pipe_bomb/icons/inhand_righthand.dmi'
	ONFLOOR_ICON_HELPER('modular_darkpack/modules/pipe_bomb/icons/onfloor.dmi')
	shrapnel_type = /obj/projectile/bullet/shrapnel
	shrapnel_radius = 4
	ex_heavy = 1
	ex_light = 3
	ex_flame = 3

/datum/crafting_recipe/pipe_bomb
	name = "Pipe bomb"
	time = 150
	reqs = list(/obj/item/stack/sheet/iron = 5, /obj/item/stack/cable_coil = 2, /datum/reagent/gunpowder = 35, /obj/item/stack/medical/wrap/sticky_tape/duct = 1)
	tool_paths = list(
		/obj/item/screwdriver,
	)
	result = /obj/item/grenade/frag/pipe_bomb
	category = CAT_WEAPON_RANGED
