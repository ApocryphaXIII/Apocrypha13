/datum/preference/toggle/avoid_admin_kick
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "avoid_admin_kick"
	savefile_identifier = PREFERENCE_PLAYER
	default_value = FALSE

/datum/preference/toggle/avoid_admin_kick/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return is_admin(preferences.parent)
