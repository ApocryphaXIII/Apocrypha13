/area/vtm/interior/penumbra/shadowlands
	name = "Shadowlands"
	/// Chance for each open turf to get a persistent fog patch, like the sewers
	var/fog_chance = 25

/area/vtm/interior/penumbra/shadowlands/LateInitialize()
	. = ..()
	for(var/turf/open/open_turf in src)
		if(prob(fog_chance))
			new /obj/effect/realistic_fog/dense(open_turf)

/// Shadowlands area reserved for sheltered spots
/area/vtm/interior/penumbra/shadowlands/sheltered
	name = "Shadowlands (Sheltered)"
