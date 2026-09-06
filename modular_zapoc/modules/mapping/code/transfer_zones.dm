/obj/transfer_point_vamp/forest
	name = "forest transfer point"
	id = "forest_1"

/obj/transfer_point_vamp/forest/Initialize(mapload)
	. = ..()
	if(mapload)
		return INITIALIZE_HINT_LATELOAD

/obj/transfer_point_vamp/forest/LateInitialize()
	if(src in GLOB.unallocted_transfer_points)
		qdel(src)

/obj/transfer_point_vamp/forest/two
	id = "forest_2"

/obj/transfer_point_vamp/forest/three
	id = "forest_3"

/obj/transfer_point_vamp/forest/four
	id = "forest_4"

/obj/transfer_point_vamp/forest/north // For maps that enter the forest from the south
	id = "forest_north_1"

/obj/transfer_point_vamp/forest/north/two
	id = "forest_north_2"

/obj/transfer_point_vamp/forest/north/three
	id = "forest_north_3"

/obj/transfer_point_vamp/forest/north/four
	id = "forest_north_4"

/obj/transfer_point_vamp/forest/caern
	id = "caern_1"

/obj/transfer_point_vamp/forest/caern/two
	id = "caern_2"

/obj/transfer_point_vamp/forest/caern/three
	id = "caern_3"

/obj/transfer_point_vamp/forest/caern/four
	id = "caern_4"

/obj/transfer_point_vamp/forest/pentex
	id = "pentex_logging"
	var/locked = TRUE

/obj/transfer_point_vamp/forest/pentex/Initialize(mapload) // super snowflake janky solution, i'll make an actually good way to do this later upstream
	. = ..()
	icon = 'modular_zapoc/modules/mapping/icons/z_travel.dmi'
	icon_state = "matrix_blocked"
	addtimer(CALLBACK(src, PROC_REF(unlock)), 30 MINUTES, TIMER_UNIQUE | TIMER_DELETE_ME)

/obj/transfer_point_vamp/forest/pentex/transfer_atom(atom/movable/arrived)
	if(locked)
		return
	else
		. = ..()

/obj/transfer_point_vamp/forest/pentex/proc/unlock()
	icon = src::icon
	icon_state = src::icon_state
	locked = FALSE

/obj/transfer_point_vamp/forest/pentex/examine(mob/user)
	. = ..()
	if(locked)
		. += span_warning("You can't go that way yet.")

/obj/transfer_point_vamp/voivodate
	name = "voivodate transfer point"
	id = "estate_1"

/obj/transfer_point_vamp/voivodate/one
	id = "estate_2"

/obj/transfer_point_vamp/voivodate/two
	id = "estate_3"

/obj/transfer_point_vamp/voivodate/three
	id = "estate_4"

// SEWER
/obj/transfer_point_vamp/voivodate/sewer
	name = "voivodate transfer point"
	id = "estatesewer_1"

/obj/transfer_point_vamp/voivodate/sewer/one
	id = "estatesewer_2"

/obj/transfer_point_vamp/voivodate/sewer/two
	id = "estatesewer_3"

/obj/transfer_point_vamp/voivodate/sewer/three
	id = "estatesewer_4"
