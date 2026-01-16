/obj/item/bailer
	name = "bailer"
	desc = "Best for flora!"
	icon_state = "bailer"
	icon = 'modular_darkpack/modules/deprecated/icons/items.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/amount_of_water = 10

/obj/item/bailer/examine(mob/user)
	. = ..()
	if(!amount_of_water)
		. += span_warning("[src] is empty!")
	else
		. += span_notice("It has [amount_of_water]/10 unit[amount_of_water == 1 ? "" : "s"] of water left.")
