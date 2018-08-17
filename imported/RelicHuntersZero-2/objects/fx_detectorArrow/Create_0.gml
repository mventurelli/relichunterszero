///Init

dist = 70;
targetDirection = 0;

myAlpha = 0;
alphaSpeedIn = 0.12;
alphaSpeedOut = 0.025;
fadeDirection = 1;

life = room_speed*1;
alarm[0] = life;

if (instance_exists(class_player))
{
    parent = instance_nearest(x,y,class_player);
}
else instance_destroy();


