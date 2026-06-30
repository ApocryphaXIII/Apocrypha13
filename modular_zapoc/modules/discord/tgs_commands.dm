/datum/tgs_chat_command/tgscheck/Run(datum/tgs_chat_user/sender, params)
	var/server = CONFIG_GET(string/public_address) || CONFIG_GET(string/server)
	var/round_status
	var/timeleft = SSticker.GetTimeLeft()

	switch(SSticker.current_state)
		if(GAME_STATE_STARTUP)
			round_status = "Round Initializing"
		if(GAME_STATE_PREGAME)
			round_status = "Pre-Game"
		if(GAME_STATE_SETTING_UP)
			round_status = "Round Starting"
		if(GAME_STATE_PLAYING)
			round_status = "Active -- Join now!"
		if(GAME_STATE_FINISHED)
			round_status = "Round Restarting"

	if(timeleft == -10)
		round_status = "Round Delayed -- Thanks for playing!"

	return new /datum/tgs_message_content("[GLOB.round_id ? "Round #[GLOB.round_id] ([round_timestamp()]): " : "([round_timestamp()]): "]Players: [length(GLOB.clients.len)] (Active: [get_active_player_count(0,1,0)]), Map: [station_name()], [round_status] -- [server]")

/datum/tgs_chat_command/fangfuckies // Friend
	name = "fangfuckies"
	help_text = "Posts a random biting gif (0.1% chance for an ultra-rare bonus gif.)"

/datum/tgs_chat_command/fangfuckies/Run(datum/tgs_chat_user/sender, params)
	var/random_image = splittext(CONFIG_GET(string/bite_img_list), ", ") // comma + space delimiter
	if(prob(0.1))
		return new /datum/tgs_message_content("https://images2.imgbox.com/de/57/LouUHBzY_o.gif") // sneefer

	return new /datum/tgs_message_content("[pick(random_image)]")
