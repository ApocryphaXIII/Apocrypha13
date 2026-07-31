/datum/voicepack/werewolf

/datum/voicepack/werewolf/get_sound(key, mob/living/carbon/human/user)
	if(user && get_corax_splat(user))
		if(iscrinos(user))
			if(key == "jump" || key == "leap")
				return list("[VO_SOUND_PATH]/mobs/wwolf/jump_1.ogg","[VO_SOUND_PATH]/mobs/wwolf/jump_2.ogg","[VO_SOUND_PATH]/mobs/wwolf/jump_3.ogg")
			return 'modular_darkpack/modules/werewolf_the_apocalypse/sounds/emotes/cawcrinos.ogg'
		if(islupus(user))
			if(key == "jump" || key == "leap")
				return 'modular_darkpack/modules/external_organs/sounds/wing_flap_flying.ogg'
			return list(
				'modular_darkpack/modules/werewolf_the_apocalypse/sounds/emotes/caw.ogg',
				'modular_darkpack/modules/emotes/sound/caw.ogg',
				'modular_darkpack/modules/emotes/sound/caw2.ogg',
			)

	var/used
	switch(key)
		if("aggro", "rage")
			used = "[VO_SOUND_PATH]/mobs/wwolf/roar.ogg"
		if("deathgurgle")
			used = "[VO_SOUND_PATH]/mobs/wwolf/death.ogg"
		if("firescream", "agony")
			used = "[VO_SOUND_PATH]/mobs/wwolf/painscream.ogg"
		if("jump", "leap")
			used = list("[VO_SOUND_PATH]/mobs/wwolf/jump_1.ogg","[VO_SOUND_PATH]/mobs/wwolf/jump_2.ogg","[VO_SOUND_PATH]/mobs/wwolf/jump_3.ogg")
		if("pain", "paincrit")
			used = list("[VO_SOUND_PATH]/mobs/wwolf/pain_1.ogg","[VO_SOUND_PATH]/mobs/wwolf/pain_2.ogg","[VO_SOUND_PATH]/mobs/wwolf/pain_3.ogg")
		if("painscream")
			used = "[VO_SOUND_PATH]/mobs/wwolf/painscream.ogg"
		if("scream", "howl")
			used = list("[VO_SOUND_PATH]/mobs/wwolf/howl_1.ogg","[VO_SOUND_PATH]/mobs/wwolf/howl_2.ogg")
	return used
