/datum/splat/saiyan
	name = "Saiyan"
	id = SPLAT_SAIYAN
	power_type = /datum/action/cooldown/power/saiyan
	var/list/gear_roundstart = list(
		/obj/item/clothing/under/vampire/dragon_ball/saiyan_gi,
		/obj/item/clothing/gloves/vampire/dragon_ball/saiyan,
		/obj/item/clothing/shoes/vampire/dragon_ball/saiyan,
	)

/datum/splat/saiyan/on_gain()
	add_power(/datum/action/cooldown/power/saiyan/super_saiyan)
	add_power(/datum/action/cooldown/power/saiyan/projectile/kamehameha)
	add_power(/datum/action/cooldown/power/saiyan/projectile/energy_ball)

	for(var/item_type in gear_roundstart)
		var/obj/item/new_item = new item_type(owner.loc)
		new_item.equip_to_best_slot(owner)

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

/datum/outfit/dragon_ball/saiyan
	name = "Dragon Ball - Saiyan"
	uniform = /obj/item/clothing/under/vampire/dragon_ball/saiyan_gi
	suit = /obj/item/clothing/suit/vampire/dragon_ball/saiyan_gi
	gloves = /obj/item/clothing/gloves/vampire/dragon_ball/saiyan
	shoes = /obj/item/clothing/shoes/vampire/dragon_ball/saiyan

/datum/outfit/dragon_ball/frieza
	name = "Dragon Ball - Frieza Force"
	uniform = /obj/item/clothing/under/vampire/dragon_ball/frieza_gi
	suit = /obj/item/clothing/suit/vampire/dragon_ball/frieza_gi
	gloves = /obj/item/clothing/gloves/vampire/dragon_ball/frieza
	shoes = /obj/item/clothing/shoes/vampire/dragon_ball/frieza

/datum/outfit/dragon_ball/piccolo
	name = "Dragon Ball - Piccolo"
	head = /obj/item/clothing/head/vampire/dragon_ball/piccolo
	uniform = /obj/item/clothing/under/vampire/dragon_ball/piccolo_gi
	suit = /obj/item/clothing/suit/vampire/dragon_ball/piccolo_gi
	gloves = /obj/item/clothing/gloves/vampire/dragon_ball/piccolo
	shoes = /obj/item/clothing/shoes/vampire/dragon_ball/piccolo
