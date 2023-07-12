/datum/map/glloydstation
// Unit test exemptions
	apc_test_exempt_areas = list(
		/area/AIsattele = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/constructionsite/ai = NO_SCRUBBER|NO_VENT,
		/area/constructionsite/atmospherics = NO_SCRUBBER,
		/area/constructionsite/teleporter = NO_SCRUBBER,
		/area/crew_quarters/party = NO_SCRUBBER|NO_VENT,
		/area/derelict = NO_SCRUBBER|NO_VENT,
		/area/derelict/singularity_engine = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/derelict/ship = NO_SCRUBBER|NO_VENT,
		/area/djstation = NO_SCRUBBER|NO_VENT,
		/area/engineering/atmos/storage = NO_SCRUBBER|NO_VENT,
		/area/engineering/drone_fabrication = NO_SCRUBBER,
		/area/holodeck = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/planet/jungle = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/maintenance = NO_SCRUBBER|NO_VENT,
		/area/maintenance/aft = NO_SCRUBBER,
		/area/maintenance/asmaint = NO_SCRUBBER,
		/area/maintenance/asmaint2 = NO_SCRUBBER,
		/area/maintenance/atmos_control = NO_SCRUBBER|NO_VENT,
		/area/maintenance/auxsolarport = NO_SCRUBBER,
		/area/maintenance/auxsolarstarboard = NO_SCRUBBER,
		/area/maintenance/exterior = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/maintenance/fore = NO_SCRUBBER,
		/area/maintenance/fpmaint = NO_SCRUBBER,
		/area/maintenance/fsmaint = NO_SCRUBBER,
		/area/maintenance/medbay = NO_SCRUBBER,
		/area/maintenance/incinerator = NO_SCRUBBER,
		/area/maintenance/foresolar = NO_SCRUBBER,
		/area/maintenance/portsolar = NO_SCRUBBER,
		/area/maintenance/starboardsolar = NO_SCRUBBER,
		/area/mine/explored = NO_SCRUBBER|NO_VENT,
		/area/mine/unexplored = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/outpost/abandoned = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/outpost/mining_main/eva = NO_SCRUBBER,
		/area/outpost/mining_main/maintenance = NO_SCRUBBER|NO_VENT,
		/area/outpost/research/eva = NO_SCRUBBER,
		/area/rescue_base = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/rnd/test_area = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/rnd/server = NO_SCRUBBER,
		/area/rnd/storage = NO_SCRUBBER,
		/area/shuttle = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/skipjack_station = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/solar = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/storage/emergency = NO_SCRUBBER|NO_VENT,
		/area/storage/emergency2 = NO_SCRUBBER|NO_VENT,
		/area/storage/emergency3 = NO_SCRUBBER|NO_VENT,
		/area/supply = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/syndicate_station = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/tcommsat/chamber/abandoned = NO_SCRUBBER,
		/area/tcommsat/chamber/server = NO_SCRUBBER,
		/area/tcommsat/pirate = NO_SCRUBBER|NO_VENT,
		/area/map_template/hydrobase/station/shower = NO_SCRUBBER|NO_VENT|NO_APC
	)

	area_coherency_test_exempt_areas = list(
			/area/space,
			/area/mine/explored,
			/area/mine/unexplored,
			/area/engineering/atmos,
			/area/constructionsite,
			/area/constructionsite/maintenance,
			/area/solar/constructionsite,
			/area/maintenance/exterior,
			/area/awaymission/maze,
			/area/maintenance/incinerator,
			/area/beach,
			/area/planet/jungle,
			/area/map_template/hydrobase/station/shower
	)

	area_usage_test_exempted_areas = list(
		/area/awaymission,
		/area/awaymission/acerdemy,
		/area/awaymission/snowventure,
		/area/awaymission/maze,
		/area/awaymission/train,
		/area/awaymission/train/snow,
		/area/constructionsite,
		/area/constructionsite/storage,
		/area/constructionsite/bridge,
		/area/constructionsite/hallway,
		/area/constructionsite/hallway/aft,
		/area/constructionsite/hallway/fore,
		/area/constructionsite/atmospherics,
		/area/constructionsite/medical,
		/area/constructionsite/ai,
		/area/constructionsite/engineering,
		/area/constructionsite/teleporter,
		/area/constructionsite/maintenance,
		/area/engineering/atmos/storage,
		/area/engineering/storage,
		/area/engineering/locker_room,
		/area/engineering/foyer,
		/area/engineering/engineering_monitoring,
		/area/engineering/engine_eva,
		/area/exoplanet,
		/area/exoplanet/desert,
		/area/exoplanet/grass,
		/area/exoplanet/snow,
		/area/holodeck/source_courtroom,
		/area/holodeck/source_meetinghall,
		/area/infestation,
		/area/maintenance/exterior,
		/area/maintenance/substation,
		/area/map_template,
		/area/medical/biostorage,
		/area/medical/exam_room,
		/area/medical/sleeper,
		/area/overmap,
		/area/rescue_base,
		/area/rescue_base/base,
		/area/rescue_base/start,
		/area/rescue_base/southwest,
		/area/rescue_base/northwest,
		/area/rescue_base/northeast,
		/area/rescue_base/southeast,
		/area/rescue_base/north,
		/area/rescue_base/south,
		/area/rescue_base/commssat,
		/area/rescue_base/mining,
		/area/rescue_base/arrivals_dock,
		/area/rescue_base/transit,
		/area/rnd/misc_lab,
		/area/rnd/xenobiology/xenoflora,
		/area/rnd/xenobiology/xenoflora_storage,
		/area/scom/mission,
		/area/scom/mission/lighting,
		/area/security/range,
		/area/solar/constructionsite,
		/area/shuttle,
		/area/shuttle/constructionsite/site,
		/area/shuttle/event1,
		/area/shuttle/event2,
		/area/shuttle/scom/s1/mission,
		/area/shuttle/scom/s1/mission0,
		/area/shuttle/scom/s1/mission1,
		/area/shuttle/scom/s1/mission2,
		/area/shuttle/scom/s1/mission3,
		/area/shuttle/scom/s1/mission4,
		/area/shuttle/scom/s1/mission5,
		/area/shuttle/scom/s1/mission6,
		/area/shuttle/scom/s1/mission7,
		/area/shuttle/scom/s1/mission11,
		/area/shuttle/scom/s1/mission12,
		/area/shuttle/scom/s1/mission13,
		/area/shuttle/scom/s1/mission14,
		/area/shuttle/scom/s1/mission15,
		/area/shuttle/scom/s2/mission,
		/area/shuttle/scom/s2/mission0,
		/area/shuttle/scom/s2/mission1,
		/area/shuttle/scom/s2/mission2,
		/area/shuttle/scom/s2/mission3,
		/area/shuttle/scom/s2/mission4,
		/area/shuttle/scom/s2/mission5,
		/area/shuttle/scom/s2/mission6,
		/area/shuttle/scom/s2/mission7,
		/area/shuttle/scom/s2/mission11,
		/area/shuttle/scom/s2/mission12,
		/area/shuttle/scom/s2/mission13,
		/area/shuttle/scom/s2/mission14,
		/area/shuttle/scom/s2/mission15,
		/area/shuttle/event1/l1,
		/area/shuttle/event1/l2,
		/area/shuttle/event1/l3,
		/area/shuttle/event2/l1,
		/area/shuttle/event2/l2,
		/area/shuttle/event2/l3,
		/area/shuttle/assault/a1/station,
		/area/shuttle/assault/a2/station,
		/area/shuttle/infestation,
		/area/shuttle/infestation/i1,
		/area/shuttle/infestation/i2,
		/area/shuttle/infestation/i1/station,
		/area/shuttle/infestation/i1/ship,
		/area/shuttle/infestation/i2/station,
		/area/shuttle/infestation/i2/ship,
		/area/shuttle/train,
		/area/shuttle/train/stop,
		/area/shuttle/train/go,
		/area/shuttle/naval1/event1,
		/area/shuttle/naval1/event2,
		/area/shuttle/naval1/event3,
		/area/template_noop,
		/area/turbolift,
		/area/outpost/engineering/storage,
		/area/outpost/mining_main/maintenance,
		/area/outpost/security/lounge,
		/area/boarding_ship
	)
