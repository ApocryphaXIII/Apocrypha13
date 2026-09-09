/mob/living/carbon/human
	var/datum/voicepack/voicepack
	var/voice_pitch = VOICE_PITCH_DEFAULT

/mob/living/carbon/human/proc/get_voicepack_sound(key)
	var/datum/voicepack/voice_pack
	if(iscrinos(src) || islupus(src))
		voice_pack = new /datum/voicepack/werewolf()
	else
		voice_pack = voicepack
	if(!voice_pack)
		return null
	var/raw = voice_pack.get_sound(key, src)
	if(!raw && istype(voice_pack, /datum/voicepack/human))
		var/datum/voicepack/fallback = gender == FEMALE ? new /datum/voicepack/human/female() : new /datum/voicepack/human/male()
		raw = fallback.get_sound(key, src)
	if(!raw)
		return null
	var/sound/emote_sound = sound(islist(raw) ? pick(raw) : raw)
	var/pitched = clamp(voice_pitch + rand(-VOICE_PITCH_VARIATION, VOICE_PITCH_VARIATION), VOICE_PITCH_MIN, VOICE_PITCH_MAX)
	emote_sound.frequency = MIN_EMOTE_PITCH + (pitched - VOICE_PITCH_MIN) * (MAX_EMOTE_PITCH - MIN_EMOTE_PITCH) / (VOICE_PITCH_MAX - VOICE_PITCH_MIN)
	return emote_sound
