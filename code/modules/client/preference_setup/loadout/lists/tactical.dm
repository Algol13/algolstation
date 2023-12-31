/datum/gear/tactical
	sort_category = "Tactical Equipment"
	category = /datum/gear/tactical
	slot = slot_tie

/datum/gear/tactical/pcarrier
	display_name = "plate carrier selection"
	path = /obj/item/clothing/suit/armor/pcarrier
	cost = 1
	slot = slot_wear_suit

/datum/gear/tactical/pcarrier/New()
	..()
	var/armors = list()
	armors["green plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/green
	armors["navy blue plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/navy
	armors["tan plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/tan
	gear_tweaks += new/datum/gear_tweak/path(armors)

/datum/gear/tactical/armor_pouches
	display_name = "armor pouches"
	path = /obj/item/clothing/accessory/storage/pouches
	cost = 2

/datum/gear/tactical/armor_pouches/New()
	..()
	var/pouches = list()
	pouches["black armor pouches"] = /obj/item/clothing/accessory/storage/pouches
	pouches["blue armor pouches"] = /obj/item/clothing/accessory/storage/pouches/blue
	pouches["navy blue armor pouches"] = /obj/item/clothing/accessory/storage/pouches/navy
	pouches["green armor pouches"] = /obj/item/clothing/accessory/storage/pouches/green
	pouches["tan armor pouches"] = /obj/item/clothing/accessory/storage/pouches/tan
	gear_tweaks += new/datum/gear_tweak/path(pouches)

/datum/gear/tactical/large_pouches
	display_name = "armor large pouches"
	path = /obj/item/clothing/accessory/storage/pouches/large
	cost = 5

/datum/gear/tactical/large_pouches/New()
	..()
	var/bigpouches = list()
	bigpouches["large black armor pouches"] = /obj/item/clothing/accessory/storage/pouches/large
	bigpouches["large blue armor pouches"] = /obj/item/clothing/accessory/storage/pouches/large/blue
	bigpouches["large navy blue armor pouches"] = /obj/item/clothing/accessory/storage/pouches/large/navy
	bigpouches["large green armor pouches"] = /obj/item/clothing/accessory/storage/pouches/large/green
	bigpouches["large tan armor pouches"] = /obj/item/clothing/accessory/storage/pouches/large/tan
	gear_tweaks += new/datum/gear_tweak/path(bigpouches)

/datum/gear/tactical/armor_deco
	display_name = "armor customization"
	path = /obj/item/clothing/accessory/armor_tag
	flags = GEAR_HAS_SUBTYPE_SELECTION | GEAR_HAS_NO_CUSTOMIZATION

/datum/gear/tactical/helm_covers
	display_name = "helmet covers"
	path = /obj/item/clothing/accessory/helmet_cover
	flags = GEAR_HAS_SUBTYPE_SELECTION | GEAR_HAS_NO_CUSTOMIZATION

/datum/gear/tactical/kneepads
	display_name = "kneepads"
	path = /obj/item/clothing/accessory/kneepads

/datum/gear/tactical/holster
	display_name = "holster selection"
	path = /obj/item/clothing/accessory/storage/holster
	cost = 3

/datum/gear/tactical/holster/New()
	..()
	var/holsters = list()
	holsters["shoulder holster"] = /obj/item/clothing/accessory/storage/holster
	holsters["armpit holster"] = /obj/item/clothing/accessory/storage/holster/armpit
	holsters["waist holster"] = /obj/item/clothing/accessory/storage/holster/waist
	holsters["hip holster"] = /obj/item/clothing/accessory/storage/holster/hip
	holsters["thigh holster"] = /obj/item/clothing/accessory/storage/holster/thigh
	gear_tweaks += new/datum/gear_tweak/path(holsters)


/obj/item/clothing/accessory/storage/holster/knife/polymer
/datum/gear/tactical/sheath
	display_name = "machete sheath"
	path = /obj/item/clothing/accessory/storage/holster/machete

/datum/gear/tactical/knife_sheath
	display_name = "knife sheath selection"
	description = "A leg strapped knife sheath."
	path = /obj/item/clothing/accessory/storage/holster/knife
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/tactical/knife_sheath/New()
	..()
	var/knoife = list()
	knoife["knife sheath"] = /obj/item/clothing/accessory/storage/holster/knife
	knoife["leather knife sheath"] = /obj/item/clothing/accessory/storage/holster/knife

/datum/gear/tactical/tacticool
	display_name = "tacticool turtleneck"
	path = /obj/item/clothing/under/syndicate/tacticool
	slot = slot_w_uniform
