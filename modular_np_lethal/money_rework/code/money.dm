// LETHALSTATION EDIT:
//  cash from eris
//  all credit for the money goes to kegdo for their immaculate work
//  fuck holograms

/obj/item/lethalcash
	name = "coin"
	desc = "Ironically, this is worthless."
	icon = 'modular_np_lethal/money_rework/icons/lethalmoney.dmi'
	icon_state = "lethalcash1"
	worn_icon_state = "nothing"
	throwforce = 0
	throw_speed = 2
	throw_range = 2
	w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE
	var/value = 0
	grind_results = list(/datum/reagent/cellulose = 10)


/obj/item/lethalcash/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/lethalcash))
		var/obj/item/lethalcash/bundle/bundle
		if(istype(W, /obj/item/lethalcash/bundle))
			bundle = W
		else
			var/obj/item/lethalcash/cash = W
			bundle = new (loc)
			bundle.value = cash.value
			qdel(cash)

		bundle.value += value
		bundle.update_icon()
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.put_in_active_hand(bundle)
		to_chat(user, ("You add [value] credits worth of money to the bundle. <br>It holds [bundle.value] credits now."))
		qdel(src)


/obj/item/lethalcash/Destroy()
	. = ..()
	value = 0 //if it ain't worth don't spend it


/obj/item/lethalcash/bundle
	icon_state = ""
	desc = "A coin, bill, or collection thereof representing the Solarian Standard Credit, the dominant currency of the Sol system. Owing to the nature of Pluto, \
			there's a lot of these little fuckers out there. Like it or not, you'll need more of this."

/obj/item/lethalcash/examine(mob/user)
	. = ..()

	. += span_engradio("This is worth [value] credits.")

/obj/item/lethalcash/bundle/update_icon()
	. = ..()
	cut_overlays()
	var/sum = src.value
	var/num = 0
	var/list/denominations = list(1000,500,200,100,50,20,10,5,1)
	for(var/i in denominations)
		while(sum >= i && num < 50)
			sum -= i
			num++
			var/image/banknote = image('modular_np_lethal/money_rework/icons/lethalmoney.dmi', "lethalcash[i]")
			var/matrix/M = matrix()
			M.Translate(rand(-6, 6), rand(-4, 8))
			banknote.transform = M
			src.add_overlay(banknote)
	if(value == 1)
		name = "1 credit coin"
		desc = "A lonely credit coin. Won't you get her some friends?"
	else
		name = "[value] credits"

/obj/item/lethalcash/bundle/attack_self()
	var/amount = input(usr, "How many credits do you want to take? (0 to [src.value])", "Take Money", 20) as num
	amount = round(clamp(amount, 0, src.value))
	if(amount==0) return 0
	else if(!Adjacent(usr))
		to_chat(usr, span_warning("You can't reach the bundle!"))
		return

	if(!value)
		qdel(src)

	var/obj/item/lethalcash/bundle/bundle = new (usr.loc)
	bundle.value = amount
	bundle.update_icon()
	usr.put_in_hands(bundle)

	src.value -= amount
	src.update_icon()
	if(!value)
		qdel(src)

/obj/item/lethalcash/bundle/Initialize()
	. = ..()
	update_icon()

/obj/item/lethalcash/bundle/c1
	//name = "1 credit coin"
	//desc = "A one-credit coin. Even a Yellow could figure this one out."
	value = 1

/obj/item/lethalcash/bundle/c5
	//name = "5 credit coin"
	//desc = "A five-credit coin. Arguably the starting point for restaurant tips."
	value = 5

/obj/item/lethalcash/bundle/c10
	//name = "10 credit coin"
	//desc = "A ten-credit coin. Pleasantly heavy."
	value = 10

/obj/item/lethalcash/bundle/c20
	//name = "20 credit bill"
	//desc = "A twenty-credit bill. Often found stuffed into the bunnysuits of Black Company showgirls."
	value = 20

/obj/item/lethalcash/bundle/c50
	//name = "50 credit bill"
	//desc = "A fifty-credit bill. The least disappointing thing to find in a cache raid."
	value = 50

/obj/item/lethalcash/bundle/c100
	//name = "100 credit bill"
	//desc = "A one-hundred-credit bill, the lifeblood of interstellar commerce."
	value = 100

/obj/item/lethalcash/bundle/c200
	//name = "200 credit bill"
	//desc = "A two-hundred-credit bill, depicting a Marsian sunrise."
	value = 200

/obj/item/lethalcash/bundle/c500
	//name = "500 credit bill"
	//desc = "A five-hundred-credit bill. More of these come and go from the Spinward Territories than people."
	value = 500

/obj/item/lethalcash/bundle/c1000
	//name = "1000 credit bill"
	//desc = "A crumpled one-thousand-credit bill. The preferred foodstuff of government."
	value = 1000


/proc/spawn_lethal_money(sum, spawnloc, mob/living/carbon/human/H) //there's a little weirdness between selling and generating cash but i'm fine with that
	var/obj/item/lethalcash/bundle/fundle = new (spawnloc)
	fundle.value = sum
	fundle.update_icon()
	usr.put_in_hands(fundle)

/obj/item/lethalcash/bundle/proc/spend(amount, pay_anyway = FALSE)
	if(value >= amount)
		//message_admins("[value] is greater than or equal to [amount]")
		value -= amount
		if(value == 0)
			qdel(src)
		update_appearance()
		return amount
	else if(pay_anyway)
		qdel(src)
		return value
	else
		return 0
