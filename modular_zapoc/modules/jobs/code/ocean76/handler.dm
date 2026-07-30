/datum/job/vampire/ocean_boss
	title = JOB_OCEAN_76_BOSS
	faction = FACTION_OCEAN_76
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Arch"
	config_tag = "OCEAN76BOSS"
	job_flags = CITY_JOB_FLAGS
	outfit = /datum/outfit/job/vampire/ocean

	display_order = JOB_DISPLAY_ORDER_OCEAN_76_BOSS
	exp_required_type_department = EXP_TYPE_OCEAN
	department_for_prefs = /datum/job_department/ocean
	departments_list = list(
		/datum/job_department/ocean,
	)

	known_contacts = list("Operator", "Dealer")
	allowed_splats = list(SPLAT_NONE)
	description = "This city should belong to those who live in it. Your operators are at your command, and they have your back."
	minimum_masquerade = 5

/datum/outfit/job/vampire/ocean_boss
	name = "Handler"
	jobtype = /datum/job/vampire/ocean
	uniform = /obj/item/clothing/under/vampire/biker
	shoes = /obj/item/clothing/shoes/vampire/sneakers
	head = /obj/item/clothing/head/vampire/bandana/black
	l_pocket = /obj/item/smartphone
	r_pocket = /obj/item/knife/vamp
	backpack_contents = list(/obj/item/vamp/keys/ocean = 1, /obj/item/clothing/suit/vampire/vest = 1, /obj/item/clothing/mask/vampire/balaclava = 1, /obj/item/gun/ballistic/automatic/pistol/darkpack/beretta = 1, /obj/item/ammo_box/magazine/semi9mm = 2, /obj/item/card/credit = 1)
