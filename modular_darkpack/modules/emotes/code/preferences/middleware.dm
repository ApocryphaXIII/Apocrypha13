/datum/preference_middleware/emote_voicepack
	COOLDOWN_DECLARE(preview_cooldown)
	action_delegations = list(
		"preview_voicepack" = PROC_REF(preview_voicepack),
	)

/datum/preference_middleware/emote_voicepack/proc/preview_voicepack(list/params, mob/user)
	if(!COOLDOWN_FINISHED(src, preview_cooldown))
		return TRUE
	COOLDOWN_START(src, preview_cooldown, 1 SECONDS)
	var/pack_name = preferences.read_preference(/datum/preference/choiced/emote_voicepack)
	var/vp_type = GLOB.voicepack_list[pack_name]
	if(!vp_type)
		return TRUE
	var/datum/voicepack/vp = new vp_type()
	var/raw
	for(var/key in shuffle(list("laugh", "pain", "aggro", "groan", "scream", "hmm", "huh", "painscream")))
		raw = vp.get_sound(key)
		if(raw)
			break
	if(!raw)
		return TRUE
	var/pitch = preferences.read_preference(/datum/preference/numeric/emote_voice_pitch)
	var/picked = islist(raw) ? pick(raw) : raw
	var/sound/S = sound(picked)
	var/t = clamp(pitch + rand(-VOICE_PITCH_VARIATION, VOICE_PITCH_VARIATION), VOICE_PITCH_MIN, VOICE_PITCH_MAX)
	S.frequency = MIN_EMOTE_PITCH + (t - VOICE_PITCH_MIN) * (MAX_EMOTE_PITCH - MIN_EMOTE_PITCH) / (VOICE_PITCH_MAX - VOICE_PITCH_MIN)
	SEND_SOUND(user, S)
	return TRUE
