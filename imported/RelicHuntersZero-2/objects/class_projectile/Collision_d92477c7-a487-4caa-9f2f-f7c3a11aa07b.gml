if (!goesThroughWalls)
{
    other.hp -= damage;
    other.shake_direction = direction;
    other.hitDirection = direction;
    other.shake += 2;
    other.hit_taken = true;
    
    if other.hp < 0 && (piercing)
    {
        piercing--;
    }
    else if (bounce) && (bounceMax > bounceCurrent)
    {
        projectile_bounce();
    }
    else if (!isBouncing)
    {
        instance_destroy();
    }
}

