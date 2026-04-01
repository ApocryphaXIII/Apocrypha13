/obj/item/seeds/soya/senzu
	name = "senzu bean seed pack"
	desc = "These seeds grow into senzu bean stalks."
	species = "senzu bean"
	plantname = "Senzu Bean Plants"
	product = /obj/item/food/grown/senzu
	potency = 50
	yield = -1
	mutatelist = null
	genes = list(/datum/plant_gene/trait/one_bite)
	reagents_add = list(/datum/reagent/medicine/adminordrazine = 0.2, /datum/reagent/consumable/nutriment/vitamin = 0.01, /datum/reagent/consumable/nutriment = 0.02)
	rarity = 100

/obj/item/food/grown/senzu
	seed = /obj/item/seeds/soya/senzu
	name = "senzu bean"
	desc = "It's pretty bland, but oh the possibilities..."
	icon = 'modular_darkpack/modules/dragon_ball/icons/beans.dmi'
	ONFLOOR_ICON_HELPER('modular_darkpack/modules/dragon_ball/icons/beans_onfloor.dmi')
	icon_state = "senzu"
	foodtypes = VEGETABLES
	tastes = list("fish" = 1)
	wine_power = 40
