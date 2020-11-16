/obj/effect/baseturf_helper/asteroid/snow_naga
	name = "naga snow baseturf editor"
	var/gravity
	baseturf = /turf/simulated/floor/plating/asteroid/snow/naga

/obj/effect/baseturf_helper/asteroid/snow_naga/Initialize(mapload)
	. = ..()
	var/area/thearea = get_area(src)
	thearea.has_gravity = TRUE
	for(var/turf/T in get_area_turfs(thearea, z))
		replace_baseturf(T)

	return INITIALIZE_HINT_QDEL
