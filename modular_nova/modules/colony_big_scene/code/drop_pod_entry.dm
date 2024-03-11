/// Drop pod sends the newly spawned person to a random latejoin spawnpoint
/datum/job/proc/drop_pod_that_man(mob/living/carbon/human/new_spawn)
	var/obj/structure/closet/supplypod/centcompod/new_pod = new()
	new_spawn.forceMove(new_pod)
	var/obj/effect/landmark/latejoin/latejoin_marker = get_latejoin_spawn_point()
	new /obj/effect/pod_landingzone(get_turf(latejoin_marker), new_pod)
