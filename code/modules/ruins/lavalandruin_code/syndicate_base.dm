// SyndiChem
/obj/machinery/vending/syndichem
	name = "\improper SyndiChem"
	desc = "A vending machine full of grenades and grenade accessories. Sponsored by DonkCo(tm)."
	req_access = list(ACCESS_SYNDICATE)
	products = list(/obj/item/stack/cable_coil/random = 5,
					/obj/item/assembly/igniter = 20,
					/obj/item/assembly/prox_sensor = 5,
					/obj/item/assembly/signaler = 5,
					/obj/item/assembly/timer = 5,
					/obj/item/assembly/voice = 5,
					/obj/item/assembly/health = 5,
					/obj/item/assembly/infra = 5,
					/obj/item/grenade/chem_grenade = 5,
	                /obj/item/grenade/chem_grenade/large = 5,
	                /obj/item/grenade/chem_grenade/pyro = 5,
	                /obj/item/grenade/chem_grenade/cryo = 5,
	                /obj/item/grenade/chem_grenade/adv_release = 5,
					/obj/item/reagent_containers/food/drinks/bottle/holywater = 1)
	slogan_list = list("It's not pyromania if you're getting paid!","You smell that? Plasma, son. Nothing else in the world smells like that.","I love the smell of Plasma in the morning.")
	resistance_flags = FIRE_PROOF

// Spawners
/obj/effect/mob_spawn/human/lavaland_syndicate
	name = "Syndicate Bioweapon Scientist sleeper"
	mob_name = "Syndicate Bioweapon Scientist"
	roundstart = FALSE
	death = FALSE
	icon = 'icons/obj/cryogenic2.dmi'
	icon_state = "sleeper_s"
	important_info = "No trabajes contra el personal del sindicato (Como traidores u operativos nucleares). No abandones la base sin permiso de la administración."
	description = "Experimenta con virus y químicos mortales o ayuda a los agentes del sindicato."
	flavour_text = "Eres un agente del sindicato, empleado en un laboratorio de alto secreto desarrollando armas biológicas. Desafortunadamente, vuestro odioso enemigo, Nanotrasen, ha comenzado a minar en este sector. Continúe como mejor pueda, e intenta mantener un perfil bajo, la base esta equipada con explosivos, ¡no lo abandones o lo dejes caer en manos enemigas!\
	Te ha quedado claro que el sindicato hará que te arrepientas si los decepcionas."
	outfit = /datum/outfit/lavaland_syndicate
	assignedrole = "Lavaland Syndicate"
	del_types = list() // Necessary to prevent del_types from removing radio!
	allow_species_pick = TRUE

/obj/effect/mob_spawn/human/lavaland_syndicate/Destroy()
	var/obj/structure/fluff/empty_sleeper/syndicate/S = new /obj/structure/fluff/empty_sleeper/syndicate(get_turf(src))
	S.setDir(dir)
	return ..()

/datum/outfit/lavaland_syndicate
	name = "Lavaland Syndicate Agent"
	r_hand = /obj/item/gun/projectile/automatic/sniper_rifle
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/storage/labcoat
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	r_ear = /obj/item/radio/headset/syndicate/alt/lavaland // See del_types above
	back = /obj/item/storage/backpack
	r_pocket = /obj/item/gun/projectile/automatic/pistol
	id = /obj/item/card/id/syndicate/anyone
	implants = list(/obj/item/implant/weapons_auth)

/datum/outfit/lavaland_syndicate/post_equip(mob/living/carbon/human/H)
	H.faction |= "syndicate"

/obj/effect/mob_spawn/human/lavaland_syndicate/comms
	name = "Syndicate Comms Agent sleeper"
	mob_name = "Syndicate Comms Agent"
	important_info = "No trabajes contra el personal del sindicato (Como traidores u operativos nucleares). No abandones la base sin permiso de la administración. No reveles tu identidad a NT."
	description = "Supervise las comunicaciones y las cámaras y trate de ayudar a los agentes en la estación mientras mantiene su existencia en secreto."
	flavour_text = "Eres un agente del sindicato, empleado en un laboratorio de alto secreto desarrollando armas biológicas. Desafortunadamente, vuestro odioso enemigo, Nanotrasen, ha comenzado a minar en este sector. Continúe como mejor pueda, e intenta mantener un perfil bajo, la base esta equipada con explosivos, ¡no lo abandones o lo dejes caer en manos enemigas!\
	Te ha quedado claro que el sindicato hará que te arrepientas si los decepcionas. Supervisa la actividad enemiga lo mejor que puedas y lo mejor que puedas y no interactúe con los tripulantes de la estación.."
	outfit = /datum/outfit/lavaland_syndicate/comms

/obj/effect/mob_spawn/human/lavaland_syndicate/comms/space
	flavour_text = "Eres un agente del sindicato, empleado en un pequeño puesto de escucha. Estarías muerto de aburrimiento si no pudieras escuchar a esos idiotas del NT que se equivocan todo el tiempo."

/obj/effect/mob_spawn/human/lavaland_syndicate/comms/space/Initialize(mapload)
	. = ..()
	if(prob(90)) //only has a 10% chance of existing, otherwise it'll just be a NPC syndie.
		new /mob/living/simple_animal/hostile/syndicate/ranged(get_turf(src))
		return INITIALIZE_HINT_QDEL

/datum/outfit/lavaland_syndicate/comms
	name = "Lavaland Syndicate Comms Agent"
	r_ear = /obj/item/radio/headset/syndicate/alt // See del_types above
	r_hand = /obj/item/melee/energy/sword/saber
	mask = /obj/item/clothing/mask/chameleon/gps
	suit = /obj/item/clothing/suit/armor/vest
	backpack_contents = list(
		/obj/item/paper/monitorkey = 1 // message console on lavaland does NOT spawn with this
	)

/obj/item/clothing/mask/chameleon/gps/New()
	. = ..()
	new /obj/item/gps/internal/lavaland_syndicate_base(src)

/obj/item/gps/internal/lavaland_syndicate_base
	gpstag = "Encrypted Signal"
