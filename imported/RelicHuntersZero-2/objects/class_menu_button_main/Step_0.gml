///Dynamic Movement

event_inherited();

if (isSelected)
{
    if (x < selectPositionX) x += min( moveSpeed, abs(selectPositionX-x) );
    if (x > selectPositionX) x -= min( moveSpeed, abs(selectPositionX-x) );
    if (y < selectPositionY) y += min( moveSpeed, abs(selectPositionY-y) );
    if (y > selectPositionY) y -= min( moveSpeed, abs(selectPositionY-y) );
    
    if (starScale > starScaleFinal) starScale -= min( starScaleSpeed, abs(starScale-starScaleFinal) );
}
else
{
    if (x < startPositionX) x += min( moveSpeed, abs(startPositionX-x) );
    if (x > startPositionX) x -= min( moveSpeed, abs(startPositionX-x) );
    if (y < startPositionY) y += min( moveSpeed, abs(startPositionY-y) );
    if (y > startPositionY) y -= min( moveSpeed, abs(startPositionY-y) );
    
    starScale = starScaleInitial;
}

