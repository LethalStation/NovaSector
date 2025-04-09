// This file contains experimental flags that may not be production ready yet,
// but that we want to be able to easily flip as well as run on CI.
// Any flag you see here can be flipped with the `-D` CLI argument.
// For example, if you want to enable EXPERIMENT_MY_COOL_FEATURE, compile with -DEXPERIMENT_MY_COOL_FEATURE

// EXPERIMENT_MY_COOL_FEATURE
// - Does something really cool, just so neat, absolutely banging, gaming and chill

//LETHAL
//so basically idk what this is but it explodes when the client is newer than 515.
//we're not really doing any fancy testing or whatever so im just gonna untick this and whatever happens happens because shit needs to compile. yay!
//if one million things break then this is where it started

#if DM_VERSION < 515

	// You can't X-macro custom names :(
	#ifdef EXPERIMENT_MY_COOL_FEATURE
		#warn EXPERIMENT_MY_COOL_FEATURE is only available on 515+
		#undef EXPERIMENT_MY_COOL_FEATURE
	#endif
#elif defined(UNIT_TESTS)
	#define EXPERIMENT_MY_COOL_FEATURE
#endif

#if DM_VERSION >= 516
	#error "Remove all 515 experiments"
#endif
