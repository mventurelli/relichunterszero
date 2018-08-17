///Track target

if instance_exists(class_player) && instance_exists(obj_digSpot)
{
    targetDirection = point_direction(x,y,obj_digSpot.x,obj_digSpot.y);
}
else instance_destroy();

///Animate alpha and die

if (fadeDirection)
{
    if (myAlpha < 1) myAlpha += min(alphaSpeedIn, 1-myAlpha);
}
else{
    if (myAlpha > 0) myAlpha -= alphaSpeedOut;
    else instance_destroy();
}

