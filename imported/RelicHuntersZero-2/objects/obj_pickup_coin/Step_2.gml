/// @description time based movement, check events and refs

if (!instance_exists_fast(magnet_player)) {
	magnet_player = noone;
	if (vertical_speed_start < interactive_speed) 
	{
		speed_per_second = max(0, speed_per_second - (magnet_friction));
	}		
	
	///Life and Alpha
	myTime += delta_time;

	if (myTime >= alert_time)
	{
		alpha_duration_current += delta_time;
		if alpha_duration_current >= alpha_duration
		{
			if (alpha == 1) alpha = 0.4;
			else alpha = 1;
			alpha_duration_current = 0;
		}
	}

	if (myTime >= life_time)
	{
		instance_destroy();
	}
}
else {
	if (point_distance(x,y,magnet_player.x,magnet_player.y) > magnet_range) 
	{
		magnet_player = noone;
	}
	else
	{
		speed_per_second = min(magnet_speed_max, speed_per_second + (magnet_accel));
		direction = point_direction(x,y,magnet_player.x,magnet_player.y);
	}
}

speed_per_second = max(0, speed_per_second - (friction_per_second * delta_time * ms_to_s_60));
speed = speed_per_second * delta_time * ms_to_s_60;
