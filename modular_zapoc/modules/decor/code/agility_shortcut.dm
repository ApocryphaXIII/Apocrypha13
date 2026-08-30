GLOBAL_LIST_EMPTY(unallocated_agility_shortcuts)

/obj/agility_shortcut
	name = "agility shortcut"
	desc = "200 million agility experience required. Tell a coder!"
	icon = 'modular_zapoc/modules/decor/icons/agility_shortcut.dmi'
	icon_state = "shortcut"
	anchored = TRUE
	pixel_y = 32
	var/obj/agility_shortcut/exit
	var/id
	// If false, scales with athletics
	var/scale_with_distance = FALSE
	// Default do_after timer. A value of 60 takes a 5 athletics character 1 second to enter.
	var/base_timer = 8 SECONDS
	// If not 0, must have at least this much athletics to pass.
	var/minimum_athletics = 0
	// Lists for determining who is allowed to use the shortcut
	/// Type path of allowed splat
	var/allowed_splat
	/// List of names for allowed kindred clans
	var/list/allowed_clans
	/// List of names for allowed fera tribes
	var/list/allowed_tribes
	/// List of typepaths for allowed jobs
	var/list/datum/job/allowed_jobs

/obj/agility_shortcut/Initialize(mapload) // Evil copypaste of transferpoint code
	. = ..()
	if(!exit)
		if(isnum(id))
			warning("[src] has a ID of [id]. Numbers are bad practice")
		GLOB.unallocated_agility_shortcuts += src
		for(var/obj/agility_shortcut/T in GLOB.unallocated_agility_shortcuts)
			if(T.id == id && T != src)
				exit = T
				GLOB.unallocated_agility_shortcuts -= T
				T.exit = src
				GLOB.unallocated_agility_shortcuts -= src
				break

/obj/agility_shortcut/Destroy(force)
	. = ..()
	GLOB.unallocated_agility_shortcuts -= src

/obj/agility_shortcut/attack_hand(mob/user)
	if(isliving(user))
		try_travel(user)
	else
		user.forceMove(get_turf(exit))

/obj/agility_shortcut/proc/try_travel(mob/living/user)
	var/time
	if(scale_with_distance)
		var/distance_mod = round(get_dist(src, exit) * 2, 10)
		time = base_timer + distance_mod
		var/user_power = user.st_get_stat(STAT_ATHLETICS)
		time = base_timer - (user_power*10)

	if(validate_allowance(user))
		if(do_after(user, max(base_timer, time), src))
			user.forceMove(get_turf(exit))
		else
			to_chat(user, span_warning("You stop trying to crawl through the tunnel."))
	else
		to_chat(user, span_warning("No way I'm crawling in there."))

/obj/agility_shortcut/proc/validate_allowance(mob/living/user)
	if(minimum_athletics && (minimum_athletics > user.st_get_stat(STAT_ATHLETICS)))
		return FALSE

	if(allowed_splat && !user.get_splat(allowed_splat))
		return FALSE

	if(allowed_clans)
		var/datum/splat/vampire/kindred/kindred_splat = get_kindred_splat(user)
		if(!(kindred_splat?.clan?.name in allowed_clans))
			return FALSE

	if(allowed_tribes)
		var/datum/splat/werewolf/shifter/shifter_splat = get_shifter_splat(user)
		if(!(shifter_splat?.tribe?.name in allowed_tribes))
			return FALSE

	if(allowed_jobs && !(is_type_in_list(user.job, allowed_jobs)))
		return FALSE

	return TRUE

////* And now, for the subtypes. *////

/obj/agility_shortcut/cave
	icon_state = "shortcut"

/obj/agility_shortcut/cave/gaia
	name = "tunnel"
	desc = "A small hole in the cavern wall. You're not thinking about going in there, right?"
	allowed_tribes = TRIBE_LIST_GAIA

/obj/agility_shortcut/urban
	icon_state = "shortcut_urban"

/obj/agility_shortcut/urban/spiral
	name = "hole"
	desc = "There are a bunch of bricks missing. Not enough for you to crawl in. Unless you were insane."
	allowed_tribes = TRIBE_BLACK_SPIRAL_DANCERS

/obj/agility_shortcut/anyone
	desc = "You could probably fit in there. Want to find out?"
