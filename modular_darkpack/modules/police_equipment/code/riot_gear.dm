//Police Riot Gear
/obj/item/clothing/suit/vampire/vest/police/riot
	name = "riot vest"
	icon_state = "riotvest"
	desc = "Lightweight riot vest with SFPD markings, tailored for riot control."
	armor_type = /datum/armor/riot_vest
	icon = 'modular_darkpack/modules/police_equipment/icons/clothing.dmi'
	worn_icon = 'modular_darkpack/modules/police_equipment/icons/worn.dmi'
	ONFLOOR_ICON_HELPER('modular_darkpack/modules/police_equipment/icons/clothing_onfloor.dmi')

/datum/armor/riot_vest
	melee = 80
	bullet = 50
	laser = 10
	energy = 10
	bomb = 55
	fire = 45
	acid = 10
	wound = 25

/obj/item/clothing/head/vampire/helmet/riot
	name = "riot helmet"
	desc = "A riot helmet. Provides good protection against blunt force, but less so against projectiles."
	icon_state = "riothelm"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR
	armor_type = /datum/armor/riot_helmet
	icon = 'modular_darkpack/modules/police_equipment/icons/clothing.dmi'
	worn_icon = 'modular_darkpack/modules/police_equipment/icons/worn.dmi'
	ONFLOOR_ICON_HELPER('modular_darkpack/modules/police_equipment/icons/clothing_onfloor.dmi')
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF
	masquerade_violating = TRUE
	custom_price = 75

/datum/armor/riot_helmet
	melee = 65
	bullet = 35
	laser = 35
	energy = 35
	bomb = 30
	fire = 20
	acid = 40
	wound = 25
