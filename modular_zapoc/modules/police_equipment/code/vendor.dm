//Utilities Vendor - Less bang orientated, more RP
/obj/structure/retail/police_utilities
	product_types = list(
		/obj/item/clothing/under/vampire/police,
		/obj/item/clothing/under/vampire/police/long,
		/obj/item/clothing/under/vampire/police/turtleneck,
		/obj/item/clothing/under/vampire/police/pants,
		/obj/item/clothing/under/vampire/police/utility,
		/obj/item/clothing/head/vampire/police,
		/obj/item/clothing/suit/vampire/coat/police,
		/obj/item/storage/belt/holster/detective/darkpack,
		/obj/item/storage/belt/security/police,
		/obj/item/camera/detective,
		/obj/item/taperecorder,
		/obj/item/toy/crayon/white,
		/obj/item/storage/box/evidence,
		/obj/item/flashlight/seclite,
		/obj/item/detective_scanner/darkpack,
		/obj/item/storage/box/bodybags,
	)

	products_list = list(
		new /datum/data/vending_product("binoculars", /obj/item/binoculars, 20),
	)

/obj/structure/retail/police_utilities/can_shop(mob/user)
	var/datum/job/vampire/assigned_role = user.mind?.assigned_role
	if(assigned_role && (/datum/job_department/police in assigned_role.departments_list))
		return TRUE
