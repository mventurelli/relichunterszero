///Bounce or Die
if (!goesThroughWalls)
{
    if (bounce && bounceMax > bounceCurrent)
    {
        projectile_bounce();
    }
    else if (!isBouncing)
    {        
        instance_destroy();
    }
}

