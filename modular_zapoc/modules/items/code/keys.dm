#define LOCKACCESS_VET "veterinarian"
#define LOCKACCESS_COFFEE "coffee"
#define LOCKACCESS_PIZZA "pizza"
#define LOCKACCESS_TATTOO "tattoo"
#define LOCKACCESS_OCEAN "ocean"

#define LOCKACCESS_VOIVODATE "voivodate_citizen"
#define LOCKACCESS_VOIVODATE_ADVANCED "seer_voivodate"
#define LOCKACCESS_VOIVODATE_MASTER "voivodate_master"

/obj/item/vamp/keys/veterinarian
	name = "veterinarian keys"
	accesslocks = list(
		LOCKACCESS_VET
	)
	color = "#2c92ff"

/obj/effect/mapping_helpers/door/access/veterinarian
	lock_id = LOCKACCESS_VET


/obj/item/vamp/keys/coffee
	name = "coffee shop keys"
	accesslocks = list(
		LOCKACCESS_COFFEE
	)
	color = "#ec8f3e"

/obj/effect/mapping_helpers/door/access/coffee
	lock_id = LOCKACCESS_COFFEE


/obj/item/vamp/keys/pizza
	name = "pizzaria keys"
	accesslocks = list(
		LOCKACCESS_PIZZA
	)

/obj/effect/mapping_helpers/door/access/pizza
	lock_id = LOCKACCESS_PIZZA


/obj/item/vamp/keys/tattoo
	name = "tattoo parlor keys"
	accesslocks = list(
		LOCKACCESS_TATTOO
	)

/obj/effect/mapping_helpers/door/access/tattoo
	lock_id = LOCKACCESS_TATTOO


/obj/item/vamp/keys/ocean
	name = "gang keys"
	accesslocks = list(
		LOCKACCESS_OCEAN
	)

/obj/effect/mapping_helpers/door/access/ocean
	lock_id = LOCKACCESS_OCEAN



/obj/item/vamp/keys/voivodate
	name = "Family estate keys"
	accesslocks = list(
		LOCKACCESS_VOIVODATE
	)

/obj/effect/mapping_helpers/door/access/voivodate
	lock_id = LOCKACCESS_VOIVODATE

/obj/item/vamp/keys/voivodate/advanced
	name = "Estate security keys"
	accesslocks = list(
		LOCKACCESS_VOIVODATE,
		LOCKACCESS_VOIVODATE_ADVANCED
	)

/obj/effect/mapping_helpers/door/access/voivodate/advanced
	lock_id = LOCKACCESS_VOIVODATE_ADVANCED

/obj/item/vamp/keys/voivodate/master
	name = "Estate master keys"
	accesslocks = list(
		LOCKACCESS_VOIVODATE_ADVANCED,
		LOCKACCESS_VOIVODATE_MASTER,
		LOCKACCESS_VOIVODATE
	)

/obj/effect/mapping_helpers/door/access/voivodate/master
	lock_id = LOCKACCESS_VOIVODATE_MASTER


/obj/item/vamp/keys/poi/pentex_poi
	name = "Endron Logging Facility keys"
	accesslocks = list(
		"pentex_poi"
	)
	color = "#062e03"

/obj/effect/mapping_helpers/door/access/pentex_poi
	lock_id = "pentex_poi"

#undef LOCKACCESS_VET
#undef LOCKACCESS_COFFEE
#undef LOCKACCESS_PIZZA
#undef LOCKACCESS_TATTOO
#undef LOCKACCESS_OCEAN

#undef LOCKACCESS_VOIVODATE
#undef LOCKACCESS_VOIVODATE_ADVANCED
#undef LOCKACCESS_VOIVODATE_MASTER
