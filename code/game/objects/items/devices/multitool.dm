/**
 * Multitool -- A multitool is used for hacking electronic devices.
 *
 */

/obj/item/device/multitool
	name = "multitool"
	desc = "This small, handheld device is made of durable, insulated plastic, and tipped with electrodes, perfect for interfacing with numerous machines."
	description_info = "Multitools are incredibly versatile and can be used on a wide variety of machines. The most common use for this is to trip a device's wires without having to cut them. Simply click on an object with exposed wiring to use it. There might be other uses, as well..."
	description_fluff = "The common, every day multitool is descended from certain electrical tools from Earth's early space age. Though none too cheap, they are incredibly handy, and can be found in any self-respecting technician's toolbox."
	description_antag = "This handy little tool can get you through doors, turn off power, and anything else you might need."
	icon_state = "multitool"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	force = 5.0
	w_class = ITEM_SIZE_SMALL
	throwforce = 5.0
	throw_range = 15
	throw_speed = 3

	matter = list(DEFAULT_WALL_MATERIAL = 50,"glass" = 20)

	origin_tech = list(TECH_MAGNET = 1, TECH_ENGINEERING = 1)

	var/buffer_name
	var/atom/buffer_object

/obj/item/device/multitool/Destroy()
	unregister_buffer(buffer_object)
	return ..()

/obj/item/device/multitool/proc/get_buffer(var/typepath)
	// Only allow clearing the buffer name when someone fetches the buffer.
	// Means you cannot be sure the source hasn't been destroyed until the very moment it's needed.
	get_buffer_name(TRUE)
	if(buffer_object && (!typepath || istype(buffer_object, typepath)))
		return buffer_object

/obj/item/device/multitool/proc/get_buffer_name(var/null_name_if_missing = FALSE)
	if(buffer_object)
		buffer_name = buffer_object.name
	else if(null_name_if_missing)
		buffer_name = null
	return buffer_name

/obj/item/device/multitool/proc/set_buffer(var/atom/buffer)
	if(!buffer || istype(buffer))
		buffer_name = buffer ? buffer.name : null
		if(buffer != buffer_object)
			unregister_buffer(buffer_object)
			buffer_object = buffer
			if(buffer_object)
				GLOB.destroyed_event.register(buffer_object, src, /obj/item/device/multitool/proc/unregister_buffer)

/obj/item/device/multitool/proc/unregister_buffer(var/atom/buffer_to_unregister)
	// Only remove the buffered object, don't reset the name
	// This means one cannot know if the buffer has been destroyed until one attempts to use it.
	if(buffer_to_unregister == buffer_object && buffer_object)
		GLOB.destroyed_event.unregister(buffer_object, src)
		buffer_object = null

/obj/item/device/multitool/resolve_attackby(atom/A, mob/user)
	if(!isobj(A))
		return ..(A, user)

	var/obj/O = A
	var/datum/extension/interactive/multitool/MT = get_extension(O, /datum/extension/interactive/multitool)
	if(!MT)
		return ..(A, user)

	user.AddTopicPrint(src)
	MT.interact(src, user)
	return 1

//In memory of Norc
/obj/item/device/allenwrench
	name = "Allen Wrench"
	desc = "The wrench of Saint Allen. For he did stand before the gathering and declare 'No longer shall I struggle with pliers. Instead I shall create a new tool specific for this bolt. Brothers! Throw down your screw drivers and follow me!'. -Exert, The Phillips heresy."
	icon = 'icons/obj/items/allenwrench.dmi'
	icon_state = "awrench"
	item_state = "awrench"
	item_flags = ITEM_FLAG_NODROP
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = null
	canremove = FALSE
	w_class = ITEM_SIZE_SMALL
	var/constructionsystem = 0
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked")

/obj/item/device/allenwrench/attack(mob/living/carbon/C, mob/user)
	if(istype(C))
		visible_message("<span class='notice'>[C] is blessed in the name of Saint Allen.</span>")
	..()

/obj/item/device/allenwrench/attack_self(usr)
	to_chat(usr,"<span class='warning'>You can feel it.. you can just feel genius.</span>")


/obj/item/device/allenwrench/attackby(var/obj/item/gun/energy/las/lasgun/O, var/mob/user) //lets tech goys modify lasguns to full auto
//	if(O.tinkered == 1)
	if(istype(O,/obj/item/gun/energy/las/lasgun/tinkered))
		to_chat(user, "<span class='warning'>[O] has already been upgraded!</span>")
		return 1
	else if (!(istype(O, /obj/item/gun/energy/las/lasgun)))
		to_chat(user, "<span class='warning'>[O] cannot be upgraded!</span>")
		return 1
	else if(prob(15))
		qdel(O)
		new /obj/item/gun/energy/las/lasgun/tinkered (get_turf(src))
		playsound(loc, 'sound/items/Ratchet.ogg', 70, 1)
		visible_message("[O] is nimbly upgraded by the skilled tech-priest.")
	else
		playsound(loc, 'sound/items/Ratchet.ogg', 50, 1)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		visible_message("[user] tinkers with the [O]...")

/obj/item/device/allenwrench/dropped() //since nodrop is fucked this will deal with it for now.
	..()
	spawn(1) if(src) qdel(src)