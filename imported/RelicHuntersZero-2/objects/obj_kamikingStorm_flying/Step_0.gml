///Flight Control

//Target and Movement Control
if (targetX) && (targetY)
{
    targetDistance = point_distance(x,y,targetX,targetY);
    targetDirection = point_direction(x,y,targetX,targetY);
}
else flightState = "complete";
    
// Flight State Machine
if (flightState == "up")
{
    verticalSpeed -= verticalFriction * delta_time * ms_to_s_60;
    verticalSpeed += verticalAccel * delta_time * ms_to_s_60;
    if (verticalSpeed >= verticalSpeedMax) verticalSpeed = verticalSpeedMax;
    
    myHeight += verticalSpeed;
    
    if myHeight >= targetHeight
    {
        flightState = "go";
    }
}

if (flightState == "go")
{
    verticalSpeed -= verticalFriction * delta_time * ms_to_s_60;
    
    if (myHeight != targetHeight)
    {
        myHeight += max(verticalSpeed,(targetHeight-myHeight));
        if (myHeight < targetHeight) myHeight = targetHeight;
    }   
    
    flightSpeed -= flightFriction * delta_time * ms_to_s_60;
    flightSpeed += flightAccel * delta_time * ms_to_s_60;
    if (flightSpeed > flightSpeedMax) flightSpeed = flightSpeedMax;
    
    if (targetDistance <= landingDistance)
    {
        verticalSpeed = 0;
        flightState = "down";
    }
}

if (flightState == "down")
{
    if (flightSpeed) 
    {
        flightSpeed -= min(flightFriction,flightSpeed);
    }
    if (flightSpeed < 0) flightSpeed = 0;

    verticalSpeed -= verticalFriction * delta_time * ms_to_s_60;
    verticalSpeed += verticalAccel * delta_time * ms_to_s_60;
    
    if (verticalSpeed >= verticalSpeedMax) verticalSpeed = verticalSpeedMax;
    
    myHeight -= min(verticalSpeed,myHeight);
    
    if myHeight <= 0
    {
        myHeight = 0;
        flightSpeed = 0;
        flightState = "complete";
    }
}

//Resolve Horizontal Movement
if (flightSpeed)
{
    speed = flightSpeed * delta_time * ms_to_s_60;
    direction = targetDirection;
}

///Update Shadow Draw Position
shadow_object_setup(myHeight,-1,-1,global.default_shadow_yscale);

///Audio
audio_emitter_position(audio_emitter, x, y, 0);

