///Achievement & Force Stop

event_inherited();
if (instance_exists(id))
{
    if (dash_speed = 20)
    {
        dash_speed = 1;
        dummy_positionX = x;
        dummy_positionY = y;
    }
    
    speed_walk = 0;
    speed_sprint = 0;
}

if (!hp) achievement_give("ACHIEVEMENT_TUTORIAL");


