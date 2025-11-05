/turf/open/misc/grass
	icon_state = "grass1"
	icon = 'modular_zapoc/modules/floors/icons.dmi'
	smooth_icon = 'icons/obj/smooth_structures/apoc/grass.dmi'

/turf/open/misc/dirt
	icon = 'modular_zapoc/modules/floors/icons.dmi'
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_FLOOR_GRASS
	canSmoothWith = SMOOTH_GROUP_FLOOR_GRASS + SMOOTH_GROUP_CLOSED_TURFS
	var/smooth_icon = 'icons/obj/smooth_structures/apoc/dirt.dmi'

/turf/open/misc/dirt/Initialize(mapload)
	. = ..()
	if(smoothing_flags)
		var/matrix/translation = new
		translation.Translate(LARGE_TURF_SMOOTHING_X_OFFSET, LARGE_TURF_SMOOTHING_Y_OFFSET)
		transform = translation
		icon = smooth_icon

/turf/open/misc/dirt/dark
	smooth_icon = null

/turf/open/misc/dirt/jungle
	smooth_icon = null

/*
/turf/open/misc/beach/vamp
	base_icon_state = "beach"
	icon = 'icons/obj/smooth_structures/apoc/beach.dmi'
	MAP_SWITCH(pixel_x = 0, pixel_x = -LARGE_TURF_SMOOTHING_X_OFFSET)
	MAP_SWITCH(pixel_y = 0, pixel_y = -LARGE_TURF_SMOOTHING_Y_OFFSET)
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_FLOOR_GRASS
	canSmoothWith = SMOOTH_GROUP_FLOOR_GRASS + SMOOTH_GROUP_CLOSED_TURFS
	smooth_broken = TRUE
	smooth_burnt = TRUE
	layer = HIGH_TURF_LAYER

/turf/open/misc/beach/vamp/Initialize(mapload)
	. = ..()
	if(smoothing_flags)
		var/matrix/translation = new
		translation.Translate(LARGE_TURF_SMOOTHING_X_OFFSET, LARGE_TURF_SMOOTHING_Y_OFFSET)
		transform = translation
		//icon = smooth_icon
*/
