/obj/effect/decal
	name = "decal"
	plane = FLOOR_PLANE
	anchored = TRUE
	resistance_flags = FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/turf_loc_check = TRUE

/obj/effect/decal/Initialize()
	. = ..()
	if(turf_loc_check && (!isturf(loc) || NeverShouldHaveComeHere(loc)))
		return INITIALIZE_HINT_QDEL
	var/static/list/loc_connections = list(
		COMSIG_TURF_CHANGED = PROC_REF(handle_turf_change),
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/obj/effect/decal/proc/NeverShouldHaveComeHere(turf/T)
	return isclosedturf(T) || isgroundlessturf(T)

/obj/effect/decal/ex_act(severity, target)
	qdel(src)

/obj/effect/decal/fire_act(exposed_temperature, exposed_volume)
	if(!(resistance_flags & FIRE_PROOF)) //non fire proof decal or being burned by lava
		qdel(src)

/obj/effect/decal/proc/handle_turf_change(turf/source, path, list/new_baseturfs, flags, list/post_change_callbacks)
	SIGNAL_HANDLER
	post_change_callbacks += CALLBACK(src, PROC_REF(sanity_check_self))

/obj/effect/decal/proc/sanity_check_self(turf/changed)
	if(changed == loc && NeverShouldHaveComeHere(changed))
		qdel(src)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/effect/turf_decal
	icon = 'icons/turf/decals/decals.dmi'
	icon_state = "warningfulltile"
	plane = FLOOR_PLANE
	layer = TURF_DECAL_LAYER
	var/detail_overlay
	var/detail_color

// This is with the intent of optimizing mapload
// See spawners for more details since we use the same pattern
// Basically rather then creating and deleting ourselves, why not just do the bare minimum?
/obj/effect/turf_decal/Initialize(mapload)
	SHOULD_CALL_PARENT(FALSE)
	if(flags_1 & INITIALIZED_1)
		stack_trace("Warning: [src]([type]) initialized multiple times!")
	flags_1 |= INITIALIZED_1

	var/turf/T = loc
	if(!istype(T)) //you know this will happen somehow
		CRASH("Turf decal initialized in an object/nullspace")
	T.AddElement(/datum/element/decal, icon, icon_state, dir, FALSE, color, null, null, alpha, FALSE)
	if(detail_overlay)
		T.AddElement(/datum/element/decal, icon, detail_overlay, dir, FALSE, detail_color, null, null, alpha, appearance_flags)
	return INITIALIZE_HINT_QDEL

/obj/effect/turf_decal/Destroy(force)
	SHOULD_CALL_PARENT(FALSE)
	loc = null
	return QDEL_HINT_QUEUE
