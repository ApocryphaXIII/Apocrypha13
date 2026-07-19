/datum/job/vampire/voivodate_citizen
	title = JOB_VOIVODATE_CITIZEN
	faction = FACTION_SABBAT
	total_positions = 5
	spawn_positions = 5
	supervisors = " the Laws of Hospitality"

	outfit = /datum/outfit/job/voivodate_citizen

	display_order = 4
	exp_required_type_department = EXP_TYPE_MANOR
	departments_list = list(
		/datum/job_department/manor,
	)

	allowed_splats = list(SPLAT_KINDRED, SPLAT_GHOUL)
	allowed_clans = list(VAMPIRE_CLAN_TZIMISCE, VAMPIRE_CLAN_MALKAVIAN, VAMPIRE_CLAN_TOREADOR, VAMPIRE_CLAN_OLD_CLAN_TZIMISCE, VAMPIRE_CLAN_HEALER_SALUBRI, VAMPIRE_CLAN_WARRIOR_SALUBRI, VAMPIRE_CLAN_DAUGHTERS_OF_CACOPHONY)

	description = "You belong to the Seer's Voivodate, a resurgance of the pre-existing California Voivodate. Above all you must respect the Hospitality, and the Voivodes."
	known_contacts = list("Voivode", "Zadruga", "Bogatyr", "Bogatyr Captain")

/datum/outfit/job/voivodate_citizen
	name = JOB_VOIVODATE_CITIZEN
	jobtype = /datum/job/vampire/voivodate_citizen
	uniform = /obj/item/clothing/under/vampire/punk
	suit = /obj/item/clothing/suit/vampire/trench/voivode
	shoes = /obj/item/clothing/shoes/vampire/jackboots
	backpack_contents = list(/obj/item/vamp/keys/voivodate = 1, /obj/item/passport = 1, /obj/item/flashlight = 1, /obj/item/card/credit/elder = 1)

