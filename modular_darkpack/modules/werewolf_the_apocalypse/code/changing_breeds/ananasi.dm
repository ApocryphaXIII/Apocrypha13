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
