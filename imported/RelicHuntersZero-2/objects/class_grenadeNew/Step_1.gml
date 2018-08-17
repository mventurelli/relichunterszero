///Targeting Reticule

if (!targetSetup)
{
    var rX, rY;
    
    var virtualHeight = draw_height;
    var virtualVerticalSpeed = vertical_speed;
    var virtualHorizontalSpeed = speed_per_second;
    var virtualFriction = friction_per_second;
    var virtualGravity = fake_gravity;
    var totalDistance = 0;
    
    
    while (virtualHeight < 0)
    {
        virtualHeight += virtualVerticalSpeed;
        virtualVerticalSpeed += virtualGravity;
        
        if (virtualHorizontalSpeed) virtualHorizontalSpeed -= min(virtualFriction, virtualHorizontalSpeed);
        totalDistance += virtualHorizontalSpeed;
    }
    
    var rangeToWall = range_finder(x,y,direction,totalDistance,obj_limit,false,true);

    if (rangeToWall) totalDistance = rangeToWall;
    
    rX = x + lengthdir_x(totalDistance,direction);
    rY = y + lengthdir_y(totalDistance,direction);
    
    myTarget.x = rX;
    myTarget.y = rY;
    
    targetSetup = true;
}

if (firstBounce) && instance_exists(myTarget)
{
    with (myTarget) instance_destroy();
}

