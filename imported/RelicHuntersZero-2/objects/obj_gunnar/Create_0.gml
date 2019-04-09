///Setup
event_inherited();

image_speed = 0.2;
image_xscale = -1;
depth = -y;

price = 0;

range = 120;
in_range = false;

myPrompt = instance_create_layer(x-42,y+30,"Interactive",fx_prompt_e);
owner_add_owned_instance(myPrompt);

name = loc_key("GUNNAR_INFO_POPUP");
myInfo = instance_create_layer(x,y,"Interactive_Over",fx_info_pickup);
rarity = K_RARITY_COMMON;
owner_add_owned_instance(myInfo);

myBalloon = noone;

