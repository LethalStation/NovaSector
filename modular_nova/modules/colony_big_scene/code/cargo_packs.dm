// Engineering

/datum/supply_pack/engineering/random_lathe_boards
	name = "Technology Fabricator Board Triple Pack"
	desc = "Three random technology fabricator boards from the various departments."
	cost = CARGO_CRATE_VALUE * 10
	contains = list(
		/obj/item/circuitboard/machine/techfab/department/cargo,
		/obj/item/circuitboard/machine/techfab/department/engineering,
		/obj/item/circuitboard/machine/techfab/department/medical,
		/obj/item/circuitboard/machine/techfab/department/science,
		/obj/item/circuitboard/machine/techfab/department/security,
		/obj/item/circuitboard/machine/techfab/department/service,
	)
	crate_name = "colonization kit crate"

/datum/supply_pack/engineering/random_lathe_boards/fill(obj/structure/closet/crate/my_house_in_the_middle)
	for(var/iteraor in 1 to 3)
		var/obj/new_board = pick(contains)
		new new_board(my_house_in_the_middle)
