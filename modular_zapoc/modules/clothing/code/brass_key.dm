/obj/item/brass_key
	name = "brass key"
	desc = "A large brass key for the worlds largest cymbal monkey."
	icon_state = "fake_key"
	icon = 'modular_zapoc/modules/clothing/icons/brass_key.dmi'
	ONFLOOR_ICON_HELPER('modular_zapoc/modules/clothing/icons/brass_key_onfloor.dmi')
	worn_icon = 'modular_zapoc/modules/clothing/icons/brass_key_worn.dmi'
	lefthand_file = 'modular_zapoc/modules/clothing/icons/brass_key_lefthand.dmi'
	righthand_file = 'modular_zapoc/modules/clothing/icons/brass_key_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	drop_sound = 'sound/items/handling/tools/crowbar_drop.ogg'
	pickup_sound = 'sound/items/handling/tools/crowbar_pickup.ogg'
	// grid_width = 6 GRID_BOXES
	// grid_height = 6 GRID_BOXES
	throw_range = 1
	force = 5

/obj/item/brass_key/real
	desc = "It weighs a ton."
	icon_state = "key"
	slowdown = 1
