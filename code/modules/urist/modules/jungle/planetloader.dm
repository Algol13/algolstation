//A shitty, but proven method of loading shit. What I need to do is load the jungle, then load the jungle controller. Now, I'll need to edit the MC
//in order to accomplish this. So, I've taken the awaymaps system, and appropriated it so that we can have a z-level smaller than 255x255, and the jungle won't load
//6 copies of itself when I try to start the damn game.

proc/createPlanetOutpost()
//	if(length(awaydestinations))	//crude, but it saves another var!
//		return

	var/list/potentialPlanetOutposts = list()
	report_progress("Searching for away missions...")
	var/list/Lines = file2list("maps/PlanetOutposts/fileList.txt") //leaving this in, because maybe I'll want randomized planets in the future.
	if(!length(Lines))	return //										You know what they say, variety is the spice of life. :D
	for (var/t in Lines)
		if (!t)
			continue

		t = trim(t)
		if (length(t) == 0)
			continue
		else if (copytext(t, 1, 2) == "#")
			continue

		var/pos = findtext(t, " ")
		var/name = null
	//	var/value = null

		if (pos)
			// No, don't do lowertext here, that breaks paths on linux
			name = copytext(t, 1, pos)
		//	value = copytext(t, pos + 1)
		else
			// No, don't do lowertext here, that breaks paths on linux
			name = t

		if (!name)
			continue

		potentialPlanetOutposts.Add(name)


	if(length(potentialPlanetOutposts))
		report_progress("Loading Planetary Outpost...")

		var/map = pick(potentialPlanetOutposts)
		var/file = file(map)
		if(isfile(file))
			GLOB.maploader.load_map(file)
			to_world_log("planet outpost loaded: [map]")

			for(var/x = 1 to world.maxx)
				for(var/y = 1 to world.maxy)
					turfs += locate(x,y,world.maxz)
//		for(var/obj/effect/landmark/L in landmarks_list)
//			if (L.name != "awaystart")
//				continue
//		sleep(-1)

		report_progress("Planetary Outpost loaded.")

	else
		report_progress("No Planetary Outpost loaded.")
		return
