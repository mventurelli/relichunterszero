///Physics
depth= -y;

if (vertical_speed_start) 
	vertical_speed += fake_gravity;
else 
	depth = layer_get_depth("Interactive_Under");

draw_height += vertical_speed * delta_time * ms_to_s_60;

if draw_height >= 0 && (vertical_speed_start)
{
    draw_height = 0;
    vertical_speed = 0;
    vertical_speed_start -= random_range(bounce_min,bounce_max);
        
    if (vertical_speed_start <= vertical_speed_start_min) 
	{
		vertical_speed_start = 0;
		speed_per_second = 0;
	}
    else {
		vertical_speed = -vertical_speed_start;
	}
}

sprite_subimage += image_speed;
if (vertical_speed_start)
{
    sprite = sprite1;
    if (sprite_subimage > 5) sprite_subimage = 0;
}
else 
{
    sprite = sprite2;
    if (sprite_subimage > 14) sprite_subimage = 0;
}

///Attraction and Pickup
if (!instance_exists_fast(magnet_player)) 
{
	if (vertical_speed_start < interactive_speed) && instance_exists(class_player)
	{
	    var candidate_magnet_player = instance_nearest(x,y,class_player);
		if (candidate_magnet_player != noone) {
		    if point_distance(x,y,candidate_magnet_player.x,candidate_magnet_player.y) <= magnet_range
		    {
				magnet_player = candidate_magnet_player;
				//give initial speed
				speed_per_second = min(magnet_speed_max, speed_per_second + (magnet_accel));
		    }   
		}
	}
}
