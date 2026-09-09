/datum/preference_middleware/stats/proc/get_stat_validation_error()
	var/list/stats = preferences.preference_storyteller_stats
	if(!stats || !length(stats))
		return null

	var/list/score_violations = list()
	for(var/stat_typepath in stats)
		var/datum/st_stat/stat = stats[stat_typepath]
		var/score = stat.get_score(include_bonus = FALSE)
		if(score < stat.min_score || score > stat.max_score)
			score_violations += "[stat.name]: [score] (allowed [stat.min_score] to [stat.max_score])"

	var/list/levels_by_abstract = list()
	for(var/stat_typepath in stats)
		var/datum/st_stat/stat = stats[stat_typepath]
		if(!stat.editable || stat.type == stat.abstract_type)
			continue
		var/levels_above = max(0, stat.get_score(include_bonus = FALSE) - stat.starting_score)
		if(!levels_above)
			continue
		if(!(stat.abstract_type in levels_by_abstract))
			levels_by_abstract[stat.abstract_type] = 0
		levels_by_abstract[stat.abstract_type] += levels_above

	var/list/budget_violations = list()
	var/total_freebie_needed = 0
	for(var/abstract_typepath in levels_by_abstract)
		var/datum/st_stat/abstract_stat = stats[abstract_typepath]
		if(!abstract_stat)
			continue
		var/pool_size = abstract_stat.get_initial_points()
		var/freebie_cost = initial(abstract_stat.freebie_point_cost)
		var/levels_above = levels_by_abstract[abstract_typepath]
		var/overflow = max(0, levels_above - pool_size)
		if(!overflow || !freebie_cost || !abstract_stat.name)
			continue
		budget_violations += "[abstract_stat.name]: [levels_above] spent, budget is [pool_size] ([overflow] over)"
		total_freebie_needed += overflow * freebie_cost

	var/datum/st_stat/freebie/freebie_stat = stats[STAT_FREEBIE_POINTS]
	var/base_freebie = freebie_stat ? freebie_stat.get_initial_points() : /datum/st_stat/freebie::points
	var/quirk_balance = 0
	for(var/quirk_name in preferences.all_quirks)
		var/datum/quirk/quirk_type = SSquirks.quirks[quirk_name]
		if(quirk_type)
			quirk_balance -= quirk_type.value
	var/available_freebie = max(0, base_freebie + quirk_balance)
	var/freebie_short = total_freebie_needed - available_freebie

	if(!length(score_violations) && freebie_short <= 0)
		return null

	var/msg = "STAT VALIDATION"
	if(length(score_violations))
		msg += "\nStat scores out of range:\n"
		for(var/v in score_violations)
			msg += "  [v]\n"
	if(length(budget_violations))
		msg += "\nCategories over budget:\n"
		for(var/v in budget_violations)
			msg += "  [v]\n"
	if(freebie_short > 0)
		msg += "\nFreebie points: need [total_freebie_needed], have [available_freebie] ([freebie_short] short of what is needed to be valid)\n"
	return msg

/datum/preference_middleware/proc/on_character_spawn(mob/living/spawning_mob)

/datum/preference_middleware/stats/on_character_spawn(mob/living/spawning_mob)
	validate_stats(spawning_mob)

/datum/preference_middleware/stats/proc/validate_stats(mob/checked_mob)
	var/stat_error = get_stat_validation_error()
	if(!stat_error)
		return
	// to_chat(checked_mob, span_warning(stat_error))
	var/char_name = preferences?.read_preference(/datum/preference/name/real_name)
	var/log_msg = "[key_name(checked_mob)]'s character '[char_name]' (slot [preferences?.default_slot]) has invalid stats:\n[stat_error]"
	// SSoverwatch.record_action(null, log_msg)
	message_admins(log_msg)


ADMIN_VERB(validate_sheets, R_ADMIN, "Validate Sheets", "Validate Sheets.", ADMIN_CATEGORY_MAIN)
	var/choice = tgui_alert(user, "Validate unloaded characters as well?", "Validate Sheets", list("Yes", "No"))
	// var/list/connected = list()
	// var/list/invalid_ckeys = list()
	for(var/ckey in GLOB.directory)
		var/client/C = GLOB.directory[ckey]
		if(!C || !C.mob || !C.prefs)
			continue
		// connected += ckey
		/*
		if(ishuman(C.mob))
			var/list/validation = validate_mob_sheet(C.mob)
			if(validation && !validation["valid"])
				invalid_ckeys += ckey
		*/
		if(choice == "Yes")
			var/original_slot = C.prefs.default_slot
			var/list/profiles = C.prefs.create_character_profiles() // Helps filter for unfilled out slots
			for(var/i in 1 to C.prefs.max_save_slots)
				if(profiles[i])
					var/slot = clamp(i, 1, C.prefs.max_save_slots)
					C.prefs.switch_to_slot(slot)
					for(var/datum/preference_middleware/stats/stat in C.prefs.middleware)
						stat.validate_stats(C.mob)
			C.prefs.switch_to_slot(original_slot)
		else
			for(var/datum/preference_middleware/stats/stat in C.prefs.middleware)
				stat.validate_stats(C.mob)
