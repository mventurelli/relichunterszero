ugcItemId = argument0;

//set as mod
isMod = true;

configDataMap = global.steamUGCItemsDataMap[? ugcItemId];

// load data
name = configDataMap[? "name"];

load_weapon_mod_spritesheet();
