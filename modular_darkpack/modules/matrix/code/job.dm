/datum/controller/subsystem/job/proc/FreeRole(mob/living/carbon/despawning_mob)
	if(!despawning_mob.mind)
		return
	var/datum/job/job_datum = despawning_mob.mind.assigned_role
	if(!job_datum)
		return
	job_debug("Freeing role: [job_datum.title]")
	job_datum.current_positions = max(0, job_datum.current_positions - 1)

// APOC EDIT CHANGE START
	//Getting it from prefs is untrustworthy as they could have unlocked there sheet. (even before the move to splats) //
	//But getting it from spalts is impercise as those can change.
	//What to do with you.
	var/splat_pref = despawning_mob.client.prefs.read_preference(/datum/preference/choiced/splats)
	var/datum/splat/vampire/kindred/clan_pref = get_kindred_splat(despawning_mob)
	var/datum/splat/werewolf/tribe_pref = get_werewolf_splat(despawning_mob)
	var/player_splat_id
	var/player_clan_id
	var/player_tribe_id

	if(ispath(splat_pref))
		var/datum/splat/player_splat = GLOB.splat_prototypes[splat_pref]
		player_splat_id = player_splat.id
	else
		player_splat_id = splat_pref

	if(clan_pref) // APOC EDIT ADD START
		player_clan_id = clan_pref.clan.id
	else if(tribe_pref)
		player_tribe_id = tribe_pref.name

	if(job_datum.splat_slots)
		if(job_datum.splat_slots[player_splat_id] >= 0)
			job_datum.splat_slots[player_splat_id] = job_datum.splat_slots[player_splat_id] + 1
	if(job_datum.clan_slots)
		if(job_datum.clan_slots[player_clan_id] >= 0)
			job_datum.clan_slots[player_clan_id] = job_datum.clan_slots[player_clan_id] + 1
	if(job_datum.tribe_slots)
		if(job_datum.tribe_slots[player_tribe_id] >= 0)
			job_datum.tribe_slots[player_tribe_id] = job_datum.tribe_slots[player_tribe_id] + 1
// APOC EDIT CHANGE END
