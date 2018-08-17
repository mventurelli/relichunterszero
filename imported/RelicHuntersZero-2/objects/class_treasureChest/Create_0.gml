///Setup
event_inherited();
spawnRelic = noone;
spawnWeapon = noone;
spawnCoins = 0;
spawnSprite = noone;
spawnChallenge = "";

audio_play_sound(sfx_relic_on,99,false);
unlock = false;

fxObject = fx_chestRegular;

canActivate = false;
activateTime = 600000;//room_speed*0.6;
activateTimeCurrent = 0;

image_speed = 0.2;
image_xscale = 2
image_yscale = 2;

depth = -y-16;

range = 130;
in_range = false;

myPrompt = instance_create_layer(x+10,y-25,"Interactive_Over",fx_prompt_e);
owner_add_owned_instance(myPrompt);

name = loc_key("INFO_TREASURECHEST");
myWeaponInfo = instance_create_layer(x,y,"Interactive_Over",fx_info_pickup);
owner_add_owned_instance(myWeaponInfo);

reflection_object_setup(25,-1,image_index);
