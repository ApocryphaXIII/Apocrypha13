/obj/effect/mapping_helpers/deleter
	name = "Deleter"
	desc = "Supply a type-path and watch it DISAPPEAR!"
	icon = 'modular_zapoc/modules/mapping/icons/mapping_helpers.dmi'
	icon_state = "cut"
	var/list/objs_to_del = list() // VAR EDIT ME
	var/chance_to_del = 100
	var/range = 0

/obj/effect/mapping_helpers/deleter/Initialize(mapload)
	. = ..()
	if(!objs_to_del.len)
		stack_trace("Deleter helper placed with no target type!")
		return INITIALIZE_HINT_QDEL

	if(prob(chance_to_del))
		for(var/atom/movable/turf_contents in range(range, src))
			for(var/type in objs_to_del)
				if(istype(turf_contents, type))
					qdel(turf_contents)


