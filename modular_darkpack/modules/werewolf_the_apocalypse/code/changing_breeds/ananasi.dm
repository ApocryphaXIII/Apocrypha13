#define ALTER_MOOD_ENHANCE "Enhance"
#define ALTER_MOOD_DAMPEN "Dampen"

/datum/action/cooldown/power/gift/bloodheal
	name = "Blood Heal"
	desc = "The Ananasi can heal their wounds by drawing on their own blood."
	button_icon_state = "bloodheal"
	click_to_activate = FALSE
	rank = 1
	handles_spend_resources = FALSE

/datum/action/cooldown/power/gift/bloodheal/can_afford(feedback)
	var/mob/living/human_owner = astype(owner)
	if(!human_owner)
		return ..()
	if(human_owner.bloodpool < 1)
		if(feedback)
			to_chat(owner, span_warning("You don't have enough blood to cast [src]!"))
		return FALSE
	return ..()

/datum/action/cooldown/power/gift/bloodheal/spend_resources()
	var/mob/living/human_owner = astype(owner)
	. = ..()
	if(human_owner)
		human_owner.adjust_blood_pool(-1)

/datum/action/cooldown/power/gift/bloodheal/Activate(atom/target)
	var/mob/living/human_owner = astype(owner)
	if(!human_owner)
		return FALSE
	if(!do_after(human_owner, 1 TURNS))
		return FALSE

	. = ..()

	playsound(owner, 'modular_darkpack/modules/vampire_the_masquerade/sounds/bloodhealing.ogg', 50, FALSE)
	human_owner.heal_ordered_damage(30, list(BRUTE, TOX, OXY, STAMINA))
	human_owner.heal_ordered_damage(6, list(BURN, AGGRAVATED))
	human_owner.update_damage_overlays()
	human_owner.update_health_hud()
	return TRUE

/datum/action/cooldown/power/gift/stolen_moments
	name = "Stolen Moments"
	desc = "This Gift allows the Ananasi to literally steal away the last few minutes of memories from another being."
	button_icon_state = "stolen_moments"
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

	StartCooldown()
	return TRUE

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

/datum/action/cooldown/power/gift/alter_mood
	name = "Alter Mood"
	desc = "The Wyrsta can enhance or dampen the mood of a single individual."
	button_icon_state = "alter_mood"
	click_to_activate = TRUE
	rank = 1
	gnosis_cost = 1
	var/alter_types = list(ALTER_MOOD_ENHANCE, ALTER_MOOD_DAMPEN)

/datum/action/cooldown/power/gift/alter_mood/Activate(atom/target)
	var/mob/living/living_target = astype(target)
	if(!living_target)
		return FALSE

	var/alter_type_selected = tgui_input_list(owner, "How do you want to alter the target's mood?", "Alter Mood Type Selection", alter_types, ALTER_MOOD_ENHANCE)
	if(!alter_type_selected)
		return FALSE

	. = ..()

	switch(alter_type_selected)
		if(ALTER_MOOD_ENHANCE)
			SEND_SOUND(target, sound('modular_darkpack/modules/werewolf_the_apocalypse/sounds/gifts/altermood.ogg', volume = 50))
			to_chat(living_target, span_boldnotice("An odd warmth spreads through your mind, heightening your emotional state. Any emotional highs or lows are suddenly more intense and extreme."))
		if(ALTER_MOOD_DAMPEN)
			SEND_SOUND(target, sound('modular_darkpack/modules/werewolf_the_apocalypse/sounds/gifts/altermood.ogg', volume = 50))
			to_chat(living_target, span_boldwarning("An odd numbness sets over your mind, dulling your emotional state. Any extreme emotional highs or lows are suddenly muted to a more moderate, mundane level."))

	StartCooldown()
	return TRUE

/datum/action/cooldown/power/gift/blood_of_pain
	name = "Blood of Pain"
	desc = "The Hatar turns their blood into debilitating poison."
	button_icon_state = "blood_of_pain"
	rank = 1

/datum/action/cooldown/power/gift/blood_of_pain/Grant(mob/granted_to)
	. = ..()
	ADD_TRAIT(granted_to, TRAIT_BLOOD_OF_PAIN, GIFT_TRAIT)

/datum/action/cooldown/power/gift/blood_of_pain/Activate(atom/target)
	. = ..()

	if(HAS_TRAIT_FROM(owner, TRAIT_BLOOD_OF_PAIN, GIFT_TRAIT))
		REMOVE_TRAIT(owner, TRAIT_BLOOD_OF_PAIN, GIFT_TRAIT)
		to_chat(owner, span_notice("Your blood is no longer poisonous."))
	else
		ADD_TRAIT(owner, TRAIT_BLOOD_OF_PAIN, GIFT_TRAIT)
		to_chat(owner, span_notice("Your blood is now poisonous."))

/atom/movable/screen/alert/status_effect/blood_of_pain
	name = "Blood of Pain"
	desc = "The blood you have consumed is causing you horrible agony!"
	icon = 'modular_darkpack/modules/deprecated/icons/hud/screen_alert.dmi'
	icon_state = "default"

/datum/status_effect/blood_of_pain
	duration = 3 MINUTES
	tick_interval = 5 SECONDS
	status_type = STATUS_EFFECT_UNIQUE
	alert_type = /atom/movable/screen/alert/status_effect/blood_of_pain

/datum/status_effect/blood_of_pain/tick(seconds_between_ticks)
	var/datum/storyteller_roll/stamina_roll = new()
	stamina_roll.applicable_stats = list(STAT_STAMINA)
	stamina_roll.difficulty = 6
	stamina_roll.roll_output_type = ROLL_PRIVATE
	stamina_roll.spammy_roll = TRUE
	if(stamina_roll.st_roll(owner, owner) != ROLL_SUCCESS)
		to_chat(owner, span_danger("THE AGONY IS UNBEARABLE!"))
		SEND_SOUND(owner, sound('modular_darkpack/modules/werewolf_the_apocalypse/sounds/gifts/blood_of_pain.ogg', volume = 75))
		owner.Stun(5 SECONDS)
	else
		SEND_SOUND(owner, sound('modular_darkpack/modules/werewolf_the_apocalypse/sounds/gifts/blood_of_pain_pass.ogg', volume = 75))

/datum/status_effect/blood_of_pain/on_apply()
	to_chat(owner, span_danger("You feel horrible after drinking that blood..."))
	return TRUE

/datum/status_effect/blood_of_pain/on_remove()
	to_chat(owner, span_danger("The agonizing pain subsides."))

/datum/action/cooldown/power/gift/blood_of_pain/Remove(mob/removed_from)
	. = ..()
	REMOVE_TRAIT(removed_from, TRAIT_BLOOD_OF_PAIN, GIFT_TRAIT)

/datum/action/cooldown/power/gift/beneath_notice
	name = "Beneath Notice"
	desc = "The Tenere can make an object blend into the surrounding area."
	button_icon_state = "beneath_notice"
	click_to_activate = TRUE
	rank = 1
	gnosis_cost = 1

	var/hide_duration = 180 MINUTES
	var/alpha_reduction = 220
	var/list/hidden_targets = list()

/datum/action/cooldown/power/gift/beneath_notice/Activate(atom/movable/target)
	if(!isobj(target) && !isitem(target))
		return FALSE
	if(hidden_targets[target])
		remove_beneath_notice(target)
		to_chat(owner, span_warning("[target] is revealed!"))
		StartCooldown()
		return TRUE

	. = ..()

	target.alpha = max(target.alpha - alpha_reduction, 0)
	ADD_TRAIT(target, TRAIT_EXAMINE_SKIP, GIFT_TRAIT)

	if(isitem(target) && ismob(target.loc))
		var/obj/item/worn_item = target
		var/mob/wearer = target.loc
		wearer.update_clothing(worn_item.slot_flags)

	var/list/existing = list()
	hidden_targets[target] = existing
	RegisterSignal(target, COMSIG_QDELETING, PROC_REF(on_target_deleted))

	existing["timer"] = addtimer(CALLBACK(src, PROC_REF(remove_beneath_notice), target), hide_duration, TIMER_STOPPABLE)

	to_chat(owner, span_info("[target] is now hidden from sight."))
	StartCooldown()
	return TRUE

/datum/action/cooldown/power/gift/beneath_notice/proc/remove_beneath_notice(atom/movable/target)
	var/list/existing = hidden_targets[target]
	if(!existing)
		return
	hidden_targets -= target
	UnregisterSignal(target, COMSIG_QDELETING)

	target.alpha = min(target.alpha + alpha_reduction, 255)
	REMOVE_TRAIT(target, TRAIT_EXAMINE_SKIP, GIFT_TRAIT)

	if(isitem(target) && ismob(target.loc))
		var/obj/item/worn_item = target
		var/mob/wearer = target.loc
		wearer.update_clothing(worn_item.slot_flags)

/datum/action/cooldown/power/gift/beneath_notice/proc/on_target_deleted(atom/movable/target)
	SIGNAL_HANDLER
	var/list/existing = hidden_targets[target]
	if(!existing)
		return

	if(isitem(target) && ismob(target.loc))
		var/obj/item/worn_item = target
		var/mob/wearer = target.loc
		wearer.update_clothing(worn_item.slot_flags)

	hidden_targets -= target
	deltimer(existing["timer"])
	REMOVE_TRAIT(target, TRAIT_EXAMINE_SKIP, GIFT_TRAIT)

#undef ALTER_MOOD_ENHANCE
#undef ALTER_MOOD_DAMPEN


