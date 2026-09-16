/obj/item/melee/vamp/handsickle/waraxe
	name = "war axe"
	desc = "Deceptively light. Only eight pounds. (That's 4 kilos for the rest of you.)"
	icon = 'modular_zapoc/modules/weapons/icons/melee.dmi'
	icon_state = "waraxe"
	lefthand_file = 'modular_zapoc/modules/weapons/icons/melee_inhand_left.dmi'
	righthand_file = 'modular_zapoc/modules/weapons/icons/melee_inhand_right.dmi'
	worn_icon = 'modular_darkpack/modules/weapons/icons/worn_melee.dmi'
	ONFLOOR_ICON_HELPER('modular_zapoc/modules/weapons/icons/melee_onfloor.dmi')
	attack_difficulty = 5 // Easier to use than a sickle, harder than a knife
	icon_angle = -45
	demolition_mod = 1.25
	custom_price = 850

/obj/item/melee/vamp/handsickle/waraxe/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/butchering, \
	speed = 8 SECONDS, \
	effectiveness = 100, \
	)

/obj/item/melee/vamp/handsickle/waraxe/silver
	name = "silver axe"
	desc = "Get some!"
	custom_price = 5000

/obj/item/melee/vamp/handsickle/waraxe/silver/afterattack(atom/target, mob/user, list/modifiers, list/attack_modifiers)
	. = ..()
	fera_silver_damage(target, 2)
