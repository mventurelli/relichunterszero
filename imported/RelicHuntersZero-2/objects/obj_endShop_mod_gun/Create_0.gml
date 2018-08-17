event_inherited();
spawnObject = obj_pickup_mod_gun;
name = "";
isMod = true;
ugcItemId = 0;

var tmpModId = get_random_gun_mod(true);
if (tmpModId > 0) {
	ugcItemId = tmpModId;
	load_endless_shop_mod_gun(ugcItemId);
}
else {
	instance_destroy();
}
