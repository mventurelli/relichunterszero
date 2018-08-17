///Dynamic Movement


//Accelerate
if ( (isActive) && ((offsetX != activeOffsetX) || (offsetY != activeOffsetY)) ) || ( (!isActive) && ((offsetX !=0) || (offsetY!=0)) )
{
    activeSpeed += min( activeAccel,  activeSpeedMax-activeSpeed);
}
else activeSpeed = 0;


//Movement Orientation
if (isActive)
{ 
    if ((orientationX == 1) && (offsetX < activeOffsetX)) || ((orientationX == -1) && (offsetX > activeOffsetX)) offsetX += orientationX * min ( activeSpeed, abs(activeOffsetX-offsetX));
    
    if ((orientationY == 1) && (offsetY < activeOffsetY)) || ((orientationY == -1) && (offsetY > activeOffsetY)) offsetY += orientationY * min ( activeSpeed, abs(activeOffsetY-offsetY));
}
else
{
    if ((orientationX == 1) && (offsetX)) ||  ((orientationX == -1) && (offsetX < 0))                  offsetX -= orientationX * min ( activeSpeed, abs(offsetX));
    if ((orientationY == 1) && (offsetY)) ||  ((orientationY == -1) && (offsetY < 0))                  offsetY -= orientationY * min ( activeSpeed, abs(offsetY));
}

//Timed Activation
if (timedActive)
{
    isActive = true;    

    if (activeTimeCurrent < activeTime) activeTimeCurrent += delta_time;
    else {
        timedActive = false;
        activeTimeCurrent = 0;
    }
}


/* OLD CODE

//Accelerate
if ( (isActive) && ((offsetX != activeOffsetX) || (offsetY != activeOffsetY)) ) || ( (!isActive) && ((offsetX !=0) || (offsetY!=0)) )
{
    activeSpeed += min( activeAccel,  activeSpeedMax-activeSpeed);
}
else activeSpeed = 0;


//Movement Orientation
if (isActive)
{ 
    if (offsetX < activeOffsetX) offsetX += min ( activeSpeed, activeOffsetX-offsetX);
    if (offsetY < activeOffsetY) offsetY += min ( activeSpeed, activeOffsetY-offsetY);
}
else
{
    if (offsetX) offsetX -= min ( activeSpeed, offsetX);
    if (offsetY) offsetY -= min ( activeSpeed, offsetY);
}

//Timed Activation
if (timedActive)
{
    isActive = true;    

    if (activeTimeCurrent < activeTime) activeTimeCurrent += delta_time;
    else {
        timedActive = false;
        activeTimeCurrent = 0;
    }
}

/* */
/*  */
