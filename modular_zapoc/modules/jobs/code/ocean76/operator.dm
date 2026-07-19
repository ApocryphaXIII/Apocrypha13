/datum/job/vampire/ocean
	title = JOB_OCEAN_76_GANGER
	faction = FACTION_OCEAN_76
	total_positions = 8
	spawn_positions = 8
	supervisors = "the Boss"
	config_tag = "OCEAN76"
	job_flags = CITY_JOB_FLAGS
	outfit = /datum/outfit/job/vampire/ocean

	display_order = JOB_DISPLAY_ORDER_OCEAN_76_GANGER
	exp_required_type_department = EXP_TYPE_OCEAN
	department_for_prefs = /datum/job_department/ocean
	departments_list = list(
		/datum/job_department/ocean,
	)

	known_contacts = list("Handler")
	description = "This city should belong to those who live in it. Run the streets the way they're supposed to be run."
	minimum_masquerade = 0

/datum/outfit/job/vampire/ocean
	name = "Operator"
	jobtype = /datum/job/vampire/ocean
	uniform = /obj/item/clothing/under/vampire/biker
	shoes = /obj/item/clothing/shoes/vampire/sneakers
	head = /obj/item/clothing/head/vampire/bandana/black
	l_pocket = /obj/item/smartphone
	r_pocket = /obj/item/knife/vamp
	backpack_contents = list(/obj/item/vamp/keys/ocean, /obj/item/clothing/mask/vampire/balaclava = 1, /obj/item/gun/ballistic/automatic/pistol/darkpack/glock19 = 1, /obj/item/ammo_box/magazine/glock9mm = 2)
