/obj/item/molotov
	name = "molotov cocktail"
	desc = "Well fire weapon."
	icon_state = "molotov"
	icon = 'modular_darkpack/modules/weapons/icons/weapons.dmi'
	ONFLOOR_ICON_HELPER('modular_darkpack/modules/deprecated/icons/onfloor.dmi')
	w_class = WEIGHT_CLASS_SMALL
	masquerade_violating = TRUE
	var/active = FALSE
	var/explode_timer

/obj/item/molotov/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	explode()

/obj/item/molotov/attackby(obj/item/I, mob/user, params)
	if(I.get_temperature() && !active)
		activate()

/obj/item/molotov/proc/activate(mob/user)
	active = TRUE
	log_bomber(user, "has primed a", src, "for detonation")
	icon_state = "molotov_flamed"

	explode_timer = addtimer(CALLBACK(src, PROC_REF(explode)), rand(15 SECONDS, 45 SECONDS), TIMER_STOPPABLE | TIMER_DELETE_ME)

/obj/item/molotov/proc/explode()
	deltimer(explode_timer)

	var/atom/explode_location = get_turf(src)

	for(var/turf/open/floor/floor in range(2, explode_location))
		new /obj/effect/decal/cleanable/gasoline(floor)

	if(active)
		new /obj/effect/fire(explode_location)

	playsound(explode_location, 'modular_darkpack/modules/deprecated/sounds/explode.ogg', 100, TRUE)
	qdel(src)
