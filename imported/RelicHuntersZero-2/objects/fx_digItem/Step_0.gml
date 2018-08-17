///Alpha control & Death

if (animationDone) 
{
    if (itemAlphaSpeed < itemAlphaSpeedMax) itemAlphaSpeed += min(itemAlphaSpeedAccel, (itemAlphaSpeedMax-itemAlphaSpeed));

    if (itemAlpha > 0) itemAlpha -= itemAlphaSpeed;
    else instance_destroy();
}

