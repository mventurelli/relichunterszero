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

//newChar = instance_create_depth(posX, posY, -1, obj_player);
newChar = instance_create_layer(posX,posY,"Instances",obj_player);
newChar.configFilename = filename;

with (newChar)
{
    load_character_config();
}

return newChar;