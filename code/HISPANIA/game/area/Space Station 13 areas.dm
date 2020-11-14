/*
### Aqui encontraras la lista de areas personalizadas de hispania:

/area/CATEGORY/OR/DESCRIPTOR/NAME 	(puedes hacer cuantas divisiones como quieras)
	name = "NICE NAME" 				(nombre que sale en los GPS al estar ahi)
	icon = "ICON FILENAME" 			(aqui si tienes icono personalizado para el area, no es necesario)
	icon_state = "NAME OF ICON" 	(nombre del icono)
	requires_power = FALSE 			(predeterminado es TRUE)
	music = "music/music.ogg"		(musica al entrar en esta seccion)
*/

/area/shuttle/tsf
	name = "TSF Discovery"
	icon_state = "shuttle"

/area/snowland
	icon_state = "Naga"
	has_gravity = TRUE

/area/snowland/surface
	name = "Naga Surface"
	icon_state = "space"
	always_unpowered = TRUE
	requires_power = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	ambientsounds = MINING_SOUNDS
