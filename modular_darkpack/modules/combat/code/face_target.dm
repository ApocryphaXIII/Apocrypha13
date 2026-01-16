/atom/MouseEntered(location,control,params)
	if(isturf(src) || ismob(src) || isobj(src))
		if(loc && iscarbon(usr))
			var/mob/living/carbon/H = usr
			if(H.a_intent == INTENT_HARM)
				if(!H.IsSleeping() && !H.IsUnconscious() && !H.IsParalyzed() && !H.IsKnockdown() && !H.IsStun() && !HAS_TRAIT(H, TRAIT_RESTRAINED))
					H.face_atom(src)
					H.harm_focus = H.dir

