// APOC EDIT START - obviously // fangfuckies :3
/datum/tgs_chat_command/fangfuckies // Friend
	name = "fangfuckies"
	help_text = "Posts a random biting gif (0.1% chance for an ultra-rare bonus gif.)"

/datum/tgs_chat_command/fangfuckies/Run(datum/tgs_chat_user/sender, params)
	var/random_image = splittext(CONFIG_GET(string/bite_img_list), ", ") // comma + space delimiter
	if(prob(0.1))
		return new /datum/tgs_message_content("https://images2.imgbox.com/de/57/LouUHBzY_o.gif") // sneefer

	return new /datum/tgs_message_content("[pick(random_image)]")
