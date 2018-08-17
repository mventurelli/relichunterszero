///Slowly Goes Torward Explosion Area

if (isExploding)
{
    fakeMovement += fakeSpeed;

    //drawX = drawX+lengthdir_x(fakeMovement,explosionDirection);
    //drawY = drawY+lengthdir_y(fakeMovement,explosionDirection);
    x += lengthdir_x(fakeSpeed,explosionDirection);
    y += lengthdir_y(fakeSpeed,explosionDirection);
}

