/datum/action/cooldown/power/gift/stolen_moments
	name = "Stolen Moments"
	desc = "This Gift allows the Ananasi to literally steal away the last few minutes of memories from another being."
	button_icon_state = "dominate"
	click_to_activate = TRUE
	rank = 1

	gnosis_cost = 1

/datum/action/cooldown/power/gift/stolen_moments/Activate(atom/target)
	var/mob/living/living_target = astype(target)
	if(!living_target)
		return FALSE

	. = ..()

	var/datum/splat/werewolf/shifter/shifter_splat = get_shifter_splat(owner)
	var/datum/subsplat/werewolf/breed_form/breed = shifter_splat?.breed_form
	var/datum/storyteller_roll/roll_datum = new()
	roll_datum.difficulty = living_target.st_get_stat(STAT_TEMPORARY_WILLPOWER)
	roll_datum.roll_output_type = ROLL_PRIVATE_AND_TARGET
	var/roll_result = roll_datum.st_roll(owner, target, breed?.start_gnosis || 0)

	if(roll_result != ROLL_SUCCESS)
		return

	SEND_SOUND(target, sound('modular_darkpack/modules/powers/sounds/dominate.ogg', volume = 50))
	SEND_SIGNAL(target, COMSIG_ALL_MASQUERADE_REINFORCE)
	to_chat(target, span_hypnophrase("At [owner]'s touch, the last fifteen minutes of your memory are stolen away. You feel a sense of confusion and disorientation as you struggle to recall what just happened."))

/datum/action/cooldown/power/gift/breath_of_the_wyld/inspire
	name = "Inspire"
	desc = "The Ananasi instills a target with a rush of lucidity."

/datum/action/cooldown/power/gift/breath_of_the_wyld/inspire/Activate(atom/target)
	if(!isliving(target))
		return
	if(!(target in range(1, owner)))
		return

	. = ..()

	var/mob/living/victim = target
	var/mob/living/caster = owner
	var/datum/splat/werewolf/casting_splat = get_werewolf_splat(caster)
	var/roll_difficulty = get_werewolf_splat(target) ? 5 : 6
	if(!roll_datum)
		roll_datum = new()
	roll_datum.difficulty = roll_difficulty
	roll_datum.roll_output_type = ROLL_PRIVATE_AND_TARGET
	var/roll_result = roll_datum.st_roll(caster, target, casting_splat.gnosis)

	if(roll_result != ROLL_SUCCESS)
		return

	victim.apply_status_effect(/datum/status_effect/breath_of_the_wyld)

	StartCooldown()
	return TRUE

/datum/status_effect/breath_of_the_wyld
	id = "breath_of_the_wyld"
	duration = 1 SCENES

	status_type = STATUS_EFFECT_REPLACE

	alert_type = /atom/movable/screen/alert/status_effect/breath_of_the_wyld

/datum/status_effect/breath_of_the_wyld/on_apply()
	owner.st_add_stat_mod(STAT_PERCEPTION, 1, type)
	owner.st_add_stat_mod(STAT_INTELLIGENCE, 1, type)
	owner.st_add_stat_mod(STAT_WITS, 1, type)
	ADD_TRAIT(owner, TRAIT_DIFFICULT_RAGE, type)
	to_chat(owner, span_notice("You feel a sense of heightened lucidity."))
	return TRUE

/datum/status_effect/breath_of_the_wyld/on_remove()
	owner.st_remove_stat_mod(STAT_PERCEPTION, type)
	owner.st_remove_stat_mod(STAT_INTELLIGENCE, type)
	owner.st_remove_stat_mod(STAT_WITS, type)
	REMOVE_TRAIT(owner, TRAIT_DIFFICULT_RAGE, type)
	to_chat(owner, span_warning("Your mind settles, returning to it's normal state of lucidity."))

/atom/movable/screen/alert/status_effect/breath_of_the_wyld/inspire
	name = "Inspire"
	desc = "Gain an additional die to all mental checks, but suffer a penalty to rage check difficulty."
	icon = 'modular_darkpack/modules/deprecated/icons/hud/screen_alert.dmi'
	icon_state = "riddle" // TODO: get an icon for this
