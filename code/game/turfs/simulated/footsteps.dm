#define FOOTSTEP_CARPET 	"carpet"
#define FOOTSTEP_TILES 		"tiles"
#define FOOTSTEP_PLATING 	"plating"
#define FOOTSTEP_WOOD 		"wood"
#define FOOTSTEP_ASTEROID 	"asteroid"
#define FOOTSTEP_DIRT		"dirt"
#define FOOTSTEP_GRASS 		"grass"
#define FOOTSTEP_WATER		"water"
#define FOOTSTEP_BLANK		"blank"
#define FOOTSTEP_REINFPLATING "reinforcedplating"
#define FOOTSTEP_SNOW		"snow"
#define FOOTSTEP_MUD 		"mud"
#define FOOTSTEP_STONE		"stone"

/turf/simulated/floor/var/global/list/footstep_sounds = list(
	FOOTSTEP_WOOD = list(
		'sound/effects/footstep/wood1.ogg',
		'sound/effects/footstep/wood2.ogg',
		'sound/effects/footstep/wood3.ogg',
		'sound/effects/footstep/wood4.ogg',
		'sound/effects/footstep/wood5.ogg'),
	FOOTSTEP_TILES = list(
		'sound/effects/footstep/floor1.ogg',
		'sound/effects/footstep/floor2.ogg',
		'sound/effects/footstep/floor3.ogg',
		'sound/effects/footstep/floor4.ogg'),
	FOOTSTEP_PLATING =  list(
		'sound/effects/footstep/plating1.ogg',
		'sound/effects/footstep/plating2.ogg',
		'sound/effects/footstep/plating3.ogg',
		'sound/effects/footstep/plating4.ogg',
		'sound/effects/footstep/plating5.ogg'),
	FOOTSTEP_CARPET = list(
		'sound/effects/footstep/carpet1.ogg',
		'sound/effects/footstep/carpet2.ogg',
		'sound/effects/footstep/carpet3.ogg',
		'sound/effects/footstep/carpet4.ogg',
		'sound/effects/footstep/carpet5.ogg'),
	FOOTSTEP_ASTEROID = list(
		'sound/effects/footstep/asteroid1.ogg',
		'sound/effects/footstep/asteroid2.ogg',
		'sound/effects/footstep/asteroid3.ogg',
		'sound/effects/footstep/asteroid4.ogg',
		'sound/effects/footstep/asteroid5.ogg'),
	FOOTSTEP_DIRT = list(
		'sound/effects/footstep/dirt1.ogg',
		'sound/effects/footstep/dirt2.ogg',
		'sound/effects/footstep/dirt3.ogg'),

	FOOTSTEP_GRASS = list(
		'sound/effects/footstep/grass1.ogg',
		'sound/effects/footstep/grass2.ogg',
		'sound/effects/footstep/grass3.ogg',
		'sound/effects/footstep/grass4.ogg'),
	FOOTSTEP_WATER = list(
		'sound/effects/footstep/water_max1.ogg',
		'sound/effects/footstep/water_max2.ogg'),
	FOOTSTEP_SNOW = list(
		'sound/effects/footstep/snowstep1.ogg',
		'sound/effects/footstep/snowstep2.ogg',
		'sound/effects/footstep/snowstep3.ogg',
		'sound/effects/footstep/snowstep1.ogg'),
	FOOTSTEP_MUD = list(
		'sound/effects/footstep/mud1.ogg',
		'sound/effects/footstep/mud2.ogg',
		'sound/effects/footstep/mud3.ogg',
		'sound/effects/footstep/mud4.ogg',
		'sound/effects/footstep/mud5.ogg'),
	FOOTSTEP_BLANK = list(
		'sound/effects/footstep/blank.ogg'),
	FOOTSTEP_REINFPLATING = list(
		'sound/effects/footstep/reinfplating1.ogg',
		'sound/effects/footstep/reinfplating2.ogg',
		'sound/effects/footstep/reinfplating3.ogg',
		'sound/effects/footstep/reinfplating4.ogg',
		'sound/effects/footstep/reinfplating5.ogg',
		'sound/effects/footstep/reinfplating6.ogg'),
	FOOTSTEP_STONE =list(
		'sound/effects/footstep/stone1.ogg',
		'sound/effects/footstep/stone2.ogg',
		'sound/effects/footstep/stone3.ogg',
		'sound/effects/footstep/stone4.ogg',
		'sound/effects/footstep/stone5.ogg',
		'sound/effects/footstep/stone6.ogg',),
)

/decl/flooring/var/footstep_type
/decl/flooring/footstep_type = FOOTSTEP_BLANK
/decl/flooring/carpet/footstep_type = FOOTSTEP_CARPET
/decl/flooring/tiling/footstep_type = FOOTSTEP_TILES
/decl/flooring/linoleum/footstep_type = FOOTSTEP_TILES
/decl/flooring/wood/footstep_type = FOOTSTEP_WOOD
/decl/flooring/reinforced/footstep_type = FOOTSTEP_PLATING
/decl/flooring/stone/footstep_type = FOOTSTEP_STONE

/turf/simulated/floor/proc/get_footstep_sound()
	if(is_plating())
		return safepick(footstep_sounds[FOOTSTEP_PLATING])
	else if(!flooring || !flooring.footstep_type)
		return safepick(footstep_sounds[FOOTSTEP_BLANK])
	else
		return safepick(footstep_sounds[flooring.footstep_type])

/turf/simulated/floor/asteroid/get_footstep_sound()
	return safepick(footstep_sounds[FOOTSTEP_ASTEROID])

/turf/simulated/floor/exoplanet/get_footstep_sound()
	return safepick(footstep_sounds[FOOTSTEP_CARPET])

/turf/simulated/floor/exoplanet/grass/get_footstep_sound()
	return safepick(footstep_sounds[FOOTSTEP_GRASS])

/turf/simulated/floor/exoplanet/water/shallow/get_footstep_sound()
	return safepick(footstep_sounds[FOOTSTEP_WATER])

/turf/simulated/floor/fixed/get_footstep_sound()
	return safepick(footstep_sounds[FOOTSTEP_PLATING])

/turf/simulated/floor/plating/reinforced/get_footstep_sound()
	return safepick(footstep_sounds[FOOTSTEP_REINFPLATING])

/turf/simulated/floor/dirty/get_footstep_sound()
	return safepick(footstep_sounds[FOOTSTEP_DIRT])//FOOTSTEP_SNOW])

/turf/simulated/floor/trench/get_footstep_sound()
	return safepick(footstep_sounds[FOOTSTEP_MUD])

/turf/simulated/floor/stone/get_footstep_sound()
	return safepick(footstep_sounds[FOOTSTEP_STONE])

/turf/simulated/floor/snow/get_footstep_sound()
	return safepick(footstep_sounds[FOOTSTEP_SNOW])



/turf/simulated/floor/Entered(var/mob/living/carbon/human/H)
	..()
	if(istype(H))
		H.handle_footsteps()
		H.step_count++

/datum/species/var/silent_steps
/datum/species/nabber/silent_steps = 1

/mob/living/carbon/human/var/step_count

/mob/living/carbon/human/proc/handle_footsteps()
	var/turf/simulated/floor/T = get_turf(src)
	if(!istype(T))
		return

	if(buckled || lying || throwing)
		return //people flying, lying down or sitting do not step

	if(m_intent == "run")
		if(step_count % 2) //every other turf makes a sound
			return

	if(species.silent_steps)
		return //species is silent

	if(!has_gravity(src))
		if(step_count % 3) // don't need to step as often when you hop around
			return

	if(!has_organ(BP_L_FOOT) && !has_organ(BP_R_FOOT))
		return //no feet no footsteps

	var/S = T.get_footstep_sound()
	if(S)
		var/range = -(world.view - 2)
		var/armor_range = -(world.view - 2)
		var/volume = 50
		if(m_intent == "walk")
			volume -= 45
			range -= 0.333
		if(!shoes)
			volume -= 60
			range -= 0.333
		if(istype(wear_suit,/obj/item/clothing/suit/armor))
			playsound(T, "armorwalk", 50, 1, armor_range)

		playsound(T, S, volume, 1, range)

		var/list/clients_to_show = list()

		for(var/mob/living/carbon/human/H in view())
			clients_to_show += H.get_client()
		if(!length(clients_to_show))
			return
		clients_to_show -= src.get_client()
		var/image/I = image('icons/effects/footstepsound.dmi', loc = T, icon_state = "default")
		I.plane = FOOTSTEP_ALERT_PLANE
		flick_overlay(I, clients_to_show, 4)
