///Physics
//if (!active) return;

depth= -y;

if (vertical_speed_start) vertical_speed += fake_gravity;
else depth = layer_get_depth("Interactive_Under");

casing_height += vertical_speed * delta_time * ms_to_s_60;
casing_angle += angular_speed * delta_time * ms_to_s_60;

if casing_height >= 0 && (vertical_speed_start)
{
    casing_height = 0;
    vertical_speed = 0;
    vertical_speed_start -= random_range(bounce_min,bounce_max);
        
    if (vertical_speed_start <= vertical_speed_start_min)
    {
        vertical_speed_start = 0;
        angular_speed = 0;
    }
    else 
    {
        angular_speed = random_range(angular_min,angular_max);
        vertical_speed = -vertical_speed_start;
    }
}
