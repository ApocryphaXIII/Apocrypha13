/obj/structure/man_crystal
	name = "strange crystal"
	icon = 'modular_zapoc/modules/decor/icons/man_crystal.dmi'
	icon_state = "crystal"
	anchored = TRUE
	density = TRUE
	max_integrity = 400
	color = "#c4eaff"

/obj/structure/man_crystal/Initialize(mapload)
	. = ..()
	set_light(6, l_color = color)

/obj/structure/man_crystal/atom_destruction(damage_flag)
	. = ..()
	//new /obj/effect/mob_spawn/human/corpse/damaged/legioninfested/permafrost(loc)
	set_light(0)
