///"Physics"

if (vertical_speed_start)
{
    depth = -y;
	
	vertical_speed += fake_gravity;
	    
    draw_height += vertical_speed * delta_time * ms_to_s_60;
    sprite_angle += angular_speed * delta_time * ms_to_s_60;    
}

if ( (draw_height >= 0) && (vertical_speed_start) ) {
	timeToBounce = true;
}

if (timeToBounce)
{
    vertical_speed_start -= random_range(bounce_min,bounce_max);
    
    firstBounce = true;
    timeToBounce = false;
    playAudio = true;
    draw_height = 0;
    vertical_speed = 0;
     
    if (vertical_speed_start <= vertical_speed_start_min)
    {
        vertical_speed_start = 0;
        depth=layer_get_depth("Interactive_Under");
    }
    else 
    {
        angular_speed = random_range(angular_min,angular_max);
        vertical_speed = -vertical_speed_start;
    }
}

