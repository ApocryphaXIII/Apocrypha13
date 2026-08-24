/datum/job/vampire/primogen_duskborn
	title = JOB_PRIMOGEN_DUSKBORN
	description = "You are too valuable to not have a position, but you are not recognized enough for anything more. You are tasked with managing the city's thinbloods and Caitiff population. You may be a Caitiff yourself, however unlikely that may be."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	faction = FACTION_CAMARILLA
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_TRADITIONS
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 1600
	exp_required_type = EXP_TYPE_CAMARILLA
	exp_required_type_department = EXP_TYPE_CAMARILLA
	exp_granted_type = EXP_TYPE_CAMARILLA
	config_tag = "PRIMOGEN_MALKAVIAN"
	job_flags = CITY_JOB_FLAGS
	outfit = /datum/outfit/job/vampire/duskborn

//	display_order = JOB_DISPLAY_ORDER_DUSKBORN
	departments_list = list(
		/datum/job_department/camarilla
	)

	minimal_generation = 13
	minimum_immortal_age = 50
	minimum_masquerade = 4
	allowed_splats = list(SPLAT_KINDRED)
//	allowed_clans = list(VAMPIRE_CLAN_BRUJAH, VAMPIRE_CLAN_BANU_HAQIM, VAMPIRE_CLAN_BANU_HAQIM_VIZIER, VAMPIRE_CLAN_CAITIFF, VAMPIRE_CLAN_DOMINATE_MALKAVIAN, VAMPIRE_CLAN_DAUGHTERS_OF_CACOPHONY, VAMPIRE_CLAN_HEALER_SALUBRI, VAMPIRE_CLAN_LASOMBRA, VAMPIRE_CLAN_NOSFERATU, VAMPIRE_CLAN_TOREADOR, VAMPIRE_CLAN_WARRIOR_SALUBRI)

	known_contacts = list("Prince")

/datum/outfit/job/vampire/duskborn
	name = "Duskborn Primogen"
	jobtype = /datum/job/vampire/primogen_duskborn

	ears = /obj/item/radio/headset/darkpack
	id = /obj/item/card/primogen
	uniform = /obj/item/clothing/under/vampire/suit
	suit = /obj/item/clothing/suit/vampire/trench
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	l_pocket = /obj/item/smartphone/duskborn_primo
	backpack_contents = list(/obj/item/vamp/keys/duskborn/primogen=1, /obj/item/card/credit/elder=1, /obj/item/card/whip, /obj/item/card/steward, /obj/item/card/myrmidon)
