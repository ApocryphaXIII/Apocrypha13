/datum/keybinding/human/block
	hotkey_keys = list("C")
	name = "enable_blocking"
	full_name = " Enable or disable blocking mod"
	description = "Toggles blocking mode for combat"
	keybind_signal = COMSIG_KB_HUMAN_BLOCK

/datum/keybinding/human/block/down(client/user)
	. = ..()
	if(.)
		return
	var/mob/living/carbon/human/H = user.mob
	H.SwitchBlocking()
	return TRUE
