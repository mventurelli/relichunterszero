/// Pause-Controlled Movement

if (!global.pause)
{
    if (speed_reset)
    {
        speed = old_speed;
        speed_reset = false;
    }
}
else if (speed_reset == false)
{
    old_speed = speed;
    speed = 0;
    speed_reset = true;
}

///Slow Down
if (speed > max_speed) speed = max_speed;
else speed -= corpse_friction;
if speed <= 0 speed = 0;

depth = -y;

///Boss Final Show

//Several Explosions

if (myDeathStage == 1)
{
    explosion[0] = room_speed*2;
    explosion[1] = room_speed*3.5;
    explosion[2] = room_speed*5;
    explosion[3] = room_speed*6;
    explosion[4] = room_speed*6.5;
    explosion[5] = room_speed*7;
    explosion[6] = room_speed*7.25;
    explosion[7] = room_speed*7.5;
    explosion[8] = room_speed*7.75;
    explosion[9] = room_speed*8;
    explosion[10] = room_speed*8.25;
    explosionTimeCurrent++;
    var wantToExplode = false;
    
    if (explosionTimeCurrent < explosion[10]) 
    {
        for (i=0; i<=10; i++)
        {
            fuckYouGameMaker = explosion[i];
            if (explosionTimeCurrent == fuckYouGameMaker) wantToExplode = true;
        }
        
        if (wantToExplode)
        {
            wantToExplode = false;
            randomOffset = random_range(-offset,offset);
            var boom = instance_create_layer(x+randomOffset,y+randomOffset,"Interactive",fx_explosion_regular);
            boom.damage = 0;
            boom.radius = 0;
        }
    }
    else 
    {
        sprite_index = spr_boss_death;
        image_speed = 0.05;
        myDeathStage = 2;
    }
}

//stage2 transitions to 3 on AnimationEnd



