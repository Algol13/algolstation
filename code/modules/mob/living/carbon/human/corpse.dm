//These are meant for spawning on maps, namely Away Missions.

//If someone can do this in a neater way, be my guest-Kor

//To do: Allow corpses to appear mangled, bloody, etc. Allow customizing the bodies appearance (they're all bald and white right now).

#define CORPSE_SPAWNER_RANDOM_NAME         FLAG(0)
#define CORPSE_SPAWNER_CUT_SURVIVAL        FLAG(1)
#define CORPSE_SPAWNER_CUT_ID_PDA          (CORPSE_SPAWNER_RANDOM_NAME | CORPSE_SPAWNER_CUT_SURVIVAL)
#define CORPSE_SPAWNER_PLAIN_HEADSET       FLAG(2)
#define CORPSE_SPAWNER_SKIP_POST_EQUIP     FLAG(10)
#define CORPSE_SPAWNER_SKIP_BACKPACK       FLAG(11)

#define CORPSE_SPAWNER_ALL_SKIPS           (CORPSE_SPAWNER_SKIP_POST_EQUIP|CORPSE_SPAWNER_CUT_ID_PDA|CORPSE_SPAWNER_SKIP_BACKPACK)

#define CORPSE_SPAWNER_RANDOM_SKIN_TONE    FLAG(3)
#define CORPSE_SPAWNER_RANDOM_SKIN_COLOR   FLAG(4)
#define CORPSE_SPAWNER_RANDOM_HAIR_COLOR   FLAG(5)
#define CORPSE_SPAWNER_RANDOM_HAIR_STYLE   FLAG(6)
#define CORPSE_SPAWNER_RANDOM_FACIAL_STYLE FLAG(7)
#define CORPSE_SPAWNER_RANDOM_EYE_COLOR    FLAG(8)
#define CORPSE_SPAWNER_RANDOM_GENDER       FLAG(9)

#define CORPSE_SPAWNER_RANDOM_NAMELESS    ~(CORPSE_SPAWNER_RANDOM_HAIR_STYLE|CORPSE_SPAWNER_RANDOM_FACIAL_STYLE)
#define CORPSE_SPAWNER_NO_RANDOMIZATION   ~(CORPSE_SPAWNER_RANDOM_NAME|CORPSE_SPAWNER_RANDOM_SKIN_TONE|CORPSE_SPAWNER_RANDOM_SKIN_COLOR|CORPSE_SPAWNER_RANDOM_HAIR_COLOR|CORPSE_SPAWNER_RANDOM_HAIR_STYLE|CORPSE_SPAWNER_RANDOM_FACIAL_STYLE|CORPSE_SPAWNER_RANDOM_EYE_COLOR)


/obj/effect/landmark/corpse
	name = "Unknown"
	var/species = list(SPECIES_HUMAN)                 // List of species to pick from.
	var/corpse_outfits = list(/singleton/hierarchy/outfit) // List of outfits to pick from. Uses pickweight()
	var/spawn_flags = (~0)

	var/skin_colors_per_species   = list() // Custom skin colors, per species -type-, if any. For example if you want dead Skrell to always have blue headtails, or similar
	var/skin_tones_per_species    = list() // Custom skin tones, per species -type-, if any. See above as to why.
	var/eye_colors_per_species    = list() // Custom eye colors, per species -type-, if any. See above as to why.
	var/hair_colors_per_species   = list() // Custom hair colors, per species -type-, if any. See above as to why.
	var/hair_styles_per_species   = list() // Custom hair styles, per species -type-, if any. For example if you want a punk gang with handlebars.
	var/facial_styles_per_species = list() // Custom facial hair styles, per species -type-, if any. See above as to why
	var/genders_per_species       = list() // For gender biases per species -type-
	var/list/damage // Use BP defines = damage
	var/faction = "neutral"

/obj/effect/landmark/corpse/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD


/obj/effect/landmark/corpse/LateInitialize()
	var/new_species = pickweight(species)
	var/mob/living/carbon/human/corpse = new (loc, new_species)
	corpse.adjustOxyLoss(corpse.maxHealth)
	corpse.setBrainLoss(corpse.maxHealth)
	var/obj/item/organ/internal/heart/heart = corpse.internal_organs_by_name[BP_HEART]
	if (heart)
		heart.pulse = PULSE_NONE
	if(damage)
		if(damage["damage_all_brute"] || damage["damage_all_burn"])
			corpse.take_overall_damage(damage["damage_all_brute"], damage["damage_all_burn"])
		else
			for(var/limb in damage)
				var/obj/item/organ/external/O = corpse.organs_by_name[limb]
				if(O)
					O.take_external_damage(damage[limb])

		if(damage["impale"])
			var/turf/T = corpse.near_wall(dir,2)
			var/obj/item/organ/external/E = corpse.organs_by_name[damage["impale"]]
			if(T && E && length(E.wounds))
				var/obj/item/arrow/rod/R = new(corpse)
				corpse.set_dir(GLOB.reverse_dir[dir])
				corpse.loc = T
				corpse.anchored = TRUE
				corpse.pinned += R
				var/datum/wound/W = E.wounds[1]
				W.embedded_objects += R
	randomize_appearance(corpse, new_species)
	equip_outfit(corpse)
	corpse.update_icon()
	corpse.faction = faction
	qdel(src)


#define HEX_COLOR_TO_RGB_ARGS(X) arglist(GetHexColors(X))
/obj/effect/landmark/corpse/proc/randomize_appearance(mob/living/carbon/human/M, species_choice)
	if((spawn_flags & CORPSE_SPAWNER_RANDOM_GENDER))
		if(species_choice in genders_per_species)
			M.change_gender(pick(genders_per_species[species_choice]))
		else
			M.randomize_gender()

	if((spawn_flags & CORPSE_SPAWNER_RANDOM_SKIN_TONE))
		if(species_choice in skin_tones_per_species)
			M.change_skin_tone(pick(skin_tones_per_species[species_choice]))
		else
			M.randomize_skin_tone()

	if((spawn_flags & CORPSE_SPAWNER_RANDOM_SKIN_COLOR))
		if(species_choice in skin_colors_per_species)
			M.change_skin_color(HEX_COLOR_TO_RGB_ARGS(pick(skin_colors_per_species[species_choice])))
		else
			M.skin_tone = random_skin_tone(M.species)

	if((spawn_flags & CORPSE_SPAWNER_RANDOM_HAIR_COLOR))
		if(species_choice in hair_colors_per_species)
			M.change_hair_color(HEX_COLOR_TO_RGB_ARGS(pick(hair_colors_per_species[species_choice])))
		else
			M.randomize_hair_color()
		var/list/rgb = rgb2num(M.head_hair_color)
		M.change_facial_hair_color(rgb[1], rgb[2], rgb[3])

	if((spawn_flags & CORPSE_SPAWNER_RANDOM_HAIR_STYLE))
		if(species_choice in hair_styles_per_species)
			M.change_hair(pick(hair_styles_per_species[species_choice]))
		else
			M.randomize_hair_style()

	if((spawn_flags & CORPSE_SPAWNER_RANDOM_FACIAL_STYLE))
		if(species_choice in facial_styles_per_species)
			M.change_facial_hair(pick(facial_styles_per_species[species_choice]))
		else
			M.randomize_facial_hair_style()

	if((spawn_flags & CORPSE_SPAWNER_RANDOM_EYE_COLOR))
		if(species_choice in eye_colors_per_species)
			M.change_eye_color(HEX_COLOR_TO_RGB_ARGS(pick(eye_colors_per_species[species_choice])))
		else
			M.randomize_eye_color()

	var/singleton/cultural_info/culture = M.get_cultural_value(TAG_CULTURE)
	if(culture && CORPSE_SPAWNER_RANDOM_NAME & spawn_flags)
		M.SetName(culture.get_random_name(M.gender))
	else
		M.SetName(name)
	M.real_name = M.name

#undef HEX_COLOR_TO_RGB_ARGS

/obj/effect/landmark/corpse/proc/equip_outfit(mob/living/carbon/human/M)
	var/adjustments = 0
	adjustments = (spawn_flags & CORPSE_SPAWNER_CUT_SURVIVAL)    ? (adjustments|OUTFIT_ADJUSTMENT_SKIP_SURVIVAL_GEAR) : adjustments
	adjustments = (spawn_flags & CORPSE_SPAWNER_CUT_ID_PDA)      ? (adjustments|OUTFIT_ADJUSTMENT_SKIP_ID_PDA)        : adjustments
	adjustments = (spawn_flags & CORPSE_SPAWNER_PLAIN_HEADSET)   ? (adjustments|OUTFIT_ADJUSTMENT_PLAIN_HEADSET)      : adjustments
	adjustments = (spawn_flags & CORPSE_SPAWNER_SKIP_BACKPACK)   ? (adjustments|OUTFIT_ADJUSTMENT_SKIP_BACKPACK)      : adjustments
	adjustments = (spawn_flags & CORPSE_SPAWNER_SKIP_POST_EQUIP) ? (adjustments|OUTFIT_ADJUSTMENT_SKIP_POST_EQUIP)    : adjustments
	adjustments = (spawn_flags & CORPSE_SPAWNER_ALL_SKIPS) 		 ? (adjustments|OUTFIT_ADJUSTMENT_ALL_SKIPS)          : adjustments

	var/singleton/hierarchy/outfit/corpse_outfit = outfit_by_type(pickweight(corpse_outfits))
	corpse_outfit.equip(M, equip_adjustments = adjustments)

/obj/effect/landmark/corpse/chef
	name = "Chef"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/service/chef)

/obj/effect/landmark/corpse/doctor
	name = "Doctor"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/medical/doctor)

/obj/effect/landmark/corpse/engineer
	name = "Engineer"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/engineering/engineer)

/obj/effect/landmark/corpse/scientist
	name = "Scientist"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/science/scientist)

/obj/effect/landmark/corpse/engineer/rig
	corpse_outfits = list(/singleton/hierarchy/outfit/job/engineering/engineer/void)

/obj/effect/landmark/corpse/clown
	name = "Clown"
	corpse_outfits = list(/singleton/hierarchy/outfit/clown)

/obj/effect/landmark/corpse/miner
	name = "Miner"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/cargo/mining)

/obj/effect/landmark/corpse/miner/rig
	corpse_outfits = list(/singleton/hierarchy/outfit/job/cargo/mining/void)


/obj/effect/landmark/corpse/bridgeofficer
	name = "Bridge Officer"
	corpse_outfits = list(/singleton/hierarchy/outfit/nanotrasen/officer)

/obj/effect/landmark/corpse/commander
	name = "Commander"
	corpse_outfits = list(/singleton/hierarchy/outfit/nanotrasen/commander)

/obj/effect/landmark/corpse/pirate
	name = "Pirate"
	corpse_outfits = list(/singleton/hierarchy/outfit/pirate/norm)
	spawn_flags = CORPSE_SPAWNER_NO_RANDOMIZATION
	faction = "pirate"

/obj/effect/landmark/corpse/pirate/ranged
	name = "Pirate Gunner"
	corpse_outfits = list(/singleton/hierarchy/outfit/pirate/space)

/obj/effect/landmark/corpse/russian
	name = "Russian"
	corpse_outfits = list(/singleton/hierarchy/outfit/soviet_soldier)
	spawn_flags = CORPSE_SPAWNER_NO_RANDOMIZATION
	faction = "russian"

/obj/effect/landmark/corpse/russian/ranged
	corpse_outfits = list(/singleton/hierarchy/outfit/soviet_soldier)

/obj/effect/landmark/corpse/syndicate
	name = "Syndicate Operative"
	corpse_outfits = list(/singleton/hierarchy/outfit/mercenary/syndicate)
	spawn_flags = CORPSE_SPAWNER_NO_RANDOMIZATION
	faction = "syndicate"

/obj/effect/landmark/corpse/syndicate/commando
	name = "Syndicate Commando"
	corpse_outfits = list(/singleton/hierarchy/outfit/mercenary/syndicate/commando)
