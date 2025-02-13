/datum/job/rd
	name = "Research Director"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	minimal_player_age = 7
	officer = TRUE
	wiki_page = "Research_Director" //WS Edit - Wikilinks/Warning

	outfit = /datum/outfit/job/rd

	access = list(
		ACCESS_RD, ACCESS_HEADS, ACCESS_TOX, ACCESS_MORGUE,
		ACCESS_TOX_STORAGE, ACCESS_TELEPORTER, ACCESS_SEC_DOORS, ACCESS_MECH_SCIENCE,
		ACCESS_RESEARCH, ACCESS_ROBOTICS, ACCESS_XENOBIOLOGY, ACCESS_AI_UPLOAD,
		ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM,
		ACCESS_TECH_STORAGE, ACCESS_MINISAT, ACCESS_MAINT_TUNNELS, ACCESS_NETWORK) //WS edit - Gen/Sci Split
	minimal_access = list(
		ACCESS_RD, ACCESS_HEADS, ACCESS_TOX, ACCESS_MORGUE,
		ACCESS_TOX_STORAGE, ACCESS_TELEPORTER, ACCESS_SEC_DOORS, ACCESS_MECH_SCIENCE,
		ACCESS_RESEARCH, ACCESS_ROBOTICS, ACCESS_XENOBIOLOGY, ACCESS_AI_UPLOAD,
		ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_GATEWAY, ACCESS_MINERAL_STOREROOM,
		ACCESS_TECH_STORAGE, ACCESS_MINISAT, ACCESS_MAINT_TUNNELS, ACCESS_NETWORK) //WS edit - Gen/Sci Split

	display_order = JOB_DISPLAY_ORDER_RESEARCH_DIRECTOR

/datum/outfit/job/rd
	name = "Research Director"
	job_icon = "researchdirector"
	jobtype = /datum/job/rd

	id = /obj/item/card/id/silver
	belt = /obj/item/pda/heads/rd
	ears = /obj/item/radio/headset/heads/rd
	uniform = /obj/item/clothing/under/rank/rnd/research_director
	alt_uniform = /obj/item/clothing/under/rank/rnd/research_director/turtleneck //WS Edit - Alt Uniforms
	shoes = /obj/item/clothing/shoes/sneakers/brown
	suit = /obj/item/clothing/suit/toggle/labcoat
	alt_suit = /obj/item/clothing/suit/toggle/suspenders
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science //WS Edit - Alt Uniforms
	l_hand = /obj/item/clipboard
	l_pocket = /obj/item/laser_pointer
	// [CELADON-EDIT] - CELADON_BALANCE - Убираем телескопички
	// backpack_contents = list(/obj/item/melee/classic_baton/telescopic=1, /obj/item/modular_computer/tablet/preset/advanced=1)	// CELADON-EDIT - ORIGINAL
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced=1)
	// [/CELADON-EDIT]

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox
	courierbag = /obj/item/storage/backpack/messenger/tox

	chameleon_extras = /obj/item/stamp/rd
