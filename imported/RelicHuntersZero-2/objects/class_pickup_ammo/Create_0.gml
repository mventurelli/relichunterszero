event_inherited();

range = 130;
in_range = false;
sprite_index = spr_pickup_light;
ammo = 50;

myPrompt = instance_create_layer(x+10,y-25,"Interactive_Over",fx_prompt_e);
owner_add_owned_instance(myPrompt);

name = "I AM ERROR";
myInfo = instance_create_layer(x,y,"Interactive_Over",fx_info_pickup);
owner_add_owned_instance(myInfo);

depth=-y-2;

reflection_object_setup(25,-1,image_index);

on_top_of_object = false;
myObject = noone;

image_speed = 0;
image_index = 0;

kill = false;


