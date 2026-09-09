/datum/splat/werewolf/proc/examine_other_human(mob/living/carbon/examined)
	var/datum/splat/werewolf/shifter/garou/wolp_splat = get_garou_splat(examined)
	var/datum/splat/werewolf/spiber_splat = get_ananasi_splat(examined)
	if(wolp_splat)
		var/list/honor_flavor = list("claim to good conduct", "claim to honor", "claim to chivalry")
		var/list/wisdom_flavor = list("claim to insight", "claim to wisdom", "claim to sagacity")
		var/list/glory_flavor = list("claim to bravery", "claim to valor", "claim to glory")

		var/same_tribe = FALSE
		var/is_known = FALSE

		if(!tribe)
			return
		if(!wolp_splat.tribe || !wolp_splat.auspice)
			return
		if(tribe.name == wolp_splat.tribe.name)
			same_tribe = TRUE

		switch(wolp_splat.renown_rank)
			if(RANK_CUB to RANK_FOSTERN)
				if(same_tribe)
					. += "<b>You know [examined.p_them()] as \a [fera_rank_name(wolp_splat.renown_rank, wolp_splat.id)] of the [wolp_splat.tribe.name].</b>"
					is_known = TRUE
			if(RANK_ADREN to RANK_LEGEND)
				. += "<b>You know [examined.p_them()] as \a [fera_rank_name(wolp_splat.renown_rank, wolp_splat.id)] [wolp_splat.auspice.name] of the [wolp_splat.tribe.name].</b>"
				is_known = TRUE

		if(is_known)
			switch(wolp_splat.renown[RENOWN_HONOR])
				if(4,5,6)
					. += "<i>In the local Garou, you have heard of [examined.p_their(TRUE)] [honor_flavor[1]].</i>"
				if(7,8,9)
					. += "<i>In the local Garou, you have heard of [examined.p_their(TRUE)] [honor_flavor[2]].</i>"
				if(10)
					. += "<i>In the local Garou, you have heard of [examined.p_their(TRUE)] [honor_flavor[3]].</i>"
			switch(wolp_splat.renown[RENOWN_WISDOM])
				if(4,5,6)
					. += "<i>In the local Garou, you have heard of [examined.p_their(TRUE)] [wisdom_flavor[1]].</i>"
				if(7,8,9)
					. += "<i>In the local Garou, you have heard of [examined.p_their(TRUE)] [wisdom_flavor[2]].</i>"
				if(10)
					. += "<i>In the local Garou, you have heard of [examined.p_their(TRUE)] [wisdom_flavor[3]].</i>"
			switch(wolp_splat.renown[RENOWN_GLORY])
				if(4,5,6)
					. += "<i>In the local Garou, you have heard of [examined.p_their(TRUE)] [glory_flavor[1]].</i>"
				if(7,8,9)
					. += "<i>In the local Garou, you have heard of [examined.p_their(TRUE)] [glory_flavor[2]].</i>"
				if(10)
					. += "<i>In the local Garou, you have heard of [examined.p_their(TRUE)] [glory_flavor[3]].</i>"

	// Wyrmling Kinship gift for Hatar Ananasi
	if(HAS_TRAIT(examined, TRAIT_WYRMLING_KINSHIP) && tribe?.name == TRIBE_BLACK_SPIRAL_DANCERS)
		. += span_boldnicegreen("<i>The Wyrm's presence clings to [examined.p_them()]. You recognize [examined.p_them()] as one of your own.</i>")

	// For now, only one pattern flavor on examine. When Renown is reworked, this will be expanded to describe more complex patterns based on rank.
	if(spiber_splat && istype(src, /datum/splat/werewolf/shifter/ananasi))
		var/list/tenere_flavor = list("structure and order", "immaculately weaved patterns")
		var/list/hatar_flavor = list("death and decay", "indiscriminate destruction")
		var/list/kumoti_flavor = list("growth and change", "chaos and life unbidden")

		switch(spiber_splat.tribe?.name)
			if(TRIBE_SECEAN, TRIBE_PLICARE, TRIBE_GADERIN)
				. += "<i>The patterns on [examined.p_their(TRUE)] skin depict [tenere_flavor[1]].</i>"
			if(TRIBE_AGERE, TRIBE_ANOMIA, TRIBE_MALUM)
				. += "<i>The patterns on [examined.p_their(TRUE)] skin depict [hatar_flavor[1]].</i>"
			if(TRIBE_KAR, TRIBE_AMARI_ALIQUID, TRIBE_CHYMOS)
				. += "<i>The patterns on [examined.p_their(TRUE)] skin depict [kumoti_flavor[1]].</i>"

