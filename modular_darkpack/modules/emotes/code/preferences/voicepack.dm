/datum/preference/choiced/emote_voicepack
	category = PREFERENCE_CATEGORY_VOCALS
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "emote_voicepack"

/datum/preference/choiced/emote_voicepack/init_possible_values()
	return assoc_to_keys(GLOB.voicepack_list)

/datum/preference/choiced/emote_voicepack/create_default_value()
	return "None"

/datum/preference/choiced/emote_voicepack/apply_to_human(mob/living/carbon/human/target, value)
	var/voicepack_type = GLOB.voicepack_list[value]
	if(voicepack_type)
		target.voicepack = new voicepack_type()

/datum/preference/numeric/emote_voice_pitch
	category = PREFERENCE_CATEGORY_VOCALS
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "emote_voice_pitch"
	minimum = VOICE_PITCH_MIN
	maximum = VOICE_PITCH_MAX

/datum/preference/numeric/emote_voice_pitch/create_default_value()
	return VOICE_PITCH_DEFAULT

/datum/preference/numeric/emote_voice_pitch/apply_to_human(mob/living/carbon/human/target, value)
	target.voice_pitch = value
