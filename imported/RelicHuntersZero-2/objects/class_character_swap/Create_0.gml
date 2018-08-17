///Main Variables
event_inherited();

range = 100;
in_range = false;

myCharacter = char_pinky;

myPrompt = instance_create_layer(x+10,y-25,"GUI",fx_prompt_e);
owner_add_owned_instance(myPrompt);
image_speed = 0.2;

depth=-y-2;

active = false;
unlock = false;

if (active) reflection_object_setup(0,-1,image_index);
else reflection_object_setup(0,spr_casing_blob,0);

oldWeapon1 = noone;
oldWeapon2 = noone;

