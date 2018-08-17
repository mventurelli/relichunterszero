///Setup
event_inherited();

spawnObject = noone;
unlock = false;

price = 0;

range = 100;
in_range = false;

myPrompt = instance_create_layer(x-30,y-21,"Interactive",fx_prompt_e);
owner_add_owned_instance(myPrompt);

name = "I AM ERROR";
myInfo = instance_create_layer(x,y,"Interactive_Over",fx_info_pickup);
owner_add_owned_instance(myInfo);

image_speed = 0;
depth = -y-25;

