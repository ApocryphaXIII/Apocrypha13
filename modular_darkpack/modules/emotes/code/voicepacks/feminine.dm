/datum/voicepack/human/female/get_sound(key)
	var/used
	switch(key)
		if("attack")
			used = list("[VO_SOUND_PATH]/female/gen/attack_1.ogg","[VO_SOUND_PATH]/female/gen/attack_2.ogg","[VO_SOUND_PATH]/female/gen/attack_3.ogg","[VO_SOUND_PATH]/female/gen/attack_4.ogg","[VO_SOUND_PATH]/female/gen/attack_5.ogg")
		if("agony")
			used = list("[VO_SOUND_PATH]/female/gen/agony_1.ogg","[VO_SOUND_PATH]/female/gen/agony_2.ogg","[VO_SOUND_PATH]/female/gen/agony_3.ogg")
		if("breathgasp")
			used = "[VO_SOUND_PATH]/female/gen/breathgasp.ogg"
		if("burp")
			used = "[VO_SOUND_PATH]/female/gen/burp.ogg"
		if("chuckle")
			used = list("[VO_SOUND_PATH]/female/gen/chuckle_1.ogg","[VO_SOUND_PATH]/female/gen/chuckle_2.ogg")
		if("clearthroat")
			used = "[VO_SOUND_PATH]/female/gen/clearthroat.ogg"
		if("cough")
			used = list("[VO_SOUND_PATH]/female/gen/cough_1.ogg","[VO_SOUND_PATH]/female/gen/cough_2.ogg")
		if("cry", "sob")
			used = list("[VO_SOUND_PATH]/female/gen/cry_1.ogg","[VO_SOUND_PATH]/female/gen/cry_2.ogg","[VO_SOUND_PATH]/female/gen/cry_3.ogg")
		if("deathgurgle")
			used = list("[VO_SOUND_PATH]/female/gen/deathgurgle_1.ogg","[VO_SOUND_PATH]/female/gen/deathgurgle_2.ogg")
		if("drown")
			used = list("[VO_SOUND_PATH]/female/gen/drown_1.ogg","[VO_SOUND_PATH]/female/gen/drown_2.ogg")
		if("embed")
			used = list("[VO_SOUND_PATH]/female/gen/embed_1.ogg","[VO_SOUND_PATH]/female/gen/embed_2.ogg")
		if("fatigue")
			used = list("[VO_SOUND_PATH]/female/gen/fatigue_1.ogg","[VO_SOUND_PATH]/female/gen/fatigue_2.ogg","[VO_SOUND_PATH]/female/gen/fatigue_3.ogg")
		if("firescream")
			used = list("[VO_SOUND_PATH]/female/gen/firescream_1.ogg","[VO_SOUND_PATH]/female/gen/firescream_2.ogg")
		if("gag")
			used = list("[VO_SOUND_PATH]/female/gen/gag_1.ogg","[VO_SOUND_PATH]/female/gen/gag_2.ogg")
		if("gasp")
			used = list("[VO_SOUND_PATH]/female/gen/gasp_1.ogg","[VO_SOUND_PATH]/female/gen/gasp_2.ogg")
		if("giggle")
			used = list("[VO_SOUND_PATH]/female/gen/giggle_1.ogg","[VO_SOUND_PATH]/female/gen/giggle_2.ogg")
		if("groan")
			used = list("[VO_SOUND_PATH]/female/gen/groan_1.ogg","[VO_SOUND_PATH]/female/gen/groan_2.ogg","[VO_SOUND_PATH]/female/gen/groan_3.ogg")
		if("haltyell")
			used = list("[VO_SOUND_PATH]/female/gen/haltyell_1.ogg","[VO_SOUND_PATH]/female/gen/haltyell_2.ogg")
		if("hmm")
			used = "[VO_SOUND_PATH]/female/gen/hmm.ogg"
		if("hmph")
			used = "[VO_SOUND_PATH]/female/gen/hmph_1.ogg"
		if("huh")
			used = list("[VO_SOUND_PATH]/female/gen/huh_1.ogg","[VO_SOUND_PATH]/female/gen/huh_2.ogg")
		if("hum")
			used = list("[VO_SOUND_PATH]/female/gen/hum_1.ogg","[VO_SOUND_PATH]/female/gen/hum_2.ogg","[VO_SOUND_PATH]/female/gen/hum_3.ogg")
		if("jump")
			used = "[VO_SOUND_PATH]/female/gen/jump.ogg"
		if("laugh")
			used = list("[VO_SOUND_PATH]/female/gen/laugh_1.ogg","[VO_SOUND_PATH]/female/gen/laugh_2.ogg","[VO_SOUND_PATH]/female/gen/laugh_3.ogg")
		if("pain")
			used = list("[VO_SOUND_PATH]/female/gen/pain_1.ogg","[VO_SOUND_PATH]/female/gen/pain_2.ogg","[VO_SOUND_PATH]/female/gen/pain_3.ogg")
		if("paincrit")
			used = list("[VO_SOUND_PATH]/female/gen/paincrit_1.ogg","[VO_SOUND_PATH]/female/gen/paincrit_2.ogg")
		if("painmoan")
			used = list("[VO_SOUND_PATH]/female/gen/painmoan_1.ogg","[VO_SOUND_PATH]/female/gen/painmoan_2.ogg","[VO_SOUND_PATH]/female/gen/painmoan_3.ogg","[VO_SOUND_PATH]/female/gen/painmoan_4.ogg")
		if("painscream", "scream")
			used = list("[VO_SOUND_PATH]/female/gen/painscream_1.ogg","[VO_SOUND_PATH]/female/gen/painscream_2.ogg","[VO_SOUND_PATH]/female/gen/painscream_3.ogg")
		if("rage")
			used = list("[VO_SOUND_PATH]/female/gen/rage_1.ogg","[VO_SOUND_PATH]/female/gen/rage_2.ogg","[VO_SOUND_PATH]/female/gen/rage_3.ogg")
	return used


/datum/voicepack/human/female/warrior

/datum/voicepack/human/female/warrior/get_sound(key)
	var/used
	switch(key)
		if("attack")
			used = list("[VO_SOUND_PATH]/female/warrior/attack_1.ogg","[VO_SOUND_PATH]/female/warrior/attack_2.ogg","[VO_SOUND_PATH]/female/warrior/attack_3.ogg","[VO_SOUND_PATH]/female/warrior/attack_4.ogg","[VO_SOUND_PATH]/female/warrior/attack_5.ogg","[VO_SOUND_PATH]/female/warrior/attack_6.ogg")
		if("cackle")
			used = "[VO_SOUND_PATH]/female/warrior/cackle_1.ogg"
		if("chuckle")
			used = list("[VO_SOUND_PATH]/female/warrior/chuckle_1.ogg","[VO_SOUND_PATH]/female/warrior/chuckle_2.ogg")
		if("fatigue")
			used = "[VO_SOUND_PATH]/female/warrior/fatigue_1.ogg"
		if("gasp")
			used = list("[VO_SOUND_PATH]/female/warrior/gasp_2.ogg")
		if("giggle")
			used = list("[VO_SOUND_PATH]/female/warrior/giggle_1.ogg","[VO_SOUND_PATH]/female/warrior/giggle_2.ogg")
		if("groan")
			used = list("[VO_SOUND_PATH]/female/warrior/groan_1.ogg","[VO_SOUND_PATH]/female/warrior/groan_2.ogg","[VO_SOUND_PATH]/female/warrior/groan_3.ogg","[VO_SOUND_PATH]/female/warrior/groan_4.ogg","[VO_SOUND_PATH]/female/warrior/groan_6.ogg")
		if("hmm")
			used = list("[VO_SOUND_PATH]/female/warrior/hmm_1.ogg","[VO_SOUND_PATH]/female/warrior/hmm_2.ogg")
		if("huh")
			used = "[VO_SOUND_PATH]/female/warrior/huh_1.ogg"
		if("hum")
			used = list("[VO_SOUND_PATH]/female/warrior/hum_1.ogg","[VO_SOUND_PATH]/female/warrior/hum_2.ogg","[VO_SOUND_PATH]/female/warrior/hum_3.ogg","[VO_SOUND_PATH]/female/warrior/hum_4.ogg","[VO_SOUND_PATH]/female/warrior/hum_5.ogg","[VO_SOUND_PATH]/female/warrior/hum_6.ogg")
		if("jump")
			used = list("[VO_SOUND_PATH]/female/warrior/jump_1.ogg","[VO_SOUND_PATH]/female/warrior/jump_2.ogg","[VO_SOUND_PATH]/female/warrior/jump_3.ogg")
		if("laugh")
			used = list("[VO_SOUND_PATH]/female/warrior/laugh_1.ogg","[VO_SOUND_PATH]/female/warrior/laugh_2.ogg","[VO_SOUND_PATH]/female/warrior/laugh_3.ogg","[VO_SOUND_PATH]/female/warrior/laugh_4.ogg","[VO_SOUND_PATH]/female/warrior/laugh_5.ogg","[VO_SOUND_PATH]/female/warrior/laugh_6.ogg","[VO_SOUND_PATH]/female/warrior/laugh_7.ogg","[VO_SOUND_PATH]/female/warrior/laugh_8.ogg")
		if("leap")
			used = list("[VO_SOUND_PATH]/female/warrior/leap_1.ogg","[VO_SOUND_PATH]/female/warrior/leap_2.ogg","[VO_SOUND_PATH]/female/warrior/leap_3.ogg")
		if("pain")
			used = list("[VO_SOUND_PATH]/female/warrior/pain_1.ogg","[VO_SOUND_PATH]/female/warrior/pain_2.ogg","[VO_SOUND_PATH]/female/warrior/pain_3.ogg","[VO_SOUND_PATH]/female/warrior/pain_4.ogg","[VO_SOUND_PATH]/female/warrior/pain_5.ogg","[VO_SOUND_PATH]/female/warrior/pain_6.ogg","[VO_SOUND_PATH]/female/warrior/pain_7.ogg","[VO_SOUND_PATH]/female/warrior/pain_8.ogg")
		if("paincrit")
			used = list("[VO_SOUND_PATH]/female/warrior/paincrit_1.ogg","[VO_SOUND_PATH]/female/warrior/paincrit_2.ogg","[VO_SOUND_PATH]/female/warrior/paincrit_3.ogg")
		if("painmoan")
			used = list("[VO_SOUND_PATH]/female/warrior/painmoan_1.ogg","[VO_SOUND_PATH]/female/warrior/painmoan_2.ogg","[VO_SOUND_PATH]/female/warrior/painmoan_3.ogg","[VO_SOUND_PATH]/female/warrior/painmoan_4.ogg","[VO_SOUND_PATH]/female/warrior/painmoan_5.ogg")
		if("painscream", "scream")
			used = list("[VO_SOUND_PATH]/female/warrior/painscream_1.ogg","[VO_SOUND_PATH]/female/warrior/painscream_2.ogg","[VO_SOUND_PATH]/female/warrior/painscream_3.ogg","[VO_SOUND_PATH]/female/warrior/painscream_4.ogg","[VO_SOUND_PATH]/female/warrior/painscream_5.ogg")
		if("pleased")
			used = list("[VO_SOUND_PATH]/female/warrior/pleased_1.ogg","[VO_SOUND_PATH]/female/warrior/pleased_2.ogg","[VO_SOUND_PATH]/female/warrior/pleased_3.ogg")
		if("rage")
			used = list("[VO_SOUND_PATH]/female/warrior/rage_1.ogg","[VO_SOUND_PATH]/female/warrior/rage_2.ogg","[VO_SOUND_PATH]/female/warrior/rage_3.ogg")
		if("sigh")
			used = list("[VO_SOUND_PATH]/female/warrior/sigh_1.ogg","[VO_SOUND_PATH]/female/warrior/sigh_2.ogg")
		if("warcry")
			used = list("[VO_SOUND_PATH]/female/warrior/warcry_1.ogg","[VO_SOUND_PATH]/female/warrior/warcry_2.ogg")
	if(!used)
		used = ..()
	return used


/datum/voicepack/human/female/dainty

/datum/voicepack/human/female/dainty/get_sound(key)
	var/used
	switch(key)
		if("chuckle")
			used = list("[VO_SOUND_PATH]/female/dainty/chuckle_1.ogg","[VO_SOUND_PATH]/female/dainty/chuckle_2.ogg","[VO_SOUND_PATH]/female/dainty/chuckle_3.ogg")
		if("clearthroat")
			used = list("[VO_SOUND_PATH]/female/dainty/clearthroat_1.ogg","[VO_SOUND_PATH]/female/dainty/clearthroat_2.ogg")
		if("cough")
			used = "[VO_SOUND_PATH]/female/dainty/cough_1.ogg"
		if("cry", "sob")
			used = "[VO_SOUND_PATH]/female/dainty/cry_1.ogg"
		if("gasp")
			used = list("[VO_SOUND_PATH]/female/dainty/gasp_1.ogg","[VO_SOUND_PATH]/female/dainty/gasp_2.ogg","[VO_SOUND_PATH]/female/dainty/gasp_3.ogg","[VO_SOUND_PATH]/female/haughty/gasp_1.ogg")
		if("giggle")
			used = list("[VO_SOUND_PATH]/female/dainty/giggle_1.ogg","[VO_SOUND_PATH]/female/dainty/giggle_2.ogg")
		if("hmm")
			used = list("[VO_SOUND_PATH]/female/dainty/hmm_1.ogg","[VO_SOUND_PATH]/female/dainty/hmm_2.ogg","[VO_SOUND_PATH]/female/dainty/hmm_3.ogg","[VO_SOUND_PATH]/female/dainty/hmm_4.ogg","[VO_SOUND_PATH]/female/dainty/hmm_5.ogg")
		if("hmph")
			used = list("[VO_SOUND_PATH]/female/gen/hmph_1.ogg","[VO_SOUND_PATH]/female/haughty/hmph_1.ogg")
		if("huh")
			used = list("[VO_SOUND_PATH]/female/dainty/huh_1.ogg","[VO_SOUND_PATH]/female/dainty/huh_2.ogg","[VO_SOUND_PATH]/female/dainty/huh_3.ogg")
		if("laugh")
			used = list("[VO_SOUND_PATH]/female/dainty/laugh_1.ogg","[VO_SOUND_PATH]/female/dainty/laugh_2.ogg","[VO_SOUND_PATH]/female/dainty/laugh_3.ogg")
		if("pain")
			used = list("[VO_SOUND_PATH]/female/dainty/pain_1.ogg","[VO_SOUND_PATH]/female/dainty/pain_2.ogg","[VO_SOUND_PATH]/female/dainty/pain_3.ogg","[VO_SOUND_PATH]/female/dainty/pain_4.ogg","[VO_SOUND_PATH]/female/dainty/pain_5.ogg","[VO_SOUND_PATH]/female/dainty/pain_6.ogg")
		if("paincrit")
			used = list("[VO_SOUND_PATH]/female/dainty/paincrit_1.ogg","[VO_SOUND_PATH]/female/dainty/paincrit_2.ogg","[VO_SOUND_PATH]/female/dainty/paincrit_3.ogg","[VO_SOUND_PATH]/female/dainty/paincrit_4.ogg","[VO_SOUND_PATH]/female/dainty/paincrit_5.ogg","[VO_SOUND_PATH]/female/dainty/paincrit_6.ogg","[VO_SOUND_PATH]/female/dainty/paincrit_7.ogg")
		if("painmoan")
			used = list("[VO_SOUND_PATH]/female/dainty/painmoan_1.ogg","[VO_SOUND_PATH]/female/dainty/painmoan_2.ogg","[VO_SOUND_PATH]/female/dainty/painmoan_3.ogg","[VO_SOUND_PATH]/female/dainty/painmoan_4.ogg","[VO_SOUND_PATH]/female/dainty/painmoan_5.ogg")
		if("painscream", "scream")
			used = list("[VO_SOUND_PATH]/female/dainty/painscream_1.ogg","[VO_SOUND_PATH]/female/dainty/painscream_2.ogg","[VO_SOUND_PATH]/female/dainty/painscream_3.ogg","[VO_SOUND_PATH]/female/dainty/painscream_4.ogg")
		if("shh")
			used = list("[VO_SOUND_PATH]/female/dainty/shh_1.ogg","[VO_SOUND_PATH]/female/dainty/shh_2.ogg")
		if("sigh")
			used = list("[VO_SOUND_PATH]/female/dainty/sigh_1.ogg","[VO_SOUND_PATH]/female/dainty/sigh_2.ogg","[VO_SOUND_PATH]/female/dainty/sigh_3.ogg","[VO_SOUND_PATH]/female/dainty/sigh_4.ogg")
		if("sneeze")
			used = "[VO_SOUND_PATH]/female/dainty/sneeze_1.ogg"
	if(!used)
		used = ..()
	return used


/datum/voicepack/human/female/elf

/datum/voicepack/human/female/elf/get_sound(key)
	var/used
	switch(key)
		if("breathgasp")
			used = list("[VO_SOUND_PATH]/female/elf/breathgasp_1.ogg","[VO_SOUND_PATH]/female/elf/breathgasp_2.ogg")
		if("embed")
			used = list("[VO_SOUND_PATH]/female/elf/pain_1.ogg","[VO_SOUND_PATH]/female/elf/pain_2.ogg","[VO_SOUND_PATH]/female/elf/pain_3.ogg","[VO_SOUND_PATH]/female/elf/pain_4.ogg")
		if("fatigue")
			used = "[VO_SOUND_PATH]/female/elf/fatigue.ogg"
		if("firescream")
			used = "[VO_SOUND_PATH]/female/elf/fatigue.ogg"
		if("gasp")
			used = list("[VO_SOUND_PATH]/female/elf/gasp_1.ogg","[VO_SOUND_PATH]/female/elf/gasp_2.ogg","[VO_SOUND_PATH]/female/elf/gasp_3.ogg")
		if("groan")
			used = "[VO_SOUND_PATH]/female/elf/groan.ogg"
		if("haltyell")
			used = "[VO_SOUND_PATH]/female/elf/haltyell.ogg"
		if("hmm")
			used = list("[VO_SOUND_PATH]/female/elf/hmm_1.ogg","[VO_SOUND_PATH]/female/elf/hmm_2.ogg")
		if("pain")
			used = list("[VO_SOUND_PATH]/female/elf/pain_1.ogg","[VO_SOUND_PATH]/female/elf/pain_2.ogg","[VO_SOUND_PATH]/female/elf/pain_3.ogg","[VO_SOUND_PATH]/female/elf/pain_4.ogg")
		if("paincrit")
			used = "[VO_SOUND_PATH]/female/elf/paincrit.ogg"
		if("painscream", "scream")
			used = list("[VO_SOUND_PATH]/female/elf/painscream_1.ogg","[VO_SOUND_PATH]/female/elf/painscream_2.ogg")
	if(!used)
		used = ..()
	return used


/datum/voicepack/human/female/dwarf

/datum/voicepack/human/female/dwarf/get_sound(key)
	var/used
	switch(key)
		if("chuckle")
			used = list("[VO_SOUND_PATH]/female/dwarf/chuckle_1.ogg","[VO_SOUND_PATH]/female/dwarf/chuckle_2.ogg","[VO_SOUND_PATH]/female/dwarf/chuckle_3.ogg")
		if("laugh")
			used = list("[VO_SOUND_PATH]/female/dwarf/laugh_1.ogg","[VO_SOUND_PATH]/female/dwarf/laugh_2.ogg","[VO_SOUND_PATH]/female/dwarf/laugh_3.ogg")
	if(!used)
		used = ..()
	return used


/datum/voicepack/human/female/goblin

/datum/voicepack/human/female/goblin/get_sound(key)
	var/used
	switch(key)
		if("chuckle")
			used = list("[VO_SOUND_PATH]/female/goblin/chuckle_1.ogg","[VO_SOUND_PATH]/female/goblin/chuckle_3.ogg","[VO_SOUND_PATH]/female/goblin/chuckle_4.ogg")
		if("giggle")
			used = list("[VO_SOUND_PATH]/female/goblin/giggle_1.ogg","[VO_SOUND_PATH]/female/goblin/giggle_4.ogg","[VO_SOUND_PATH]/female/goblin/giggle_6.ogg")
		if("laugh")
			used = list("[VO_SOUND_PATH]/female/goblin/laugh_1.ogg","[VO_SOUND_PATH]/female/goblin/laugh_2.ogg","[VO_SOUND_PATH]/female/goblin/laugh_4.ogg")
	if(!used)
		used = ..()
	return used
