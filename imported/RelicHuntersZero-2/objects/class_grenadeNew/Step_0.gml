var __b__;
__b__ = action_if(global.pause);
if !__b__
{
{
///"Physics" adjustment

event_inherited();

if (!allowBounce)
{
    if (allowBounceTimeCurrent < allowBounceTime) allowBounceTimeCurrent += delta_time;
    else allowBounce = true;
}

if (draw_height >= dynamicHeight) && (allowBounce)
{
    if (place_meeting(x,y,obj_wall)) && (speed_per_second)
    {
        if (vertical_speed)
        {
            timeToBounce = true;
            canRicochet = false;
        }
        else
        {
            if (canRicochet) direction = 180+(point_direction(x,y,other.x,other.y));
            if (!vertical_speed_start) detonationTimeCurrent = detonationTime;
        }
    }

    if (collision_circle(x,y,triggerRadiusForEnemies,class_enemy,false,true))
    {
        enemyTrigger = true;
    }
    
    if (collision_circle(x,y,triggerRadiusForPlayers,class_player,false,true))
    {
        playerTrigger = true;
    } 
}

reflection_object_setup(draw_height,spr_grenadeNew,image_index);

///Detonation Control

if (!vertical_speed_start) detonationTimeCurrent += delta_time;

if (detonationTimeCurrent >= detonationTime)
{
    goBoom = true;
}

///Audio

audio_emitter_position(audio_emitter, x, y, 0);

if (playAudio)
{
    audio_play(audio_emitter,false,1,sfx_grenade_bounce);
    playAudio = false;
}

///Smoke Trail

if (vertical_speed_start)
{
    part_emitter_region(smoke_system, smoke_emitter, x, x, y+draw_height, y+draw_height, ps_shape_ellipse, ps_distr_linear);
    part_emitter_burst(smoke_system, smoke_emitter, smoke_particle, 1);
}

}
}
///Pause-Controlled Movement

if (!global.pause)
{
    if (speedReset)
    {
        speed_per_second = oldSpeed;
        speedReset = false;
    }
}
else
{
    if (!speedReset)
    {
        oldSpeed = speed_per_second;
        speed_per_second = 0;
        speedReset = true;
    }
}

