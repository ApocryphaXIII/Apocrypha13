/datum/subsplat/werewolf/breed_form/ananasi
	abstract_type = /datum/subsplat/werewolf/breed_form/ananasi
	fera_restriction = SPLAT_ANANASI

/datum/subsplat/werewolf/breed_form/ananasi/homid
	name = BREED_ANANASI_HOMID
	start_gnosis = 4
	breed_species = /datum/species/human/shifter/homid
	gifts_provided = list(
		/datum/action/cooldown/power/gift/sense_wyrm,
		/datum/action/cooldown/power/gift/spirit_speech,
		/datum/action/cooldown/power/gift/resist_pain,
		/datum/action/cooldown/power/gift/stolen_moments
	)

/datum/subsplat/werewolf/breed_form/ananasi/arachnid
	name = BREED_ARACHNID
	start_gnosis = 4
	breed_species = /datum/species/human/shifter/feral
	gifts_provided = list(
		/datum/action/cooldown/power/gift/sense_wyrm,
		/datum/action/cooldown/power/gift/spirit_speech,
		/datum/action/cooldown/power/gift/resist_pain,
		/datum/action/cooldown/power/gift/stolen_moments
	)

/datum/subsplat/werewolf/breed_form/ananasi/arachnid/generation_pref_icon(datum/universal_icon/main_icon)
	var/datum/universal_icon/breed_crinos = uni_icon('modular_darkpack/modules/werewolf_the_apocalypse/icons/corax_forms/corvid.dmi', "black")
	breed_crinos.scale(32, 32)
	main_icon.blend_icon(breed_crinos, ICON_OVERLAY)
