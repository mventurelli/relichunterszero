event_inherited();

weaponLevel = 0;
isMod = false;
ugcItemId = 0;

range = 130;
in_range = false;
if sprite_exists(sprite_index) sprite = sprite_index;
gun = noone;
gun_ammo_current = 99999;
active = false;

myPrompt = instance_create_layer(x+10,y-25,"Interactive_Over",fx_prompt_e);
owner_add_owned_instance(myPrompt);

name = "I AM ERROR";
rarity = K_RARITY_COMMON;
myWeaponInfo = instance_create_layer(x,y,"Interactive_Over",fx_info_pickup);
owner_add_owned_instance(myWeaponInfo);

depth=-y-5;
image_speed = 0;

reflection_object_setup(25,-1,image_index);

on_top_of_object = false;
myObject = noone;
image_speed = 0;

wantToActivate = false;
activationClient = noone;

sprite = sprite_index;

arrowAnimation = 0; 
arrowAnimationSpeed = 0.2;

myRecycleInfo = noone;

if global.gameMode == gamemode_endless || global.gameMode == gamemode_storm
{
	myRecycleInfo = instance_create_layer(x,y,"Interactive_Over",fx_info_recycle);
	myRecycleInfo.owner = id;
}