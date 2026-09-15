#define ALTER_MOOD_ENHANCE "Enhance"
#define ALTER_MOOD_DAMPEN "Dampen"
#define ANANASI_COCOON_TRAIT "ananasi_cocoon"

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

/datum/action/cooldown/power/gift/spin_web
	name = "Spin Web"
	desc = "The Ananasi in Pithus form can break down stored blood and spin very strong, very durable webs."
	button_icon_state = "spin_web"
	click_to_activate = FALSE
	rank = 1
	handles_spend_resources = FALSE

	// /tg/ giant spider web actions! minus reflector, spikes, and effigy bc they don't really fit
	var/static/list/web_action_choices = list(
		/datum/action/cooldown/mob_cooldown/lay_web,
		/datum/action/cooldown/mob_cooldown/lay_web/solid_web,
		/datum/action/cooldown/mob_cooldown/lay_web/web_passage,
		/datum/action/cooldown/mob_cooldown/lay_web/sticky_web,
		/datum/action/cooldown/mob_cooldown/wrap/ananasi_cocoon,
	)

/datum/action/cooldown/power/gift/spin_web/can_afford(feedback)
	var/mob/living/human_owner = astype(owner)
	if(!human_owner)
		return ..()
	if(human_owner.bloodpool < 1)
		if(feedback)
			to_chat(owner, span_warning("You don't have enough blood to cast [src]!"))
		return FALSE
	return ..()

/datum/action/cooldown/power/gift/spin_web/spend_resources()
	var/mob/living/human_owner = astype(owner)
	. = ..()
	if(human_owner)
		human_owner.adjust_blood_pool(-1)

// only pithus form can spin webs. crawlerling can too but not to any significant effect
/datum/action/cooldown/power/gift/spin_web/proc/in_valid_form(mob/living/carbon/human/human_owner)
	var/datum/species/human/shifter/shifter_species = human_owner.dna?.species
	if(!istype(shifter_species))
		return FALSE
	return (shifter_species.id == SPECIES_FERA_DIRE)

/datum/action/cooldown/power/gift/spin_web/Activate(atom/target)
	var/mob/living/carbon/human/human_owner = astype(owner)
	if(!human_owner)
		return FALSE
	if(!in_valid_form(human_owner))
		to_chat(owner, span_warning("You must be in Pithus form to spin webs!"))
		return FALSE

	var/list/choices = list()
	var/list/name_to_type = list()
	for(var/datum/action/cooldown/mob_cooldown/web_action_type as anything in web_action_choices)
		var/datum/radial_menu_choice/option = new
		option.image = image(icon = initial(web_action_type.button_icon), icon_state = initial(web_action_type.button_icon_state))
		option.info = span_boldnotice(initial(web_action_type.name))
		name_to_type[initial(web_action_type.name)] = web_action_type
		choices[initial(web_action_type.name)] = option

	var/picked_name = show_radial_menu(human_owner, human_owner, choices, tooltips = TRUE)
	var/chosen_type = name_to_type[picked_name]
	if(!chosen_type)
		return FALSE

	. = ..()

	var/datum/action/cooldown/mob_cooldown/action_instance = new chosen_type()
	action_instance.owner_has_control = FALSE
	action_instance.Grant(human_owner)
	action_instance.Trigger(human_owner, NONE)
	if(!action_instance.click_to_activate)
		action_instance.Remove(human_owner)
		qdel(action_instance)
	return TRUE

// the people demanded cocoon wrapping
/datum/action/cooldown/mob_cooldown/wrap/ananasi_cocoon
	name = "Cocoon"
	desc = "Wrap a nearby target in a cocoon, restraining them until they can force their way free. While restrained, you may drain them of their blood."

/datum/action/cooldown/mob_cooldown/wrap/ananasi_cocoon/wrap_target(mob/living/to_wrap)
	var/mob/living/cocoon_owner = owner
	var/obj/structure/spider/cocoon/ananasi/casing = new(to_wrap.loc)
	to_wrap.forceMove(casing)
	ADD_TRAIT(to_wrap, TRAIT_HANDS_BLOCKED, ANANASI_COCOON_TRAIT)
	if(isliving(to_wrap) && (to_wrap.mob_biotypes & MOB_HUMANOID))
		casing.icon_state = pick("cocoon_large1", "cocoon_large2", "cocoon_large3")
	else
		casing.icon_state = pick("cocoon1", "cocoon2", "cocoon3")
	cocoon_owner?.visible_message(
		span_notice("[cocoon_owner] wraps [to_wrap] tightly in silk!"),
		span_notice("You finish wrapping [to_wrap] into a cocoon."),
	)

/datum/action/cooldown/mob_cooldown/wrap/ananasi_cocoon/cocoon(atom/movable/to_wrap)
	var/mob/living/cocoon_owner = owner
	. = ..()
	Remove(cocoon_owner)
	qdel(src)

/obj/structure/spider/cocoon/ananasi
	name = "silken cocoon"
	desc = "A cocoon of dense spider silk. Something is bound within, struggling weakly."

/obj/structure/spider/cocoon/ananasi/Destroy()
	for(var/mob/living/trapped_mob in contents)
		REMOVE_TRAIT(trapped_mob, TRAIT_HANDS_BLOCKED, ANANASI_COCOON_TRAIT)
	return ..()

// per ananasi breedbook, webs resist Strength rolls with an effective Strength of 9
/obj/structure/spider/cocoon/ananasi/container_resist_act(mob/living/user)
	user.changeNext_move(CLICK_CD_BREAKOUT)
	user.last_special = world.time + CLICK_CD_BREAKOUT
	user.visible_message(
		span_warning("[user] strains against the webbing, trying to break free!"),
		span_notice("You strain against the sticky bonds..."),
	)
	var/datum/storyteller_roll/escape_roll = new()
	escape_roll.applicable_stats = list(STAT_STRENGTH)
	escape_roll.difficulty = 9
	escape_roll.roll_output_type = ROLL_PRIVATE

	if(QDELETED(src) || user.loc != src)
		return
	if(escape_roll.st_roll(user, user) != ROLL_SUCCESS)
		to_chat(user, span_warning("You fail to break free of the webbing!"))
		user.Stun(6 SECONDS)
		return

	REMOVE_TRAIT(user, TRAIT_HANDS_BLOCKED, ANANASI_COCOON_TRAIT)
	user.forceMove(get_turf(src))
	qdel(src)

/obj/structure/spider/cocoon/ananasi/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	var/mob/living/living_user = astype(user)
	if(living_user?.combat_mode)
		var/datum/storyteller_roll/tear_roll = new()
		tear_roll.applicable_stats = list(STAT_STRENGTH)
		tear_roll.difficulty = 9
		tear_roll.roll_output_type = ROLL_PUBLIC
		living_user.visible_message(
			span_danger("[living_user] starts tearing [src] apart!"),
			span_danger("You start tearing [src] apart!"),
		)
		if(!do_after(living_user, 3 SECONDS, target = src))
			return
		if(QDELETED(src))
			return
		if(tear_roll.st_roll(user, user) != ROLL_SUCCESS)
			to_chat(user, span_warning("You fail to tear through the silk!"))
			return
		living_user.visible_message(
			span_danger("[living_user] rips [src] to shreds!"),
			span_danger("You rip [src] to shreds!"),
		)
		qdel(src)
		return
	var/mob/living/attacker = astype(user)
	if(!attacker || !get_ananasi_splat(attacker))
		return
	var/mob/living/victim = locate(/mob/living) in contents
	if(!victim)
		return
	if(get_kindred_splat(victim))
		to_chat(attacker, span_warning("[victim]'s blood would be toxic to you!"))
		return
	if(victim.blood_volume <= 0)
		to_chat(attacker, span_warning("[victim] has no more blood left to drain!"))
		return
	playsound(src, 'modular_darkpack/modules/blood_drinking/sounds/drinkblood1.ogg', 50, TRUE)
	attacker.visible_message(
		span_danger("[attacker] sinks its fangs into [victim] through the cocoon!"),
		span_danger("You begin drinking the blood from [victim]!"),
	)
	if(!do_after(attacker, 6 SECONDS, target = src))
		return
	if(QDELETED(src) || QDELETED(victim) || (victim.loc != src))
		return
	attacker.adjust_blood_pool(2)
	victim.adjust_blood_pool(-2)
	victim.adjust_blood_volume(-112)
	log_combat(attacker, victim, "drained the blood from")
	to_chat(attacker, span_notice("You finish drinking [victim]'s blood."))

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
	log_combat(owner, target, "used Stolen Moments on")

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
			log_combat(owner, target, "used Alter Mood (Enhance) on")
		if(ALTER_MOOD_DAMPEN)
			SEND_SOUND(target, sound('modular_darkpack/modules/werewolf_the_apocalypse/sounds/gifts/altermood.ogg', volume = 50))
			to_chat(living_target, span_boldwarning("An odd numbness sets over your mind, dulling your emotional state. Any extreme emotional highs or lows are suddenly muted to a more moderate, mundane level."))
			log_combat(owner, target, "used Alter Mood (Dampen) on")

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
#undef ANANASI_COCOON_TRAIT


