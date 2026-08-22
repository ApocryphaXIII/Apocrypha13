//------------EQUIPMENT------------
/datum/armor/inquisitor
	melee = 60
	bullet = 60
	laser = 60
	energy = 60
	fire = 60
	bomb = 60
	acid = 60
	wound = 60

//------------SHOES------------
/obj/item/clothing/shoes/vampire/jackboots/inquisitor
	name = "sabatons"
	desc = "Armored footwear. These are the roads that burnt our boots."
	icon = 'modular_zapoc/ert/icons/items/inquisitor_armor.dmi'
	worn_icon = 'modular_zapoc/ert/icons/items/inquisitor_armor_worn.dmi'
	icon_state = "shoes"
	ONFLOOR_ICON_HELPER('modular_zapoc/ert/icons/items/inquisitor_armor_onfloor.dmi')
	undyeable = TRUE
	armor_type = /datum/armor/shoes_jackboots

//------------GLOVES------------
/obj/item/clothing/gloves/vampire/inquisitor
	name = "gauntlets"
	desc = "Armored gloves. With these hands I will destroy, with these hands I will rebuild."
	icon = 'modular_zapoc/ert/icons/items/inquisitor_armor.dmi'
	worn_icon = 'modular_zapoc/ert/icons/items/inquisitor_armor_worn.dmi'
	ONFLOOR_ICON_HELPER('modular_zapoc/ert/icons/items/inquisitor_armor_onfloor.dmi')
	icon_state = "gloves"
	undyeable = TRUE
	armor_type = /datum/armor/gloves_combat

//------------HELMET------------
/obj/item/clothing/head/vampire/inquisitor // TODO: TG PR to move NVG of of /clothing/glasses
	name = "great helm"
	desc = "A black helmet with 4 glowing eyes. God forgives. You do not."
	icon_state = "helm"
	icon = 'modular_zapoc/ert/icons/items/inquisitor_armor.dmi'
	worn_icon = 'modular_zapoc/ert/icons/items/inquisitor_armor_worn.dmi'
	ONFLOOR_ICON_HELPER('modular_zapoc/ert/icons/items/inquisitor_armor_onfloor.dmi')
	armor_type = /datum/armor/inquisitor
	undyeable = TRUE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR
	visor_flags_inv = HIDEFACE|HIDESNOUT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF
	var/light_mask = "helm_emissive"

/obj/item/clothing/head/vampire/inquisitor/update_overlays()
	. = ..()
	. += emissive_appearance(icon, light_mask, src, effect_type = EMISSIVE_BLOOM)

/obj/item/clothing/head/vampire/inquisitor/worn_overlays(mutable_appearance/standing, isinhands, icon_file, bodyshape = NONE)
	. = ..()
	if(!isinhands)
		. += emissive_appearance(worn_icon, light_mask, src, effect_type = EMISSIVE_BLOOM)

//------------SUIT------------
/obj/item/clothing/suit/vampire/inquisitor
	name = "cuirass"
	desc = "A strong looking, armoured-vest. No weapon formed against you shall prosper."
	icon_state = "suit"
	icon = 'modular_zapoc/ert/icons/items/inquisitor_armor.dmi'
	worn_icon = 'modular_zapoc/ert/icons/items/inquisitor_armor_worn.dmi'
	ONFLOOR_ICON_HELPER('modular_zapoc/ert/icons/items/inquisitor_armor_onfloor.dmi')
	armor_type = /datum/armor/inquisitor
	undyeable = TRUE
	max_integrity = 250
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	clothing_traits = list(TRAIT_BRAWLING_KNOCKDOWN_BLOCKED)
	allowed = list(
		/obj/item/card,
		/obj/item/flashlight,
		/obj/item/melee/baton,
		/obj/item/restraints/handcuffs,
		/obj/item/intel_report,
		/obj/item/ammo_box/magazine/darkpack9mp5,
		/obj/item/intel_report,
		/obj/item/ammo_box/magazine/m44,
		/obj/item/vampire_stake,
		/obj/item/vampirebook/bible,
		/obj/item/card/credit,
		/obj/item/storage/medkit/darkpack/ifak,
		/obj/item/gun/ballistic/automatic/darkpack/mp5,
		/obj/item/gun/ballistic/automatic/pistol/darkpack/deagle,
		/obj/item/storage/belt/inquisitor,
		)

//------------UNDER------------
/obj/item/clothing/under/vampire/inquisitor
	name = "gambeson"
	desc = "A heavily padded jumpsuit. They will fight against you but will never overcome you."
	icon_state = "under"
	undyeable = TRUE
	icon = 'modular_zapoc/ert/icons/items/inquisitor_armor.dmi'
	worn_icon = 'modular_zapoc/ert/icons/items/inquisitor_armor_worn.dmi'
	ONFLOOR_ICON_HELPER('modular_zapoc/ert/icons/items/inquisitor_armor_onfloor.dmi')
	armor_type = /datum/armor/clothing_under/security_head_of_security

//------------BACKPACK------------
/datum/storage/inquisitor_belt // Should supplant backpacks but not replace
	max_total_storage = 14
	max_slots = 21

/obj/item/storage/backpack/inquisitor
	name = "harness"
	desc = "A belt and carrier rig. Silver and cold iron buckshot should do the trick."
	icon_state = "belt"
	worn_icon_state = "belt"
	icon = 'modular_zapoc/ert/icons/items/inquisitor_armor.dmi'
	worn_icon = 'modular_zapoc/ert/icons/items/inquisitor_armor_worn.dmi'
	ONFLOOR_ICON_HELPER('modular_zapoc/ert/icons/items/inquisitor_armor_onfloor.dmi')
	equip_sound = 'sound/items/equip/toolbelt_equip.ogg'
	storage_type = /datum/storage/inquisitor_belt
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK

//----------EQUIPMENT----------
/obj/item/radio/headset/darkpack/inquisitor
	radio_network = NETWORK_LEOPOLD
