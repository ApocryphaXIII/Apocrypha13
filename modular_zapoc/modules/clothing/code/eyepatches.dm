/obj/item/clothing/glasses/eyepatch/rose
	name = "rose eyepatch"
	desc = "Put this over your eye if you want people to think your head is full of roses."
	icon = 'modular_zapoc/modules/clothing/icons/eyepatches.dmi'
	worn_icon = 'modular_zapoc/modules/clothing/icons/eyepatches_worn.dmi'
	ONFLOOR_ICON_HELPER('modular_zapoc/modules/clothing/icons/eyepatches_onfloor.dmi')
	icon_state = "rosepatch"
	base_icon_state = "rosepatch"

/obj/item/clothing/glasses/blindfold/apoc // TODO: GAGS
	name = "blindfold"
	desc = "Fold it over your eyes to go blind."
	icon = 'modular_zapoc/modules/clothing/icons/eyepatches.dmi'
	worn_icon = 'modular_zapoc/modules/clothing/icons/eyepatches_worn.dmi'
	ONFLOOR_ICON_HELPER('modular_zapoc/modules/clothing/icons/eyepatches_onfloor.dmi')
	icon_state = "blindfoldwhite"
	base_icon_state = "blindfoldwhite"
	worn_icon_state = "blindfoldwhite_both"
	var/wornunder = TRUE
	var/adjusted_state = "both"
	var/oldname = "blindfold"

/obj/item/clothing/glasses/blindfold/apoc/trick
	desc = "Fold it over your eyes to not go blind, because this one is too thin to obstruct your vision. Cheater."
	tint = NONE

/obj/item/clothing/glasses/blindfold/apoc/click_alt(mob/user)
	. = ..()
	adjust_blindfold(user)

/obj/item/clothing/glasses/blindfold/apoc/attack_self(mob/user)
	wornunder = !wornunder
	alternate_worn_layer = wornunder ? GLASSES_LAYER : FACEMASK_LAYER
	to_chat(user, span_notice("You adjust the [src]."))

/obj/item/clothing/glasses/blindfold/apoc/proc/on_examine(datum/source, mob/user, list/examine_list) // TODO: Make this Context
	examine_list += span_notice("Alt-click to adjust the [name]. Use in hand to change layer.")

/obj/item/clothing/glasses/blindfold/apoc/proc/adjust_blindfold(mob/living/carbon/human/user) // TODO: Make this remove flag GLASSESCOVERSEYES
	var/mob/living/carbon/human/human_user = user
	switch(adjusted_state)
		if("both")
			adjusted_state = "left"
			name = "eyepatch"
			desc = "A fabric eyepatch over your left eye."
			oldname = "blindfold"
			if(human_user.get_eye_scars() & RIGHT_EYE_SCAR)
				tint = INFINITY
			else
				tint = NONE
		if("left")
			adjusted_state = "right"
			desc = "A fabric eyepatch over your right eye."
			if(human_user.get_eye_scars() & LEFT_EYE_SCAR)
				tint = INFINITY
			else
				tint = NONE
		if("right")
			adjusted_state = "head"
			name = "headband"
			desc = "A tied fabric headband."
			oldname = "eyepatch"
			tint = NONE
		if("head")
			name = "blindfold"
			adjusted_state = "both"
			desc = initial(desc)
			oldname = "headband"
			tint = initial(tint)

	worn_icon_state = "[base_icon_state]_[adjusted_state]"

	to_chat(user, span_notice("You adjust the [oldname], wearing it as [name]."))
	if(ismob(loc))
		human_user.update_worn_glasses()

		human_user.update_tint()
