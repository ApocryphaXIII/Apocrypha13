/datum/splat/saiyan/get_power(power_type)
	RETURN_TYPE(/datum/action/cooldown/power/saiyan)

	for(var/datum/action/cooldown/power/saiyan/found_action as anything in powers)
		if(!istype(found_action, power_type))
			continue

		return found_action

/datum/splat/saiyan/add_power(power_type, level)
	// Prevent duplicates
	if(get_power(power_type))
		return FALSE
	var/datum/action/cooldown/power/saiyan/adding_action = new power_type()
	adding_action.Grant(owner)
	LAZYADD(powers, adding_action)
	return TRUE

/datum/splat/saiyan/remove_power(power_type)
	var/datum/action/cooldown/power/saiyan/found_action = get_power(power_type)
	if(!found_action)
		return FALSE

	LAZYREMOVE(powers, found_action)
	qdel(found_action)
	return TRUE

/datum/splat/saiyan/change_power_level(power_type, new_level)
	return
