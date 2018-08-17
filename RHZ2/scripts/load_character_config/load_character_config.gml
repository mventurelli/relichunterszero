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
spritesheet_path = ds_map_find_value(configDataMap, "spritesheet_path");
spritesheet_prefix = ds_map_find_value(configDataMap, "spritesheet_prefix");

sprite_w = ds_map_find_value(configDataMap, "sprite_w");
sprite_h = ds_map_find_value(configDataMap, "sprite_h");
sprite_origin_x = ds_map_find_value(configDataMap, "sprite_origin_x");
sprite_origin_y = ds_map_find_value(configDataMap, "sprite_origin_y");

sprite_ui_w = ds_map_find_value(configDataMap, "sprite_ui_w");
sprite_ui_h = ds_map_find_value(configDataMap, "sprite_ui_h");
sprite_ui_origin_x = ds_map_find_value(configDataMap, "sprite_ui_origin_x");
sprite_ui_origin_y = ds_map_find_value(configDataMap, "sprite_ui_origin_y");

maxSpeed = ds_map_find_value(configDataMap, "max_speed");
maxHP = ds_map_find_value(configDataMap, "max_hp");
weapon_holder_x = ds_map_find_value(configDataMap, "weapon_holder_x");
weapon_holder_y = ds_map_find_value(configDataMap, "weapon_holder_y");
weapon_back_holder_x = ds_map_find_value(configDataMap, "weapon_back_holder_x");
weapon_back_holder_y = ds_map_find_value(configDataMap, "weapon_back_holder_y");
weapon_back_holder_rotation = ds_map_find_value(configDataMap, "weapon_back_holder_rotation");

ds_map_destroy(configDataMap);

//
show_debug_message("Loading " + name);
	
//create common sprites
var local_player_anim_names = global.player_common_anim_names;
var local_player_common_anim_frames = global.player_common_anim_frames;

//load a single sprite test
//temp_sprite = sprite_add(sprite_filename, 1, false, true, 53, 91 );
//sprite_index = temp_sprite;
//object_set_sprite(sprite_index, temp_sprite);

//load spritesheet, add it to a surface, and extract the animation frames
//create biggest necessary surface for each character only once
var surf;
var surface_width = 0;
var surface_height = next_power_of_two(sprite_h);
var temp_surface_width = 0;
for(var idx = 0; idx < anim_player_count; idx++)
{
	temp_surface_width = next_power_of_two(sprite_w * local_player_common_anim_frames[idx]);
	if (temp_surface_width > surface_width) 
	{
		surface_width = temp_surface_width;
	}	
}
surf = surface_create(surface_width, surface_height);
surface_set_target(surf);
// load sprites
for(idx = 0; idx < anim_player_count; idx++)
{
	sprite_filename = working_directory + spritesheet_path + spritesheet_prefix + "_" + local_player_anim_names[idx] + "-sheet.png";
	//show_debug_message(sprite_filename);
	if file_exists(sprite_filename)
	{
		//show_debug_message("image found: " + sprite_filename);		
		temp_sprite = sprite_add(sprite_filename, 1, false, true, 0, 0 );
		
		//clear surface
		draw_clear_alpha(c_black, 0); 

		draw_sprite(temp_sprite, 0, 0, 0);
		spr_custom = sprite_create_from_surface(surf, 0, 0, sprite_w, sprite_h, false, true, sprite_origin_x, sprite_origin_y);
		for (i = 1; i < local_player_common_anim_frames[idx]; i +=1)
		{
			sprite_add_from_surface(spr_custom, surf, i*sprite_w, 0, sprite_w, sprite_h, false, true);
		}
		
		spriteAnimations[idx] = spr_custom;
		
		//sprite_index = spr_custom;
		//object_set_sprite(sprite_index, spr_custom);
	}
	else {
		show_debug_message("Loadin character mod error - image not found: " + sprite_filename);
	}
}

surface_reset_target();
surface_free(surf);

//make character instance persistent
persistent = true;