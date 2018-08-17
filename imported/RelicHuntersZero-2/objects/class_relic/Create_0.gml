///Main Variables
event_inherited();

active = false;
full_relic = false;
equipped = false;
myTable = noone;

relicName = "";
relicDescription = "";

range = 95;
in_range = false;

myPrompt = instance_create_layer(x,y-21,"GUI",fx_prompt_e);
owner_add_owned_instance(myPrompt);

toggle = false;

image_speed = 0;
image_index = irandom(image_number-1);
depth=-y-30;

