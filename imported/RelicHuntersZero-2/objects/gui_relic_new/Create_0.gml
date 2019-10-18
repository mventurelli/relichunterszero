/// @description Init Variables
event_inherited();

offsetX = 0.5;
offsetY = 0.95;

relic = K_RELIC_MIDNIGHT_BEER;
sprite = noone;
name = "";
description = "";
rarity = 0;

event_perform(ev_other,ev_user0);

myInfo = instance_create_layer(x,y,"GUI_Pause",fx_info_tooltip);
owner_add_owned_instance(myInfo);
in_range = false;