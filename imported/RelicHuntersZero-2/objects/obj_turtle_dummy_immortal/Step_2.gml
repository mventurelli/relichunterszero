if (!hp) achievement_give("ACHIEVEMENT_TUTORIAL");

event_inherited();

if (instance_exists(id))
{
    ai_movetarget_x = dummy_positionY;
    ai_movetarget_y = dummy_positionX;
    
    moving = false;
    if (ai_movetarget_x) && (ai_movetarget_y) && point_distance(x,y,ai_movetarget_x,ai_movetarget_y) > 3
    {
        moving = true;
    }
}

