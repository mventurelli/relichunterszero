/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

active = true;
canSummonBoss = true;

range = 120;
in_range = false;

myPrompt = instance_create_layer(x,y-48,"Interactive",fx_prompt_e);
owner_add_owned_instance(myPrompt);

name = loc_key("BOSS_TELEPORTER");
myInfo = instance_create_layer(x,y,"Interactive_Over",fx_info_pickup);
rarity = K_RARITY_COMMON;
owner_add_owned_instance(myInfo);

myEffect = instance_create_layer(x,y,"Interactive",fx_teleporter);
owner_add_owned_instance(myEffect);