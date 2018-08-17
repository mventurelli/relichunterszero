event_inherited();

image_speed = 0;

active = true;
buy = false;

range = 40;
in_range = false;

myPrompt = instance_create_layer(x,y-60,"GUI",fx_prompt_e);
owner_add_owned_instance(myPrompt);

myEffect = instance_create_layer(x,y,"Interactive",fx_teleporter);
owner_add_owned_instance(myEffect);

myLevel = -1;
myPrice = 0;

overrideCurrentLevel = false;
overrideLevel = noone;

