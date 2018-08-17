///Setup
event_inherited();

image_speed = 0.2;
image_xscale = -1;
depth = -y;

price = 6000;
allowBuy = false;
unlock = false;

range = 120;
in_range = false;

myPrompt = instance_create_layer(x-42,y+30,"GUI",fx_prompt_e);
owner_add_owned_instance(myPrompt);

name = loc_key("GUNNAR_INFO_ENDLESS_UNLOCK");
myInfo = instance_create_layer(x,y,"GUI",fx_info_pickup);
owner_add_owned_instance(myInfo);

myBalloon = noone;

