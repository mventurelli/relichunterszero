event_inherited();
price = global.price_shield1;
unlock = false;
active = true;

range = 80;
in_range = false;

myPrompt = instance_create_layer(x-30,y-21,"Interactive",fx_prompt_e);
owner_add_owned_instance(myPrompt);

name = loc_key("GENERAL_SHOP_OVERSHIELD");
myInfo = instance_create_layer(x,y,"Interactive_Over",fx_info_pickup);
owner_add_owned_instance(myInfo);

image_speed = 0;

depth = -y-25;

weaponName = "I AM ERROR";

shopType = "shield";

