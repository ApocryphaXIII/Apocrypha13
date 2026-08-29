/datum/job/vampire/primogen_nosferatu
	title = JOB_PRIMOGEN_NOSFERATU
	description = "Offer your infinite knowledge to Prince of the City. Manage what's left of your Warrens. Keep your clan interests in mind."
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
	config_tag = "PRIMOGEN_NOSFERATU"
	job_flags = CITY_JOB_FLAGS
	outfit = /datum/outfit/job/vampire/nosferatu

	display_order = JOB_DISPLAY_ORDER_NOSFERATU
	departments_list = list(
		/datum/job_department/camarilla
	)

	minimal_generation = 12
	minimum_immortal_age = 50
	minimum_masquerade = 4
	allowed_splats = list(SPLAT_KINDRED)
	allowed_clans = list(VAMPIRE_CLAN_NOSFERATU)

	known_contacts = list("Prince")

/datum/outfit/job/vampire/nosferatu
	name = "Primogen Nosferatu"
	jobtype = /datum/job/vampire/primogen_nosferatu

	ears = /obj/item/radio/headset/darkpack
	id = /obj/item/card/primogen
	mask = /obj/item/clothing/mask/vampire/shemagh
	glasses = /obj/item/clothing/glasses/vampire/sun
	uniform = /obj/item/clothing/under/vampire/suit
	suit = /obj/item/clothing/suit/vampire/trench
	shoes = /obj/item/clothing/shoes/vampire
	l_pocket = /obj/item/smartphone/nosferatu_primo
	backpack_contents = list(/obj/item/vamp/keys/nosferatu/primogen=1, /obj/item/card/credit/elder=1, /obj/item/card/whip, /obj/item/card/steward, /obj/item/card/myrmidon)
