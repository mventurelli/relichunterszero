///Setup

event_inherited();

image_speed = 0;

price = 800;

range = 120;
in_range = false;

myPrompt = instance_create_layer(x-44,y-21,"GUI",fx_prompt_e);
owner_add_owned_instance(myPrompt);

name = loc_key("TERMINAL_RELIC_DESC");
myInfo = instance_create_layer(x,y,"GUI",fx_info_pickup);
owner_add_owned_instance(myInfo);

depth = -y-32;

