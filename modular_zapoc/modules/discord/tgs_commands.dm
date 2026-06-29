/datum/tgs_chat_command/tgscheck/Run(datum/tgs_chat_user/sender, params)
	var/server = CONFIG_GET(string/public_address) || CONFIG_GET(string/server)
	var/round_status = "delayed"

	switch(SSticker.current_state)
		if(GAME_STATE_STARTUP)
			round_status = "initializing"
		if(GAME_STATE_PREGAME)
			round_status = "pre-game"
		if(GAME_STATE_SETTING_UP)
			round_status = "starting"
		if(GAME_STATE_PLAYING)
			round_status = "active -- Join now! [server]"
		if(GAME_STATE_FINISHED)
			round_status = "restarting"

	return new /datum/tgs_message_content("[GLOB.round_id ? "Round #[GLOB.round_id] ([round_timestamp()]): " : "([round_timestamp()]): "]Players: [length(GLOB.clients.len)] (Active: [get_active_player_count(0,1,0)]), Map: [station_name()], Round [round_status] -- Join now! [server]") // APOC EDIT CHANGE - DISCORD

/datum/controller/subsystem/ticker/proc/HasRoundStarted()
	return current_state >= GAME_STATE_PLAYING

///Whether the game is currently in progress, excluding roundend
/datum/controller/subsystem/ticker/proc/IsRoundInProgress()
	return current_state == GAME_STATE_PLAYING

///Whether the game is currently in progress, excluding roundend
/datum/controller/subsystem/ticker/proc/IsPostgame()
	return current_state == GAME_STATE_FINISHED

/datum/tgs_chat_command/fangfuckies // Friend
	name = "fangfuckies"
	help_text = "Posts a random biting gif (0.1% chance for an ultra-rare bonus gif.)"

/datum/tgs_chat_command/fangfuckies/Run(datum/tgs_chat_user/sender, params)
	var/random_image = splittext(CONFIG_GET(string/bite_img_list), ", ") // comma + space delimiter
	if(prob(0.1))
		return new /datum/tgs_message_content("https://images2.imgbox.com/de/57/LouUHBzY_o.gif") // sneefer

	return new /datum/tgs_message_content("[pick(random_image)]")
