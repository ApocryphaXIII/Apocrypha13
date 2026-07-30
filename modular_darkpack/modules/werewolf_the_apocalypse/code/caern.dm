// A bawn is the border around a caern.
/obj/effect/realistic_fog/bawn
	name = "dizzying fog"
	density = TRUE
	alpha_lower = 20
	alpha_upper = 80
	var/liked_trait
	var/liked_tribes

/obj/effect/realistic_fog/bawn/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()
	if(!isliving(mover))
		return .

	if(is_friend_of_caern(mover))
		return TRUE

	for(var/mob/living/friend in range(3, mover))
		if(is_friend_of_caern(friend))
			return TRUE

	return FALSE

/obj/effect/realistic_fog/bawn/proc/is_friend_of_caern(mob/living/potential_friend)
	if(liked_trait && HAS_TRAIT(potential_friend, liked_trait))
		return TRUE

	if(liked_tribes)
		var/datum/splat/werewolf/friends_splat = get_werewolf_splat(potential_friend)
		if(!friends_splat)
			return FALSE
		if(!(friends_splat.tribe.name in liked_tribes))
			return FALSE

	return TRUE

/obj/effect/realistic_fog/bawn/forest
	liked_trait = TRAIT_ALLOWED_FOREST_BAWN
	liked_tribes = TRIBE_LIST_GAIA
