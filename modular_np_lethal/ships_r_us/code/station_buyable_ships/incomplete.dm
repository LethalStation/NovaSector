/datum/map_template/shuttle/personal_buyable/incomplete
	personal_shuttle_type = PERSONAL_SHIP_TYPE_DIY
	port_id = "diy"

// Small incomplete ship for finishing yourself

/datum/map_template/shuttle/personal_buyable/incomplete/small
	name = "SF Khar-Habka"
	description = "A small-sized shuttle that comes without most of it's interior. \
		A popular choice among those who are more of the handy-do-it-yourself type \
		when it comes to high tech shuttle construction."
	credit_cost = CARGO_CRATE_VALUE * 6
	suffix = "diy_small"
	width = 15
	height = 11
	personal_shuttle_size = PERSONAL_SHIP_SMALL

/area/shuttle/personally_bought/do_it_yourself_small
	name = "SF Khar-Habka"

// Personal ship with some commodities

/datum/map_template/shuttle/personal_buyable/incomplete/medium
	name = "SF Khar-Hiktar"
	description = "A medium-sized shuttle that comes without most of it's interior. \
		A popular choice among those who are more of the handy-do-it-yourself type \
		when it comes to high tech shuttle construction."
	credit_cost = CARGO_CRATE_VALUE * 10
	suffix = "diy_medium"
	width = 15
	height = 11
	personal_shuttle_size = PERSONAL_SHIP_MEDIUM

/area/shuttle/personally_bought/do_it_yourself_medium
	name = "SF Khar-Hiktar"
