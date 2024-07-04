/datum/trader_data/grey_gakdog
	sign_type = /obj/structure/trader_sign/grey_gakdog

	initial_products = list(
		/obj/item/food/hotdog = list(PAYCHECK_CREW, INFINITY),
		/obj/item/food/danish_hotdog = list(PAYCHECK_CREW, INFINITY),
		/obj/item/food/butterdog = list(PAYCHECK_CREW, INFINITY),
		/obj/item/food/sausage = list(PAYCHECK_CREW * 0.3, INFINITY),
		/obj/item/food/bun = list(PAYCHECK_CREW * 0.2, INFINITY),
		/obj/item/reagent_containers/condiment/mustard = list(PAYCHECK_CREW * 0.1, INFINITY),
		/obj/item/reagent_containers/condiment/ketchup = list(PAYCHECK_CREW * 0.1, INFINITY),
		/obj/item/reagent_containers/cup/glass/coffee = list(PAYCHECK_CREW * 0.2, INFINITY),
		/obj/item/reagent_containers/cup/soda_cans/grey_bull = list(PAYCHECK_CREW * 0.3, INFINITY),
		/obj/item/reagent_containers/cup/soda_cans/melon_soda = list(PAYCHECK_CREW * 0.2, INFINITY),
	)

	initial_wanteds = list(
		/obj/item/food/sausage = list(PAYCHECK_CREW * 0.1, INFINITY, "per sausage"),
		/obj/item/food/ready_donk = list(PAYCHECK_CREW * 0.2, INFINITY, "per box"),
		/obj/item/food/ready_donk/donkhiladas = list(PAYCHECK_CREW * 0.2, INFINITY, "per box"),
		/obj/item/food/ready_donk/donkrange_chicken = list(PAYCHECK_CREW * 0.2, INFINITY, "per box"),
		/obj/item/food/ready_donk/mac_n_cheese = list(PAYCHECK_CREW * 0.2, INFINITY, "per box"),
		/obj/item/food/ready_donk/nachos_grandes= list(PAYCHECK_CREW * 0.3, INFINITY, "per box"),
	)

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"Don't waste my time, dickhead!",
			"Stop messin' around!",
			"Cut it out asshole!",
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"Fuck off if you're not going to buy anything!",
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"Ohmygod thank yoouuuuu~!",
		),
		INTERESTED_PHRASE = list(
			"You got Ready Donks?",
		),
		BUY_PHRASE = list(
			"Thank you for your purchase~!",
			"Come again anytime, cutie!",
			"I love your business!",
		),
		NO_CASH_PHRASE = list(
			"What, no money? Fuck off!",
		),
		NO_STOCK_PHRASE = list(
			"Sorrrry, we're out! ",
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Stop bringing me this shit, asshole!.",
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"What the fuck is this?!",
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"I'm full up, go away!.",
		),
		TRADER_LORE_PHRASE = list(
			"Helloooo~, welcome to DOG STAR MAN!",
			"I get all my meat fresh off the skipjack, honest!",
			"They say you don't get rich off being a gakster, but by feeding a gakster.",
			"We're thinking about expanding into pizza soon!",
			"My name's Grey! I run the hot dog stand, and I'm working on a mixtape.",
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"Not buying right now.",
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"Not selling right now.",
		),
		TRADER_BATTLE_START_PHRASE = list(
			"GET BACK HERE YOU FUCK!",
		),
		TRADER_BATTLE_END_PHRASE = list(
			"ROT, CUNT!",
		),
		TRADER_SHOP_OPENING_PHRASE = list(
			"Come buy my meat!",
		),
	)



/datum/trader_data/old_fisherman
	sign_type = /obj/structure/trader_sign/old_fisherman

	initial_products = list(
		/obj/item/fishing_rod = list(PAYCHECK_CREW * 0.7, INFINITY),
		/obj/item/fishing_rod/telescopic = list(PAYCHECK_CREW * 1.4, 5),
		/obj/item/fishing_rod/tech = list(PAYCHECK_CREW * 10, 1),
		/obj/item/fishing_line = list(PAYCHECK_CREW * 0.1, INFINITY),
		/obj/item/fishing_line/reinforced = list(PAYCHECK_CREW * 0.8, 5),
		/obj/item/fishing_hook = list(PAYCHECK_CREW * 0.1, INFINITY),
		/obj/item/fishing_hook/magnet = list(PAYCHECK_CREW * 0.7, 5),
		/obj/item/fishing_hook/rescue = list(PAYCHECK_CREW * 1.7, 5),
		/obj/item/bait_can/worm = list(PAYCHECK_CREW * 0.2, INFINITY)
	)

	initial_wanteds = list(
		/obj/item/fish/lanternfish = list(PAYCHECK_CREW * 2, 10, "per fish"),
		/obj/item/fish/chasm_crab = list(PAYCHECK_CREW * 2, 10, "per fish"),
		/obj/item/fish/donkfish = list(PAYCHECK_CREW * 2.5, 10, "per fish"),
		/obj/item/fish/ratfish = list(PAYCHECK_CREW * 0.7, 10, "per fish"),
		/obj/item/fish/slimefish = list(PAYCHECK_CREW * 1.2, 10, "per fish"),
		/obj/item/fish/zipzap = list(PAYCHECK_CREW * 1.7, 10, "per fish"),
		/obj/item/fish/clownfish/lube = list(PAYCHECK_CREW * 2, 10, "per fish"),
	)

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"Well, I won't be needing that, fella.",
			"Thanks, but no thank you.",
			"Nah, fella, don't need that.",
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"Hey, that's alright, but you come back now.",
			"Oh, change your mind?",
			"Well, I'll still be here.",
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"Well thanks for the help, fella!",
			"I really appreciate it.",
			"Excellent doin' business.",
		),
		INTERESTED_PHRASE = list(
			"Come on now, show me what you got on ya!",
		),
		BUY_PHRASE = list(
			"Thanks fella! Come by whenever ya need.",
			"Appreciate your doin business with me.",
		),
		NO_CASH_PHRASE = list(
			"No money? That's alright, I'll be here.",
			"Y'can come back for it, no sweat.",
		),
		NO_STOCK_PHRASE = list(
			"Fresh outta that, sorry fella.",
			"No more of those in stock.",
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Well now, no, I don't really need that.",
			"No thanks, fella.",
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"This ain't doin' it for me, fella.",
			"No thanks, fella.",
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"I'm full up today, I don't go no more space for more.",
			"I'm done buyin' those for today.",
			"Yer gonna run me out of business!",
		),
		TRADER_LORE_PHRASE = list(
			"You hear the one about the Tailypo?",
			"It's a story about Old Jake, who kept himself a room out in the cache where it's still weird and wild.",
			"One day he found himself in that old room with no food, no flares, just the fire he made.",
			"N'so he figures he'll have sleep for dinner n' sets down for the night.",
			"But he wakes up in the middle of the night hearin' somethin' rummage in his pack.",
			"Think's it's another fella, so he gets his knife and he leaps at it!",
			"But it was a creature dark as DOWN, with big gleaming teeth and claws, n' a long bushy tail.",
			"Well he brings that knife down and! OFF! Comes that tail!",
			"Ol' Jake shut his door tight and got to cleanin' that tail. He cooked and he ate it!",
			"And that ol' tail tasted real good, like when you crack a Moffic box.",
			"He slept real good too, with a full tummy.",
			"But just as he's drifting off, he hears somethin' come scratchin' at his door",
			"He figured he'd stay quiet, but it scratched and scratched.",
			"It scratched and scratched some more, until suddenly this voice rings out, harsh as whisper, loud as bell,",
			"'Tailypo! Tailypo! I want my Tailypo!'",
			"He thought, ain't no gakster talk like that and ain't no creature talk at all.",
			"But it said it again, 'Tailypo! Tailypo! I want my Tailypo!'",
			"N'so he gets to settin' up, and lays his rifle across his lap,",
			"Figurin' he'd shoot whatever was makin' all that racket if it tried to bust in.",
			"'N it's quiet for bit, so he gets to driftin' off again, right on the cusp of sleep.",
			"When the scratching gets frantic! And the door's bangin' and fixin' to bust off the hinges.",
			"And that voice bellows! 'TAILYPO! TAILYPO! GIVE ME BACK MY TAILYPO!'",
			"'N now he's frantic! He tries to rack that ol' gun but gets a round stovepiped in there,",
			"Panicin' 'n he can't get it out! He starts up yellin, 'I AIN'T GOT YER TAILYPO!'",
			"The door's still gettin' thrashed off the frame, but then he swears he starts hearing it in the room!",
			"There's scratchin' comin' from all around, every direction,",
			"And Ol' Jake he dropped his gun and started screamin'! Held his head in his hands and bawled!",
			"'I AIN'T GOT IT! I ATE IT! I ATE YOUR TAILYPO!'",
			"And that voice roared and wailed and gnashed some too,",
			"GIVE ME MY TAILPO! GIVE IT BACK! GIVE IT BACK!",
			"And the scratchin's all over him now, and he's tryna fight back but it's like there's nothin' there,",
			"He's just swingin' at the air but it's ripping him apart.",
			"And, well, he never did come back around the Pentola, but you know what I heard?",
			"I heard they found his room he was keepin' in and it was all busted up.",
			"I heard they ain't never heard from him again.",
			"'N you know what else? I heard, if you go out in the cache late 'n you're all alone,",
			"You might hear it out there whispering,",
			"'Tailypo, Tailypo, now I've got my Tailypo.'",
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"I ain't fixin' to buy right now, fella.",
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"I ain't fixin' to sell right now, fella.",
		),
		TRADER_BATTLE_START_PHRASE = list(
			"How're you gonna treat me like that? Get back here!",
			"You rat! Best not let me catch you!",
		),
		TRADER_BATTLE_END_PHRASE = list(
			"I don't like doing that to a man.",
			"Never liked solving my problems like this.",
		),
		TRADER_SHOP_OPENING_PHRASE = list(
			"Come on down to my ol' fishin' stand!",
		),
	)

/datum/trader_data/stalker
	sign_type = /obj/structure/trader_sign/stalker

	initial_products = list(
		/obj/item/gun/ballistic/rifle/chokyu = list(PAYCHECK_COMMAND * 20, 3),
		/obj/item/gun/ballistic/automatic/suppressed_rifle/grenade_launcher = list(PAYCHECK_COMMAND * 22, 2),
		/obj/item/gun/energy/modular_laser_rifle = list(PAYCHECK_COMMAND * 20, 5),
		/obj/item/gun/ballistic/automatic/wylom = list(PAYCHECK_COMMAND * 30, 2),
		/obj/item/ammo_box/magazine/c8marsian = list(PAYCHECK_COMMAND * 5, 15),
		/obj/item/ammo_box/magazine/c980_grenade/drum = list(PAYCHECK_COMMAND * 7, 7),
		/obj/item/ammo_box/magazine/ammo_stack/c60_strela/prefilled = list(PAYCHECK_COMMAND * 5, 7),
	)

	initial_wanteds = list(
		/obj/item/lethal_morale_patch = list(PAYCHECK_COMMAND, INFINITY, "each"),
	)

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"Nope. Not buying that.",
			"Nah.",
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"Whatever.",
			"Yeah, sure.",
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"I'll take it.",
			"Alright."
		),
		INTERESTED_PHRASE = list(
			"You got the shit?",
			"Yo!",
		),
		BUY_PHRASE = list(
			"Nice.",
			"It's good.",
		),
		NO_CASH_PHRASE = list(
			"Ain't a charity.",
			"Don't apologize, just come back with money.",
		),
		NO_STOCK_PHRASE = list(
			"I'm out.",
			"I'm tapped.",
			"Ain't got shit.",
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Nah.",
			"Nope.",
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"This is trash.",
			"Don't waste my time.",
			"This isn't funny.",
			"Fuck off.",
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"I ain't buying anymore.",
		),
		TRADER_LORE_PHRASE = list(
			"Don't leave shit around, it breeds vermin.",
			"I pay for scalps.",
			"Kids don't know what this shit used to be like.",
			"Motherfucker's don't take care of the cache anymore, they just bust shit up.",
			"Corpos are gonna come down on us with all the flashy shit these kids get up to.",
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"Not right now.",
			"I'm not in the market.",
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"I'm out.",
			"Tapped, buddy.",
			"Ain't got shit.",
		),
		TRADER_BATTLE_START_PHRASE = list(
			"Get out of here, Gakster!",
			"Slip and DOWN yourself, cunt!",
			"Die, fucker!"
		),
		TRADER_BATTLE_END_PHRASE = list(
			"Ratfucker.",
			"Bastard.",
			"Shithead.",
			"Asshole.",
			"Dirtbag.",
		),
		TRADER_SHOP_OPENING_PHRASE = list(
			"Come on, I got the goods."
		),
	)

/datum/trader_data/lethal_pusher
	sign_type = /obj/structure/trader_sign/lethal_pusher

//don't add busted chems to this list
	initial_products = list(
		/obj/item/clothing/mask/cigarette/syndicate = list(PAYCHECK_CREW * 0.1, INFINITY),
		/obj/item/clothing/mask/cigarette/rollie/cannabis = list(PAYCHECK_CREW * 0.2, INFINITY),
		/obj/item/lighter = list(PAYCHECK_CREW * 0.1, INFINITY),
		/obj/item/reagent_containers/hash = list(PAYCHECK_CREW, 20),
		/obj/item/reagent_containers/pill/neurine = list(PAYCHECK_CREW, 30),
		/obj/item/reagent_containers/pill/psicodine = list(PAYCHECK_CREW, 30),
		/obj/item/reagent_containers/pill/epinephrine = list(PAYCHECK_CREW * 2, 20),
		/obj/item/reagent_containers/pill/happy = list(PAYCHECK_CREW * 1.2, 15),
		/obj/item/reagent_containers/pill/lsd = list(PAYCHECK_CREW * 0.2, 10),
		/obj/item/reagent_containers/cup/blastoff_ampoule = list(PAYCHECK_CREW * 1.7, 5),
	)

	initial_wanteds = list(
		/obj/item/storage/epic_loot_medical_case = list(PAYCHECK_COMMAND * 2, INFINITY),
		/obj/item/defibrillator = list(PAYCHECK_COMMAND * 4, INFINITY),
		/obj/item/epic_loot/military_flash = list(PAYCHECK_COMMAND * 3, INFINITY),
	)

	say_phrases = list(
		ITEM_REJECTED_PHRASE = list(
			"Don't waste my time, choom.",
			"Cut it out.",
		),
		ITEM_SELLING_CANCELED_PHRASE = list(
			"Whatever choom.",
			"I take brouzof man.",
		),
		ITEM_SELLING_ACCEPTED_PHRASE = list(
			"Proper.",
			"Sick with it.",
			"Fuck yeah.",
			"Yeah I fuck with it.",
		),
		INTERESTED_PHRASE = list(
			"Hey, lemme see that!",
			"Yo!",
			"Come through choom!",
		),
		BUY_PHRASE = list(
			"Nice.",
			"Score.",
			"This fucks.",
			"This slaps",
			"This busts.",
		),
		NO_CASH_PHRASE = list(
			"I take brouzof man, not vibes.",
			"I can't pay my rent in forwards.",
			"Come back with creds choom.",
		),
		NO_STOCK_PHRASE = list(
			"I'm out, choomie.",
			"That's out of stock.",
			"I'm not on deck with that.",
			"Sorry man, next time.",
		),
		NOT_WILLING_TO_BUY_PHRASE = list(
			"Not now.",
			"Not interested.",
			"Can't.",
		),
		ITEM_IS_WORTHLESS_PHRASE = list(
			"What is this?",
			"Nah, this is wrong.",
			"Huh?",
		),
		TRADER_HAS_ENOUGH_ITEM_PHRASE = list(
			"Nah, I'm done buying that.",
		),
		TRADER_LORE_PHRASE = list(
			"Why you wanna know?",
			"We're not tight like that.",
			"This is strictly business.",
			"I'm not your friend, I'm just your dealer.",
			"Don't lay this on me, it's not like that.",
			"Are you for real man?",
			"I'm gonna keep it real choom I don't get close with customers.",
		),
		TRADER_NOT_BUYING_ANYTHING = list(
			"I'm not buying anything today.",
			"Not today.",
		),
		TRADER_NOT_SELLING_ANYTHING = list(
			"I'm out.",
			"I'm not on deck.",
		),
		TRADER_BATTLE_START_PHRASE = list(
			"Fuck off!",
			"Suck a bullet, dipshit!",
		),
		TRADER_BATTLE_END_PHRASE = list(
			"Dipshit.",
			"Idiot.",
			"Fucker.",
			"Suck it.",
		),
		TRADER_SHOP_OPENING_PHRASE = list(
			"Yo, I'm good with it.",
			"Come on through choom.",
		),
	)
