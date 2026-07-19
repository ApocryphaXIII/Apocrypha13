/obj/item/clothing/under/trackpants
	name = "track pants"
	desc = "A pair of track pants, for the athletic."
	icon = 'modular_zapoc/modules/clothing/icons/trackpants.dmi'
	worn_icon = 'modular_zapoc/modules/clothing/icons/trackpants_worn.dmi'
	icon_state = "trackpants"
	can_adjust = FALSE
	var/spawn_with_jacket = TRUE
	var/spawn_jacket = /obj/item/clothing/suit/trackjacket
	var/attached_jacket
	var/attached_jacket_open = FALSE
	var/mutable_appearance/jacket_overlay


/obj/item/clothing/under/trackpants/Initialize(mapload)
	. = ..()
	if(spawn_with_jacket)
		var/obj/item/clothing/suit/trackjacket/TJ = new spawn_jacket
		attach_trackjacket(TJ)


/obj/item/clothing/under/trackpants/attackby(obj/item/I, mob/user)
	. = ..()
	if(istype(I, /obj/item/clothing/suit/trackjacket))
		var/obj/item/clothing/suit/trackjacket/TJ = I
		attach_trackjacket(TJ, user)


/obj/item/clothing/under/trackpants/worn_overlays(isinhands = FALSE)
	. = ..()
	if(jacket_overlay && !isinhands)
		. += jacket_overlay


/obj/item/clothing/under/trackpants/proc/attach_trackjacket(obj/item/clothing/suit/trackjacket/I, mob/user)
	if(attached_jacket)
		to_chat(user, span_warning("There's already something attached to [src]."))
		return FALSE

	attached_jacket = I.type
	attached_jacket_open = I.jacket_open

	jacket_overlay = mutable_appearance(I.worn_icon, I.icon_state)
	if(iscarbon(loc))
		var/mob/living/carbon/C = loc
		C.regenerate_icons()

	to_chat(user, span_notice("You attach [I] to [src]."))

	qdel(I)

	return TRUE


/obj/item/clothing/under/trackpants/AltClick(mob/user)
	if(attached_accessory)
		remove_accessory(user)
		return

	if(!attached_jacket)
		return

	if(isliving(user))
		var/mob/living/living_mob = user
		if(!(living_mob.mobility_flags & MOBILITY_PICKUP))
			return

	var/obj/item/clothing/suit/trackjacket/TJ = new attached_jacket

	TJ.jacket_open = attached_jacket_open
	TJ.update_jacket_state(user)

	user.put_in_hands(TJ)

	jacket_overlay = null
	attached_jacket = null

	if(iscarbon(loc))
		var/mob/living/carbon/C = loc
		C.regenerate_icons()


/obj/item/clothing/under/trackpants/examine(mob/user)
	. = ..()
	if(attached_jacket)
		. += span_notice("Alt-click to remove attached jacket.")
	else
		. += span_notice("A trackjacket can be attached to this uniform.")


/obj/item/clothing/under/trackpants/blue
	name = "blue track pants"
	icon_state = "trackpantsblue"
	spawn_jacket = /obj/item/clothing/suit/trackjacket/blue


/obj/item/clothing/under/trackpants/green
	name = "green track pants"
	icon_state = "trackpantsgreen"
	spawn_jacket = /obj/item/clothing/suit/trackjacket/green


/obj/item/clothing/under/trackpants/white
	name = "white track pants"
	icon_state = "trackpantswhite"
	spawn_jacket = /obj/item/clothing/suit/trackjacket/white


/obj/item/clothing/under/trackpants/red
	name = "red track pants"
	icon_state = "trackpantsred"
	spawn_jacket = /obj/item/clothing/suit/trackjacket/red


// TRACK JACKETS

/obj/item/clothing/suit/trackjacket
	name = "track jacket"
	desc = "A track jacket, for the athletic."
	icon = 'modular_zapoc/modules/clothing/icons/trackjacket.dmi'
	worn_icon = 'modular_zapoc/modules/clothing/icons/trackjacket_worn.dmi'
	icon_state = "trackjacket"
	inhand_icon_state = "trackjacket"
	base_icon_state = "trackjacket"
	var/jacket_open = FALSE


/obj/item/clothing/suit/trackjacket/AltClick(mob/user)
	. = ..()

	jacket_open = !jacket_open
	update_jacket_state(user)

/obj/item/clothing/suit/trackjacket/proc/update_jacket_state(mob/user)
	if(jacket_open)
		icon_state = "[base_icon_state]_open"
	else
		icon_state = base_icon_state

	user.regenerate_icons()


/obj/item/clothing/suit/trackjacket/examine(mob/user)
	. = ..()
	. += span_notice("Alt-click to adjust [src].")

/obj/item/clothing/suit/trackjacket/blue
	name = "blue track jacket"
	icon_state = "trackjacketblue"
	base_icon_state = "trackjacketblue"


/obj/item/clothing/suit/trackjacket/green
	name = "green track jacket"
	icon_state = "trackjacketgreen"
	base_icon_state = "trackjacketgreen"


/obj/item/clothing/suit/trackjacket/red
	name = "red track jacket"
	icon_state = "trackjacketred"
	base_icon_state = "trackjacketred"


/obj/item/clothing/suit/trackjacket/white
	name = "white track jacket"
	icon_state = "trackjacketwhite"
	base_icon_state = "trackjacketwhite"

