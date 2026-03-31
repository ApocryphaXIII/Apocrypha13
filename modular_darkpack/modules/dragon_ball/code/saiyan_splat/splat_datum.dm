/datum/splat/saiyan
	name = "Saiyan"
	id = SPLAT_SAIYAN
	power_type = /datum/action/cooldown/power/saiyan
	/*
	var/list/gear_roundstart = list(
		/obj/item/clothing/under/vampire/dragon_ball/saiyan,
		/obj/item/clothing/gloves/vampire/dragon_ball/saiyan,
		/obj/item/clothing/shoes/vampire/dragon_ball/saiyan,
	)
	*/

/datum/splat/saiyan/on_gain()
	add_power(/datum/action/cooldown/power/saiyan/super_saiyan)
	add_power(/datum/action/cooldown/power/saiyan/projectile/kamehameha)
	add_power(/datum/action/cooldown/power/saiyan/projectile/energy_ball)
	add_power(/datum/action/innate/saiyan_flight) // not the saiyan subtype but we dont acctually assume any behavoir based on it so its whatever rn.

	/*
	var/datum/action/innate/saiyan_flight/toggleflight = new()
	toggleflight.Grant(owner)
	*/

	/*
	for(var/item_type in gear_roundstart)
		var/obj/item/new_item = new item_type(owner.loc)
		new_item.equip_to_best_slot(owner)
	*/

	owner.st_add_stat_mod(STAT_DEXTERITY, 1, "saiyan")
	owner.st_add_stat_mod(STAT_STRENGTH, 1, "saiyan")
	owner.st_add_stat_mod(STAT_STAMINA, 2, "saiyan")

/datum/splat/saiyan/prepare_human_for_preview(mob/living/carbon/human/human)
	human.set_haircolor("#272621", update = FALSE)
	human.set_eye_color("#008000")
	human.set_hairstyle("Spiky 2", update = TRUE)
	// human.undershirt = "Shirt (Ian)"
	human.update_body()
	human.equipOutfit(/datum/outfit/dragon_ball/saiyan, TRUE)

/datum/splat/saiyan/get_splat_description()
	return "Hi im goku."

/datum/splat/saiyan/get_splat_lore()
	return list(
		"Saiyans (サイヤ人 Saiya-jin) are a race of extraterrestrials known for a aggresive warrior culture.",
	)

/datum/outfit/dragon_ball
	abstract_type = /datum/outfit/dragon_ball

	l_pocket = /obj/item/food/grown/senzu

/datum/outfit/dragon_ball/saiyan
	name = "Dragon Ball - Saiyan"
	uniform = /obj/item/clothing/under/vampire/dragon_ball/saiyan
	suit = /obj/item/clothing/suit/vampire/dragon_ball/saiyan
	gloves = /obj/item/clothing/gloves/vampire/dragon_ball/saiyan
	shoes = /obj/item/clothing/shoes/vampire/dragon_ball/saiyan

/datum/outfit/dragon_ball/saiyan/goku
	name = "Dragon Ball - Saiyan (Goku)"

/datum/outfit/dragon_ball/saiyan/goku/pre_equip(mob/living/carbon/human/user, visuals_only)
	. = ..()

	user.gender = MALE
	user.skin_tone = "caucasian3"

	user.set_haircolor("#272621", update = FALSE)
	user.set_facial_haircolor("#272621", update = FALSE)
	user.set_eye_color("#008000")
	user.set_hairstyle("Spiky 2", update = FALSE)
	user.set_facial_hairstyle("Shaved", update = FALSE)

	user.update_body()

	if(visuals_only)
		return

	user.fully_replace_character_name(null, "Son Goku")

/datum/outfit/dragon_ball/frieza
	name = "Dragon Ball - Frieza Force"
	uniform = /obj/item/clothing/under/vampire/dragon_ball/frieza
	suit = /obj/item/clothing/suit/vampire/dragon_ball/frieza
	gloves = /obj/item/clothing/gloves/vampire/dragon_ball/frieza
	shoes = /obj/item/clothing/shoes/vampire/dragon_ball/frieza

	r_pocket = /obj/item/saibamen_seed

/datum/outfit/dragon_ball/piccolo
	name = "Dragon Ball - Piccolo"
	head = /obj/item/clothing/head/vampire/dragon_ball/piccolo
	uniform = /obj/item/clothing/under/vampire/dragon_ball/piccolo
	suit = /obj/item/clothing/suit/vampire/dragon_ball/piccolo
	gloves = /obj/item/clothing/gloves/vampire/dragon_ball/piccolo
	shoes = /obj/item/clothing/shoes/vampire/dragon_ball/piccolo

/datum/outfit/dragon_ball/roshi
	name = "Dragon Ball - Roshi"
	uniform = /obj/item/clothing/under/vampire/dragon_ball/roshi
	shoes = /obj/item/clothing/shoes/vampire/dragon_ball/roshi
	back = /obj/item/storage/backpack/roshi_turtle_shell
	glasses = /obj/item/clothing/glasses/vampire/sun/roshi

/datum/outfit/dragon_ball/bulma
	name = "Dragon Ball - Bulma"
	uniform = /obj/item/clothing/under/vampire/dragon_ball/bulma
	suit = /obj/item/clothing/suit/vampire/dragon_ball/bulma
	gloves = /obj/item/clothing/gloves/vampire/dragon_ball/bulma
	shoes = /obj/item/clothing/shoes/vampire/dragon_ball/bulma

/datum/outfit/dragon_ball/tien
	name = "Dragon Ball - Tien"
	uniform = /obj/item/clothing/under/vampire/dragon_ball/tien
	gloves = /obj/item/clothing/gloves/vampire/dragon_ball/tien
	shoes = /obj/item/clothing/shoes/vampire/dragon_ball/tien
