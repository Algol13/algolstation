/obj/item/crafting_holder
	var/singleton/crafting_stage/current_crafting_stage
	var/label_name

/obj/item/crafting_holder/Initialize(ml, singleton/crafting_stage/initial_stage, obj/item/target, obj/item/tool, mob/user)
	. = ..()
	name = "[target.name] assembly"
	var/mob/M = target.loc
	if(istype(M))
		M.drop_from_inventory(target)
		M.put_in_hands(src)
	target.forceMove(src)
	current_crafting_stage = initial_stage
	update_icon()
	update_strings()

/obj/item/crafting_holder/Destroy()
	for(var/thing in contents)
		qdel(thing)
	. = ..()

/obj/item/crafting_holder/attackby(obj/item/W, mob/user)

	if(istype(W, /obj/item/pen))
		var/new_label = sanitizeSafe(input(user, "What do you wish to label this assembly?", "Assembly Labelling", label_name), MAX_NAME_LEN)
		if(new_label && !user.incapacitated() && W.loc == user && user.Adjacent(src) && !QDELETED(src))
			to_chat(user, SPAN_NOTICE("You label \the [src] with '[new_label]'."))
			label_name = new_label
		return

	if(current_crafting_stage)
		var/singleton/crafting_stage/next_stage = current_crafting_stage.get_next_stage(W)
		if(next_stage && next_stage.progress_to(W, user, src))
			advance_to(next_stage, user, W)
			return

	. = ..()

/obj/item/crafting_holder/proc/advance_to(singleton/crafting_stage/next_stage, mob/user, obj/item/tool)
	var/obj/item/product = next_stage && next_stage.get_product(src)
	if(product)
		if(ismob(product) && label_name)
			var/mob/M = product
			M.SetName(label_name)
		if(ismob(src.loc))
			var/mob/M = src.loc
			M.drop_from_inventory(src)
			if(isitem(product))
				M.put_in_hands(product)
		qdel_self()
	else
		current_crafting_stage = next_stage
		update_icon()
		update_strings()

/obj/item/crafting_holder/on_update_icon()
	icon = current_crafting_stage.item_icon
	icon_state = current_crafting_stage.item_icon_state

/obj/item/crafting_holder/proc/update_strings()
	if(current_crafting_stage.item_desc)
		desc = current_crafting_stage.item_desc
