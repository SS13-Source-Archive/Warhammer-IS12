/obj/item/clothing/mask/gas
	name = "gas mask"
	desc = "A face-covering mask that can be connected to an air supply. Filters harmful gases from the air."
	icon_state = "fullgas"
	item_state = "fullgas"
	equipsound = 'sound/items/equip/mask_equip.ogg'
	grab_sound = 'sound/items/handle/clothing_generic.ogg'
	item_flags = ITEM_FLAG_BLOCK_GAS_SMOKE_EFFECT | ITEM_FLAG_AIRTIGHT
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = FACE|EYES|HEAD
	w_class = ITEM_SIZE_NORMAL
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	var/gas_filter_strength = 1			//For gas mask filters
	var/list/filtered_gases = list("phoron", "sleeping_agent")
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 0, bomb = 0, bio = 75, rad = 0)

/obj/item/clothing/mask/gas/filter_air(datum/gas_mixture/air)
	var/datum/gas_mixture/filtered = new

	for(var/g in filtered_gases)
		if(air.gas[g])
			filtered.gas[g] = air.gas[g] * gas_filter_strength
			air.gas[g] -= filtered.gas[g]

	air.update_values()
	filtered.update_values()

	return filtered
/obj/item/clothing/mask/gas/ancient
	icon_state = "fullgas"
	item_state = "fullgas"
	name = "ancient gas mask"
	desc = "A leftover from the Old War, you can barely fucking see out of the thing, but it gets the job done."
	helmet_vision = TRUE

/obj/item/clothing/mask/gas/security
	name = "military grade gas mask"
	icon_state = "sgmask"
	item_state = "sgmask"
	siemens_coefficient = 0.7
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = FACE|EYES
	armor = list(melee = 15, bullet = 15, laser = 15, energy = 0, bomb = 0, bio = 75, rad = 0)

/obj/item/clothing/mask/gas/security/agent
	name = "inquisition gas mask"
	icon_state = "agent_mask"
	item_state = "agent_mask"
	siemens_coefficient = 0.7
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = FACE|EYES
	w_class = ITEM_SIZE_SMALL
	armor = list(melee = 15, bullet = 15, laser = 15, energy = 0, bomb = 0, bio = 75, rad = 0)

/obj/item/clothing/mask/gas/half
	name = "face mask"
	desc = "A compact, durable gas mask that can be connected to an air supply."
	icon_state = "halfgas"
	item_state = "halfgas"
	siemens_coefficient = 0.7
	body_parts_covered = FACE
	flags_inv = HIDEEARS|HIDEFACE
	w_class = ITEM_SIZE_SMALL
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 0, bomb = 0, bio = 55, rad = 0)

/obj/item/clothing/mask/gas/half/guardsmen
	name = "imperial guard face mask"
	icon_state = "ig_halfgas"
	item_state = "ig_halfgas"

//Plague Dr suit can be found in clothing/suits/bio.dm
/obj/item/clothing/mask/gas/plaguedoctor
	name = "plague doctor mask"
	desc = "A modernised version of the classic design, this mask will not only filter out phoron but it can also be connected to an air supply."
	icon_state = "plaguedoctor"
	item_state = "gas_mask"
	armor = list(melee = 0, bullet = 0, laser = 2,energy = 2, bomb = 0, bio = 90, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/gas/swat
	name = "\improper SWAT mask"
	desc = "A close-fitting tactical mask that can be connected to an air supply."
	icon_state = "swat"
	siemens_coefficient = 0.7
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = FACE|EYES
	armor = list(melee = 15, bullet = 15, laser = 15, energy = 0, bomb = 0, bio = 75, rad = 0)

/obj/item/clothing/mask/gas/swat/vox
	name = "alien mask"
	desc = "Clearly not designed for a human face."
	body_parts_covered = 0 //Hack to allow vox to eat while wearing this mask.
	species_restricted = list(SPECIES_VOX)
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/mask/gas/syndicate
	name = "tactical mask"
	desc = "A close-fitting tactical mask that can be connected to an air supply."
	icon_state = "swat"
	siemens_coefficient = 0.7
	armor = list(melee = 15, bullet = 15, laser = 15, energy = 0, bomb = 0, bio = 75, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/mask/gas/clown_hat
	name = "clown wig and mask"
	desc = "A true prankster's facial attire. A clown is incomplete without their wig and mask."
	icon_state = "clown"
	item_state = "clown_hat"
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/mask/gas/sexyclown
	name = "sexy-clown wig and mask"
	desc = "A feminine clown mask for the dabbling crossdressers or female entertainers."
	icon_state = "sexyclown"
	item_state = "sexyclown"
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/mask/gas/mime
	name = "mime mask"
	desc = "The traditional mime's mask. It has an eerie facial posture."
	icon_state = "mime"
	item_state = "mime"
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/mask/gas/monkeymask
	name = "monkey mask"
	desc = "A mask used when acting as a monkey."
	icon_state = "monkeymask"
	item_state = "monkeymask"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/mask/gas/sexymime
	name = "sexy mime mask"
	desc = "A traditional female mime's mask."
	icon_state = "sexymime"
	item_state = "sexymime"
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/mask/gas/death_commando
	name = "Death Commando Mask"
	icon_state = "death_commando_mask"
	item_state = "death_commando_mask"
	siemens_coefficient = 0.2
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/mask/gas/cyborg
	name = "cyborg visor"
	desc = "Beep boop!"
	icon_state = "death"
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/mask/gas/owl_mask
	name = "owl mask"
	desc = "Twoooo!"
	icon_state = "owl"
	body_parts_covered = HEAD|FACE|EYES
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/mask/gas/vox
	name = "vox breathing mask"
	desc = "A small oxygen filter for use by Vox"
	icon_state = "respirator"
	flags_inv = 0
	body_parts_covered = 0
	species_restricted = list(SPECIES_VOX)
	filtered_gases = list("phoron", "sleeping_agent", "oxygen")
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE

/obj/item/clothing/mask/gas/explorer
	name = "salvage miner mask"
	desc = "Often worn on salvage scavengers to protect their precious lungs from harmful gasses."
	icon_state = "gas_mining"
	item_state = "gas_mining"
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE