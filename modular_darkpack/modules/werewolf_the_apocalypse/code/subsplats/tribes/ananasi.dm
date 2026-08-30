/datum/subsplat/werewolf/tribe/ananasi
	abstract_type = /datum/subsplat/werewolf/tribe/ananasi
	fera_restriction = SPLAT_ANANASI

/datum/subsplat/werewolf/tribe/ananasi/secean
	name = TRIBE_SECEAN
	desc = "Tenere Myrmidon; Warriors of the Weaver, seeking to understand the nature of the universe to better serve the Mother-Queen. The Secean are explorers and seekers of knowledge unbidden.\nGifts: \n Open Seal - Open nearly any sort of closed or locked physical device. Roll Gnosis against the area's gauntlet rating to unlock a locked object. \n Beneath Notice - Make an object blend into the surrounding area. Spend 1 Gnosis to hide an object almost completely from sight. Cast on the object again to unhide. \n Groom -  No matter the circumstances, the Tenere always looks their best. The character is permanently immune to being bloodied."
	gifts_provided = list(
		/datum/action/cooldown/power/gift/open_seal,
		/datum/action/cooldown/power/gift/beneath_notice,
	)
	tribe_traits = list(TRAIT_ALWAYS_CLEAN)

/datum/subsplat/werewolf/tribe/ananasi/plicare
	name = TRIBE_PLICARE
	desc = "Tenere Viskr; Mystics of the Weaver, masters of precise order and control. The Plicare are staunch perfectionists, maintaining and leveraging order and structure to achieve their goals. \nGifts: \n Mindspeak - By invoking the power of waking dreams, place characters into silent communion. Transmit a message to any Ananasi belonging to the same cabal. \n Beneath Notice - Make an object blend into the surrounding area. Spend 1 Gnosis to hide an object almost completely from sight. Cast on the object again to unhide. \n  Groom -  No matter the circumstances, the Tenere always looks their best. The character is permanently immune to being bloodied."
	gifts_provided = list(
		/datum/action/cooldown/power/gift/mindspeak,
		/datum/action/cooldown/power/gift/beneath_notice,
	)
	tribe_traits = list(TRAIT_ALWAYS_CLEAN)

/datum/subsplat/werewolf/tribe/ananasi/gaderin
	name = TRIBE_GADERIN
	desc = "Tenere Wyrsta; Questioners of the Weaver, challengers of strict order. The Gaderin are obsessive collectors, seeking to grow the Mother-Queen's understanding of the world from her prison in Malfeas. \nGifts: \n Alter Mood - The Wyrsta can enhance or dampen the mood of a single individual, making that person elated rather than just happy, or muting utter despair into simple sadness. Spend 1 Gnosis enhance or dampen the mood of a target. \n Beneath Notice - Make an object blend into the surrounding area. Spend 1 Gnosis to hide an object almost completely from sight. Cast on the object again to unhide. \n Groom -  No matter the circumstances, the Tenere always looks their best. The character is permanently immune to being bloodied."
	gifts_provided = list(
		/datum/action/cooldown/power/gift/alter_mood,
		/datum/action/cooldown/power/gift/beneath_notice,
	)
	tribe_traits = list(TRAIT_ALWAYS_CLEAN)

/datum/subsplat/werewolf/tribe/ananasi/agere
	name = TRIBE_AGERE
	desc = "Hatar Myrmidon; Warriors of the Wyrm, fickle forces of entropy and destruction. The Agere are swift and deadly, moving wherever Ananasa wills them to strike and delivering the Wyrm's own destruction to their enemies. \nGifts: \n Open Seal - Open nearly any sort of closed or locked physical device. Roll Gnosis against the area's gauntlet rating to unlock a locked object. \n Blood of Pain - The Hatar turns their blood into debilitating poison. Any who drink your blood will fall helplessly ill, necessitating a Stamina roll (difficulty 6) to act each turn for the rest of the scene. Starts activated. \n Wyrmling Kinship - The Hatar can convince Wyrm-creatures that they are an ally or someone of no importance. Black Spiral Dancers and Fomori will recognize you as an ally."
	gifts_provided = list(
		/datum/action/cooldown/power/gift/open_seal,
		/datum/action/cooldown/power/gift/blood_of_pain,
	)
	tribe_traits = list(TRAIT_WYRMLING_KINSHIP)

/datum/subsplat/werewolf/tribe/ananasi/anomia
	name = TRIBE_ANOMIA
	desc = "Hatar Viskr; Mystics of the Wyrm, master manipulators of mortal will. The Anomia are cunning controllers of fate, pulling strings and leaving the death and destruction to those most skilled in delivering it: Humanity. \nGifts: \n Mindspeak - By invoking the power of waking dreams, place characters into silent communion. Transmit a message to any Ananasi belonging to the same cabal. \n Blood of Pain - The Hatar turns their blood into debilitating poison. Any who drink your blood will fall helplessly ill, necessitating a Stamina roll (difficulty 6) to act each turn for the rest of the scene. Starts activated. \n Wyrmling Kinship - The Hatar can convince Wyrm-creatures that they are an ally or someone of no importance. Black Spiral Dancers and Fomori will recognize you as an ally."
	gifts_provided = list(
		/datum/action/cooldown/power/gift/mindspeak,
		/datum/action/cooldown/power/gift/blood_of_pain,
	)
	tribe_traits = list(TRAIT_WYRMLING_KINSHIP)

/datum/subsplat/werewolf/tribe/ananasi/malum
	name = TRIBE_MALUM
	desc = "Hatar Wyrsta; Questioners of the Wyrm, seeking to restore the Wyrm's true and original purpose. The Malum are self-serving and unpredictable, rejecting the Wyrm's new role as the Corruptor and serving instead as agents of the Wyrm's true face: the Destroyer. \nGifts: \n Alter Mood - The Wyrsta can enhance or dampen the mood of a single individual, making that person elated rather than just happy, or muting utter despair into simple sadness. Spend 1 Gnosis enhance or dampen the mood of a target. \n Blood of Pain - The Hatar turns their blood into debilitating poison. Any who drink your blood will fall helplessly ill, necessitating a Stamina roll (difficulty 6) to act each turn for the rest of the scene. Starts activated. \n Wyrmling Kinship - The Hatar can convince Wyrm-creatures that they are an ally or someone of no importance. Black Spiral Dancers and Fomori will recognize you as an ally."
	gifts_provided = list(
		/datum/action/cooldown/power/gift/alter_mood,
		/datum/action/cooldown/power/gift/blood_of_pain,
	)
	tribe_traits = list(TRAIT_WYRMLING_KINSHIP)

/datum/subsplat/werewolf/tribe/ananasi/kar
	name = TRIBE_KAR
	desc = "Kumoti Myrmidon; Warriors of the Wyld, forces of change and creation. The Kar protect the Wyld through minor but otherwise direct acts of sabotage against the Weaver and the Wyrm, seeking to expand the Wyld's influence. \nGifts: \n Open Seal - Open nearly any sort of closed or locked physical device. Roll Gnosis against the area's gauntlet rating to unlock a locked object. \n Inspire - As Breath of the Wyld: Instill a feeling of vitality and life in a living being. Spend 1 Gnosis to increase a target's Perception, Intelligence, and Wits by 1; and increase the difficulty of any Rage rolls by 1. \n Mother's Touch - Heal the wounds of any living creature, aggravated or otherwise, simply by laying hands over the affected area. Roll Intelligence and Empathy (Difficulty 5) to determine the effectiveness of the healing."
	gifts_provided = list(
		/datum/action/cooldown/power/gift/open_seal,
		/datum/action/cooldown/power/gift/breath_of_the_wyld/inspire,
		/datum/action/cooldown/power/gift/mothers_touch,
	)

/datum/subsplat/werewolf/tribe/ananasi/amarialiquid
	name = TRIBE_AMARI_ALIQUID
	desc = "Kumoti Viskr; Mystics of the Wyld, acting on whim and instinct. The Amari Aliquid are gentle and persistent, making change through constant motion for better or worse. \nGifts: \n Mindspeak - By invoking the power of waking dreams, place characters into silent communion. Transmit a message to any Ananasi belonging to the same cabal. \n Inspire - As Breath of the Wyld: Instill a feeling of vitality and life in a living being. Spend 1 Gnosis to increase a target's Perception, Intelligence, and Wits by 1; and increase the difficulty of any Rage rolls by 1. \n Mother's Touch - Heal the wounds of any living creature, aggravated or otherwise, simply by laying hands over the affected area. Roll Intelligence and Empathy (Difficulty 5) to determine the effectiveness of the healing."
	gifts_provided = list(
		/datum/action/cooldown/power/gift/mindspeak,
		/datum/action/cooldown/power/gift/breath_of_the_wyld/inspire,
		/datum/action/cooldown/power/gift/mothers_touch,
	)

/datum/subsplat/werewolf/tribe/ananasi/chymos
	name = TRIBE_CHYMOS
	desc = "Kumoti Wyrsta; Questioners of the Wyld, careful observers of the world and the minions of each Triatic spirit. The Chymos are patient and calculating, seeking to manipulate and disrupt imbalance in the world to restore Symmetry. \nGifts: \n Alter Mood - The Wyrsta can enhance or dampen the mood of a single individual, making that person elated rather than just happy, or muting utter despair into simple sadness. Spend 1 Gnosis enhance or dampen the mood of a target. \n Inspire - As Breath of the Wyld: Instill a feeling of vitality and life in a living being. Spend 1 Gnosis to increase a target's Perception, Intelligence, and Wits by 1; and increase the difficulty of any Rage rolls by 1. \n Mother's Touch - Heal the wounds of any living creature, aggravated or otherwise, simply by laying hands over the affected area. Roll Intelligence and Empathy (Difficulty 5) to determine the effectiveness of the healing."
	gifts_provided = list(
		/datum/action/cooldown/power/gift/alter_mood,
		/datum/action/cooldown/power/gift/breath_of_the_wyld/inspire,
		/datum/action/cooldown/power/gift/mothers_touch,
	)

