/obj/item/knife/vamp/bowie
	name = "bowie knife"
	desc = "Now this... is a knife."
	icon = 'modular_zapoc/modules/weapons/icons/melee.dmi'
	lefthand_file = 'modular_zapoc/modules/weapons/icons/melee_inhand_left.dmi'
	righthand_file = 'modular_zapoc/modules/weapons/icons/melee_inhand_right.dmi'
	worn_icon = 'modular_darkpack/modules/weapons/icons/worn_melee.dmi'
	ONFLOOR_ICON_HELPER('modular_zapoc/modules/weapons/icons/melee_onfloor.dmi')
	icon_state = "bowie"
	inhand_icon_state = "bowie"
	slot_flags = ITEM_SLOT_MASK
	force = 3 TTRPG_DAMAGE // stronger than knife
	custom_price = 200
	icon_angle = 210
	attack_difficulty = 5 // harder to use than a normal knife

/obj/item/knife/vamp/bowie/silver
	name = "silver bowie knife"
	desc = "If it can take down an alligator... it can take down a dog."
	custom_price = 4000

/obj/item/knife/vamp/bowie/silver/afterattack(atom/target, mob/user, list/modifiers, list/attack_modifiers)
	. = ..()
	fera_silver_damage(target, 1)
