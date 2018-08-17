///Main Variables
event_inherited();

price = global.price_light1;
unlock = false;

active = true;

range = 80;
in_range = false;

myPrompt = instance_create_layer(x-30,y-21,"Interactive",fx_prompt_e);
owner_add_owned_instance(myPrompt);

name = loc_key("GENERAL_SHOP_RELIC");
myInfo = instance_create_layer(x,y,"Interactive_Over",fx_info_pickup);
owner_add_owned_instance(myInfo);

image_speed = 0;
depth = -y-25;

relicSprite1 = spr_pineapple1;
relicSprite1Draw = false;
relicSprite2 = spr_pineapple2;
relicSprite2Draw = true;
relicSprite3 = spr_pineapple3;
relicSprite3Draw = false;
relicCompleteSprite = -1;

fullRelicTextBig = loc_key("HUD_UNLOCK_RELIC");
fullRelicTextSmall = loc_key("HUD_UNLOCK_RELIC_COMPLETE");

announce = noone;

shopType = "relic";

