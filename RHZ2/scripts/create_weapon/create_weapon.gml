// load json config file
filename = argument[0];

//x position
if (argument_count > 1) {
	posX = argument[1];
}
else {
	posX = 0;//random_range(0,room_width);
}

//y position
if (argument_count > 2) {
	posY = argument[2];
}
else {
	posY = 0;//random_range(0,room_width);
}

newWeapon = instance_create_layer(posX, posY, "Instances", obj_weapon);
newWeapon.configFilename = filename;

with (newWeapon)
{
    load_weapon_config();
}

return newWeapon;