/obj/machinery/iv_drip/formaldehyde
	name = "formaldehyde tank"
	desc = "An all-you-can-drip formaldehyde canister designed to supply a hospital without running out, with a scary looking pump rigged to inject formaldehyde into containers, but filling people directly might be a bad idea."
	icon_state = "plumb_donating"
	base_icon_state = "plumb_donating"
	density = TRUE
	inject_only = TRUE
	anchored = TRUE
	use_internal_storage = TRUE
	internal_list_reagents = list(/datum/reagent/toxin/formaldehyde = 5000)
	internal_volume_maximum = 5000

/obj/machinery/iv_drip/formaldehyde/Initialize(mapload)
	AddElement(/datum/element/update_icon_blocker)
	. = ..()
