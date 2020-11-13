/turf/simulated/floor/plasteel/hispania
	icon_state = "L1"
	icon = 'icons/hispania/turf/floors.dmi'
	floor_tile = /obj/item/stack/tile/plasteel
	broken_states = list("damaged1", "damaged2", "damaged3", "damaged4", "damaged5")
	burnt_states = list("floorscorched1", "floorscorched2")

/turf/simulated/floor/plating/asteroid/snow/naga
	oxygen = 22
	nitrogen = 82
	temperature = 255
	var/destination_z
	var/destination_x
	var/destination_y

/turf/simulated/floor/plating/asteroid/snow/naga/proc/set_transition_north(dest_z)
	destination_x = x
	destination_y = TRANSITION_BORDER_SOUTH + 1
	destination_z = dest_z

/turf/simulated/floor/plating/asteroid/snow/naga/proc/set_transition_south(dest_z)
	destination_x = x
	destination_y = TRANSITION_BORDER_NORTH - 1
	destination_z = dest_z

/turf/simulated/floor/plating/asteroid/snow/naga/proc/set_transition_east(dest_z)
	destination_x = TRANSITION_BORDER_WEST + 1
	destination_y = y
	destination_z = dest_z

/turf/simulated/floor/plating/asteroid/snow/naga/proc/set_transition_west(dest_z)
	destination_x = TRANSITION_BORDER_EAST - 1
	destination_y = y
	destination_z = dest_z

/turf/simulated/floor/plating/asteroid/snow/naga/proc/remove_transitions()
	destination_z = initial(destination_z)

