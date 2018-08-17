///Replay Animation Delayed

if (image_speed == 0)
{
    if (animationDelayCurrent < animationDelay) animationDelayCurrent += delta_time;
    else image_speed = animationSpeed;
}

///Position myself

if (!positionFound) && (owner) && (instance_exists(owner))
{
    if (collision_circle(owner.x+124,owner.y+16,64,class_solid,false,true) < 0) && (collision_circle(owner.x+124,owner.y+16,64,obj_ass,false,true) < 0)
    {
        drawX = owner.x+124;
        drawY = owner.y+16;
        drawOrientation = -1;
    }
    else if (collision_circle(owner.x-124,owner.y+16,64,class_solid,false,true) < 0) && (collision_circle(owner.x-124,owner.y+16,64,obj_ass,false,true) < 0)
    {
        drawX = owner.x-124;
        drawY = owner.y+16;
        drawOrientation = 1;
    }
    positionFound = true;
}

