// load json config file

show_debug_message(working_directory + configFilename);

file = file_text_open_read(working_directory + configFilename);
jsonStr = "";
while (!file_text_eoln(file))
{
	jsonStr = jsonStr + file_text_readln(file);
}
file_text_close(file);
	
// load data into vars
configDataMap = json_decode(jsonStr);

// TODO: validate if is a valid config (eg: has all required properties?)

// load data
type = ds_map_find_value(configDataMap, "type");
name = ds_map_find_value(configDataMap, "name");
droppable = ds_map_find_value(configDataMap, "droppable");
armory = ds_map_find_value(configDataMap, "armory");
price = ds_map_find_value(configDataMap, "price");
capacity = ds_map_find_value(configDataMap, "capacity");
fire_rate_per_second = ds_map_find_value(configDataMap, "fire_rate_per_second");
damage = ds_map_find_value(configDataMap, "damage");
bullets_per_shot = ds_map_find_value(configDataMap, "bullets_per_shot");
ammo_type = ds_map_find_value(configDataMap, "ammo_type");
spread_angle = ds_map_find_value(configDataMap, "spread_angle");
recoil_pixels = ds_map_find_value(configDataMap, "recoil_pixels");
recoil_character_pixels = ds_map_find_value(configDataMap, "recoil_character_pixels");
screen_shake_force = ds_map_find_value(configDataMap, "screen_shake_force");
screen_shake_seconds = ds_map_find_value(configDataMap, "screen_shake_seconds");
projectile = ds_map_find_value(configDataMap, "projectile");
casing_origin_x = ds_map_find_value(configDataMap, "casing_origin_x");
casing_origin_y = ds_map_find_value(configDataMap, "casing_origin_y");
projectile_origin_x = ds_map_find_value(configDataMap, "projectile_origin_x");
projectile_origin_y = ds_map_find_value(configDataMap, "projectile_origin_y");

spritesheet_path = ds_map_find_value(configDataMap, "spritesheet_path");
spritesheet_prefix = ds_map_find_value(configDataMap, "spritesheet_prefix");

sprite_w = ds_map_find_value(configDataMap, "sprite_w");
sprite_h = ds_map_find_value(configDataMap, "sprite_h");
sprite_origin_x = ds_map_find_value(configDataMap, "sprite_origin_x");
sprite_origin_y = ds_map_find_value(configDataMap, "sprite_origin_y");


ds_map_destroy(configDataMap);

//
show_debug_message("Loading " + name);
	
//create common sprites

//load spritesheet, add it to a surface, and extract the animation frames
//create biggest necessary surface for each weapon

var surf;
var surface_width = next_power_of_two(sprite_w * animation_frames);
var surface_height = next_power_of_two(sprite_h);
surf = surface_create(surface_width, surface_height);
surface_set_target(surf);
// load sprites
sprite_filename = working_directory + spritesheet_path + spritesheet_prefix + "-sheet.png";
//show_debug_message(sprite_filename);
if file_exists(sprite_filename)
{
	//show_debug_message("image found: " + sprite_filename);		
	temp_sprite = sprite_add(sprite_filename, 1, false, true, 0, 0 );
		
	//clear surface
	draw_clear_alpha(c_black, 0); 

	draw_sprite(temp_sprite, 0, 0, 0);
	spr_custom = sprite_create_from_surface(surf, 0, 0, sprite_w, sprite_h, false, true, sprite_origin_x, sprite_origin_y);
	for (i = 1; i < animation_frames; i +=1)
	{
		sprite_add_from_surface(spr_custom, surf, i*sprite_w, 0, sprite_w, sprite_h, false, true);
	}

	sprite_index = spr_custom;
	object_set_sprite(sprite_index, spr_custom);
}
else {
	show_debug_message("Loadin weapon mod error - image not found: " + sprite_filename);
}

surface_reset_target();
surface_free(surf);

//set animation to default

weapon_set_animation_frame("default");

//make weapon instance persistent
persistent = true;