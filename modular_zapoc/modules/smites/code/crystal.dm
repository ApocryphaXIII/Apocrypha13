/obj/smite_crystal
	name = "crystal"
	desc = "What the hell are you talkin' about? You've added nothing to the conversation- Get in the- Get in the crystal. Sorry, buddy, get in the crystal. HAH hahahahahahaha. We're going to put you in the crystal, you're gonna be in the crystal for a minute; It's gonna feel like one week. It's only one week, man! Some of the people are in the crystal for like, a century, okay? You're going in- the minute is gonna feel like a week so you have some time to think about what you've done. And then you're going to come out of the crystal."
	icon = 'icons/effects/64x64.dmi'
	icon_state = "curse"
	pixel_x = -16
	pixel_y = -16
	color = "#ba52ba"

/obj/smite_crystal/Initialize(mapload)
	. = ..()
	add_overlay(image(icon='modular_zapoc/modules/smites/icons/man_crystal.dmi',icon_state="crystal", pixel_x = 16, pixel_y = 16))

/// To be deployed after typos and blunders.
/datum/smite/crystal
	name = "the crystal"

	var/charge
	var/sentence_choice
	var/jailtime // Timer
	var/felt_time // What did it feel like?
	var/sound_choice
	var/quick_crystal
	var/abort


/datum/smite/crystal/configure(client/user)
	quick_crystal = (alert(user, "Skip setup?", "the crystal", "Yes", "No", "Cancel"))
	if(quick_crystal == "No")
		charge = input(user, "What are they charged with?") as null|text // Displayed to victim
		sentence_choice = (alert(user, "How long will they spend in the crystal?", "the crystal", "Just a second", "Only one week", "Like a century"))
		sound_choice = (alert(user, "Play audio?", "the crystal", "Target only", "Nearby", "No"))
		abort = (alert(user, "Charge: [charge]. Sentence: [sentence_choice]. Audio: [sound_choice]. Confirm?", "the crystal", "Go", "Cancel"))
	else if(quick_crystal == "Yes")
		charge = "ADDED NOTHING"
		sentence_choice = "Just a second"
		sound_choice = "Nearby"
		abort = "Go"
	else if(quick_crystal == "Cancel")
		abort = "Cancel"


/datum/smite/crystal/effect(client/user, mob/living/target)
	if(abort == "Go")
		var/obj/smite_crystal/crystal = new /obj/smite_crystal(get_turf(target))
		target.forceMove(crystal)
		target.Stun(jailtime)

		to_chat(target, span_phobia(("YOUR CHARGE: [span_colossus("[charge]")]")))

		switch(sentence_choice)
			if("Just a second")
				jailtime = 30 SECONDS
				felt_time = span_notice("You spend three hours in the crystal, but only a second has passed back in reality.")
			if("Only one week")
				jailtime = 1 MINUTES
				felt_time = span_notice("You spend a week in the crystal, but only a minute has passed back in reality.")
			if("Like a century") // Teleports target to error room
				jailtime = 30 SECONDS
				felt_time = span_notice("You spend a century in the crystal, but only two minutes have passed back in reality. Wait, what is this place?")
				target.move_to_error_room()

		switch(sound_choice)
			if("Target only")
				target.playsound_local(get_turf(target), 'modular_zapoc/modules/smites/sound/crystal.ogg', 75)
				to_chat(target, span_purple("What the hell are you talkin' about? You've added nothing to the conversation- Get in the- Get in the crystal. Sorry, buddy, get in the crystal. HAH hahahahahahaha. We're going to put you in the crystal, you're gonna be in the crystal for a minute; It's gonna feel like one week. It's only one week, man! Some of the people are in the crystal for like, a century, okay? You're going in- the minute is gonna feel like a week so you have some time to think about what you've done. And then you're going to come out of the crystal."))

			if("Nearby")
				playsound(target, 'modular_zapoc/modules/smites/sound/crystal.ogg', 75)
				to_chat(target, span_purple("What the hell are you talkin' about? You've added nothing to the conversation- Get in the- Get in the crystal. Sorry, buddy, get in the crystal. HAH hahahahahahaha. We're going to put you in the crystal, you're gonna be in the crystal for a minute; It's gonna feel like one week. It's only one week, man! Some of the people are in the crystal for like, a century, okay? You're going in- the minute is gonna feel like a week so you have some time to think about what you've done. And then you're going to come out of the crystal."))

			if("No")
				to_chat(target, span_purple("What the hell are you talkin' about? You've added nothing to the conversation- Get in the- Get in the crystal. Sorry, buddy, get in the crystal. HAH hahahahahahaha. We're going to put you in the crystal, you're gonna be in the crystal for a minute; It's gonna feel like one week. It's only one week, man! Some of the people are in the crystal for like, a century, okay? You're going in- the minute is gonna feel like a week so you have some time to think about what you've done. And then you're going to come out of the crystal."))

		crystal.freedom_timer(jailtime, felt_time)
		var/msg = "[key_name(target)] was put in the crystal by [key_name(user)] for [LOWER_TEXT(sentence_choice)]. They are charged with: [charge]."
		message_admins(msg)
		log_admin(msg)
	else
		var/msg = "[key_name(user)] cancelled the crystal before execution."
		message_admins(msg)
		log_admin(msg)

/obj/smite_crystal/attack_hand(mob/user)
	if(!(user in contents))
		var/sacrifice_mob = tgui_alert(user, "Get in the crystal?", "the crystal", list("Yes", "No"))

		switch(sacrifice_mob)
			if("Yes")
				user.forceMove(src)
				user.visible_message("<span class='notice'>[user] gets in [src].</span>", \
					"<span class='notice'>You get in [src].</span>")
			if("No")
				user.visible_message("<span class='notice'>[user] thinks better of getting in [src].</span>", \
				"<span class='notice'>You think better of getting in [src].</span>")
	else
		to_chat(user, span_notice("You bang on the walls of the crystal."))


/obj/smite_crystal/attackby(obj/item/I, mob/user)
	var/sacrifice = (alert(user, "Place [I] to the crystal? You might not get it back!", "the crystal", "Yes", "No"))

	switch(sacrifice)
		if("Yes")
			I.forceMove(src)
			user.visible_message("<span class='notice'>[user] places [I] into [src].</span>", \
			"<span class='notice'>You place [I] into [src].</span>")
		if("No")
			user.visible_message("<span class='notice'>[user] thinks better of placing [I] into [src].</span>", \
				"<span class='notice'>You think better of placing [I] into [src].</span>")


/obj/smite_crystal/proc/freedom_timer(duration, freedom_text)
	addtimer(CALLBACK(src, PROC_REF(freedom), freedom_text), duration)


/obj/smite_crystal/proc/freedom(freedom_text)
	for(var/mob/i in contents)
		i.forceMove(get_turf(src))
		to_chat(i, "[freedom_text]")
	for(var/obj/o in contents)
		if(prob(25))
			o.forceMove(get_turf(src))
	animate(src, alpha = 0, time = 1 SECONDS)
	spawn(1 SECONDS)
		qdel(src)
