///Animation

if (headshot) {
	myString = loc_key("HUD_PRECISIONKILL");
}	

if (orientation == 0)
{
    size_speed_current += size_accel_up;
    size_speed_current -= size_friction;
    if size_current >= size_max
    {
        size_speed_current = 0;
        orientation = 1;
    }
}

if orientation == 1
{
    size_speed_current -= size_accel_down;
    size_speed_current += size_friction;
    if size_current <= size_end
    {
        size_speed_current = 0;
        orientation = 2;
    }
}

size_current += size_speed_current;

