/obj/effect/decal/cleanable/ash/gray_masses
	name = "pile of spores"
	desc = "Shrooms, anyone?"
	alpha = 1

/obj/effect/decal/cleanable/ash/gray_masses/Initialize()
	. = ..()
	animate(src, alpha = 255, time = 3 SECONDS, loop = 0)

/*
/obj/effect/particle_effect/fluid/smoke/gray_masses
	name = "spore cloud"
	icon = 'code/modules/wod13/fog.dmi'
	icon_state = "fog"
	pixel_x = -112
	pixel_y = -112
	opacity = FALSE
	alpha = 64
	color = "#B9BB93"
	layer = FLY_LAYER
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	animate_movement = FALSE
	lifetime = 4
	opaque = 1 //whether the smoke can block the view when in enough amount
	var/min_fog_alpha = 15


/obj/effect/particle_effect/fluid/smoke/gray_masses/Initialize(mapload)
	. = ..()
	playsound(src, 'modular_zapoc/modules/gray_masses/sounds/spore_poof.ogg', 50)
	animate(src, pixel_x = rand(-96, 96), pixel_y = rand(-96, 96), alpha = rand(5, 21), transform = matrix()*rand(1, 3), transform = turn(matrix(), rand(0, 360)), time = rand(100, 200), loop = -1)
	animate(transform = null, pixel_x = 0, pixel_y = 0, alpha = rand(min_fog_alpha, (min(255, min_fog_alpha*4.2))), time = rand(100, 200))

/obj/effect/particle_effect/fluid/smoke/gray_masses/smoke_mob(mob/living/carbon/M)
	if(..())
		to_chat(M, span_userdanger("The spores fill your lungs!"))
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if(!istype(H.wear_suit, /obj/item/clothing/suit/hooded/heisenberg))
				H.apply_damage(seconds_per_tick * 10, BURN)
				M.apply_damage(seconds_per_tick * 15, OXY)
				M.apply_damage(seconds_per_tick * 15, STAMINA)
				to_chat(H, span_userdanger("The spores burn you!"))
		else if(iscarbon(M))
			M.apply_damage(seconds_per_tick * 10, BURN)
			M.apply_damage(seconds_per_tick * 15, OXY)
			M.apply_damage(seconds_per_tick * 15, STAMINA)
			to_chat(M, span_userdanger("The spores burn you!"))

			if(prob(50))
				M.emote("scream")
			else
				M.emote("whimper")

			return 1
*/

/obj/effect/particle_effect/fluid/smoke/gray_masses
	// Smaller sprite so you can use it in mapping without it sucking
	icon = 'modular_darkpack/modules/weather/icons/fog.dmi'
	icon_state = MAP_SWITCH("fog", "helper")
	alpha = 64
	plane = GAME_PLANE
	layer = SPACEVINE_LAYER
	anchored = TRUE
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	pixel_w = -112
	pixel_z = -112
	lifetime = 4 SECONDS
	animate_movement = FALSE
	var/alpha_lower = 5
	var/alpha_upper = 21

/obj/effect/particle_effect/fluid/smoke/gray_masses/Initialize(mapload)
	. = ..()
	playsound(src, 'modular_zapoc/modules/gray_masses/sounds/spore_poof.ogg', 50)
	animate(src, pixel_x = rand(-96, 96), pixel_y = rand(-96, 96), alpha = rand(alpha_lower, alpha_upper), transform = matrix()*rand(1, 3), transform = turn(matrix(), rand(0, 360)), time = rand(100, 200), loop = -1)
	animate(transform = null, pixel_x = 0, pixel_y = 0, alpha = rand(alpha_lower, alpha_upper), time = rand(100, 200))

/obj/effect/particle_effect/fluid/smoke/gray_masses/Destroy()
	if(prob(25))
		new /obj/effect/decal/cleanable/ash/gray_masses(get_turf(src))
	. = ..()

/obj/effect/particle_effect/fluid/smoke/gray_masses/smoke_mob(mob/living/carbon/smoker, seconds_per_tick)
	. = ..()
	if(!.)
		return .

	to_chat(smoker, span_userdanger("The spores fill your lungs!"))
	smoker.apply_damage(seconds_per_tick * 10, BURN)
	smoker.apply_damage(seconds_per_tick * 15, OXY)
	smoker.apply_damage(seconds_per_tick * 15, STAMINA)
	to_chat(smoker, span_userdanger("The spores burn you!"))
	if(prob(50))
		smoker.emote("cough")
	else
		if(prob(50))
			smoker.emote("scream")
		else
			smoker.emote("whimper")
