/datum/voicepack/human/female/haughty/get_sound(key)
	var/used
	switch(key)
		if("giggle")
			used = list(
				"[VO_SOUND_PATH]/female/haughty/giggle_1.ogg",
				"[VO_SOUND_PATH]/female/haughty/giggle_2.ogg",
			)
		if("sigh")
			used = list(
				"[VO_SOUND_PATH]/female/haughty/sigh_1.ogg",
				"[VO_SOUND_PATH]/female/haughty/sigh_2.ogg",
			)
		if("gasp")
			used = list("[VO_SOUND_PATH]/female/haughty/gasp_2.ogg")
		if("cackle")
			used = list("[VO_SOUND_PATH]/female/haughty/cackle_1.ogg")
		if("chuckle")
			used = list(
				"[VO_SOUND_PATH]/female/haughty/chuckle_1.ogg",
				"[VO_SOUND_PATH]/female/haughty/chuckle_2.ogg",
			)
		if("laugh")
			used = list(
				"[VO_SOUND_PATH]/female/haughty/laugh_2.ogg",
				"[VO_SOUND_PATH]/female/haughty/laugh_3.ogg",
				"[VO_SOUND_PATH]/female/haughty/laugh_4.ogg",
				"[VO_SOUND_PATH]/female/old/noble/laugh_1.ogg",
				"[VO_SOUND_PATH]/female/old/noble/laugh_2.ogg",
				"[VO_SOUND_PATH]/female/old/noble/laugh_3.ogg",
			)
		if("painscream", "scream")
			used = list(
				"[VO_SOUND_PATH]/female/haughty/painscream_1.ogg",
				"[VO_SOUND_PATH]/female/haughty/painscream_2.ogg",
			)
		if("painmoan")
			used = list(
				"[VO_SOUND_PATH]/female/haughty/painmoan_1.ogg",
				"[VO_SOUND_PATH]/female/haughty/painmoan_2.ogg",
				"[VO_SOUND_PATH]/female/haughty/painmoan_3.ogg",
				"[VO_SOUND_PATH]/female/haughty/painmoan_4.ogg",
			)
		if("paincrit")
			used = list(
				"[VO_SOUND_PATH]/female/haughty/paincrit_1.ogg",
				"[VO_SOUND_PATH]/female/haughty/paincrit_2.ogg",
				"[VO_SOUND_PATH]/female/haughty/paincrit_3.ogg",
			)
	if(!used)
		used = ..()
	return used
