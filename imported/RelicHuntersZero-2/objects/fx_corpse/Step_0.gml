/// Pause-Controlled Movement

if (!global.pause)
{
    if (speed_reset)
    {
        speed = old_speed;
        speed_reset = false;
    }
}
else if (speed_reset == false)
{
    old_speed = speed;
    speed = 0;
    speed_reset = true;
}

///Slow Down
if (speed > max_speed) speed = max_speed;
else speed -= corpse_friction;
if speed <= 0 speed = 0;

depth = -y;

//Hack:
if (sprite_index == spr_kamikaze_death) || (sprite_index == spr_kamikaze_death2) 
{
    //image_xscale = 1.25;
    //image_yscale = 1.25;
}

