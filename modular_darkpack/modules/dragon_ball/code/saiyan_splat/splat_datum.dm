/datum/splat/saiyan
	name = "Saiyan"
	id = SPLAT_SAIYAN
	power_type = /datum/action/cooldown/power/saiyan
	var/list/clothing_roundstart = list(
		/obj/item/clothing/under/vampire/saiyan_gi,
		/obj/item/clothing/gloves/vampire/saiyan,
		/obj/item/clothing/shoes/vampire/saiyan,
	)

/datum/splat/saiyan/on_gain()
	add_power(/datum/action/cooldown/power/saiyan/super_saiyan)
	add_power(/datum/action/cooldown/power/saiyan/kamehameha)
	// add_power(/datum/action/cooldown/power/saiyan/energy_ball)

	var/static/list/slots = list(
		LOCATION_LPOCKET = ITEM_SLOT_LPOCKET,
		LOCATION_RPOCKET = ITEM_SLOT_RPOCKET,
		LOCATION_BACKPACK = ITEM_SLOT_BACK,
		LOCATION_HANDS = ITEM_SLOT_HANDS
	)

	for(var/clothing_type in clothing_roundstart)
		var/obj/item/clothing/new_clothing = new clothing_type(owner.loc)
		owner.equip_in_one_of_slots(new_clothing, slots, FALSE)

/datum/splat/saiyan/prepare_human_for_preview(mob/living/carbon/human/human)
	human.set_haircolor("#272621", update = FALSE)
	human.set_eye_color("#008000", "#008000")
	human.set_hairstyle("Spiky 2", update = TRUE)
	// human.undershirt = "Shirt (Ian)"
	human.update_body()
	human.equipOutfit(/datum/outfit/saiyan, TRUE)

// DARKPACK TODO - WEREWOLF - (len lore)
/datum/splat/saiyan/get_splat_description()
	return "Hi im goku."

// DARKPACK TODO - WEREWOLF - (len lore)
/datum/splat/saiyan/get_splat_lore()
	return list(
		"Lorem Ipsum",
	)

/datum/outfit/saiyan
	uniform = /obj/item/clothing/under/vampire/saiyan_gi
	gloves = /obj/item/clothing/gloves/vampire/saiyan
	shoes = /obj/item/clothing/shoes/vampire/saiyan
