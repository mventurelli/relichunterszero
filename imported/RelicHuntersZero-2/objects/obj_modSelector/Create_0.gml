///Setup

event_inherited();

image_speed = 0;

range = 120;
in_range = false;

myPrompt = instance_create_layer(x-34,y-21,"Interactive",fx_prompt_e);
owner_add_owned_instance(myPrompt);

name = loc_key("TERMINAL_GUN_MOD_SELECTOR_DESC");
myInfo = instance_create_layer(x,y,"Interactive_Over",fx_info_pickup);
owner_add_owned_instance(myInfo);

depth = -y-32;

//check for gun mods
hasGunMods = false;
currentModIndex = 0;
for (var modIndex = 0; modIndex < ds_list_size(global.steamUGCItemsList); modIndex++) {

	show_debug_message("modindex");
	show_debug_message(modIndex);
	show_debug_message(global.steamUGCItemsList[| modIndex]);	
	show_debug_message(global.steamUGCItemsDataMap[? global.steamUGCItemsList[| modIndex]]);	
	var modData = global.steamUGCItemsDataMap[? global.steamUGCItemsList[| modIndex]];
	
	//only gun mods exist so far
	if (modData[? "type"] != "gun") continue;
	hasGunMods = true;	
	break;
}

//get spawner position
spawner = instance_nearest(x, y, obj_spawn_mod);

//holds the last spawned item reference
lastSpawnedItem = noone;

//select first weapon on first step
first_step = true;

