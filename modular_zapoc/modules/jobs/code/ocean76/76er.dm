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

	known_contacts = list("Ocean 76er Boss")
	description = "This city should belong to those who live in it. Your family in the 76 got your back, you should have theirs."
	minimal_masquerade = 0

/datum/outfit/job/vampire/ocean
	name = "Ocean 76er"
	jobtype = /datum/job/vampire/ocean
	uniform = /obj/item/clothing/under/vampire/biker
	shoes = /obj/item/clothing/shoes/vampire/sneakers
	head = /obj/item/clothing/head/vampire/bandana/black
	l_pocket = /obj/item/vamp/keys/ocean
	r_pocket = /obj/item/knife/vamp
	backpack_contents = list(/obj/item/clothing/mask/vampire/balaclava = 1, /obj/item/gun/ballistic/automatic/pistol/darkpack/glock19 = 1, /obj/item/ammo_box/magazine/glock9mm = 2)
