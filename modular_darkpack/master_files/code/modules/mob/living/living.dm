/mob/living
	COOLDOWN_DECLARE(masquerade_timer)

/mob/living/Initialize(mapload)
	. = ..()
	storyteller_stat_holder = new() // STORYTELLER_STATS
