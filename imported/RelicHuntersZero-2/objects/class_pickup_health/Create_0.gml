event_inherited();

range = 130;
in_range = false;
hp = 50;
active = false;

myPrompt = instance_create_layer(x+10,y-25,"Interactive_Over",fx_prompt_e);
owner_add_owned_instance(myPrompt);
image_speed = 0;

name = loc_key("INFO_HEALTHPLUS");
rarity = K_RARITY_COMMON;
myInfo = instance_create_layer(x,y,"Interactive_Over",fx_info_pickup);
owner_add_owned_instance(myInfo);

depth=-y-2;

reflection_object_setup(25,-1,image_index);

on_top_of_object = false;
myObject = noone;
