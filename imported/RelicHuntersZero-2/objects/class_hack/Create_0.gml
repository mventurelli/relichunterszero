///Setup

event_inherited();

image_speed = 0.2;
sprite_index = spr_terminalClear;

range = 150;
in_range = false;

myNumber = 0;
myChallenge = "";

allowNewChallenge = true;

price = 0;
priceTier = global.endPriceTier_hack;
priceArray = global.endPrice_hackCommon;

myPrompt = instance_create_layer(x-44,y-21,"Interactive",fx_prompt_e);
owner_add_owned_instance(myPrompt);

name = "I AM ERROR";
myInfo = instance_create_layer(x,y,"Interactive_Over",fx_info_pickup);
owner_add_owned_instance(myInfo);

depth = -y-32;

rarity = K_RARITY_COMMON;

