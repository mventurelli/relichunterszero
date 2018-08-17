/// Pause-Controlled Movement

if (!global.pause)
{
    //Speed Reset After Pause
    if (speed_reset)
    {
        speed = old_speed;
        speed_reset = false;
    }
    
    immortalTimer -= delta_time;
    image_angle = direction;
    speed -= decay;
    if (speed > maxSpeed) speed = maxSpeed;
    
    //part_system_depth(global.smoke_system,depth+1);
    part_emitter_region(smoke_system, smoke_emitter, x-5, x+5, y-5, y+5, ps_shape_ellipse, ps_distr_linear);
    part_emitter_burst(smoke_system, smoke_emitter, smoke_particle, 1);
    
    
    //Shake
    if shake > shake_max shake = shake_max;
         
    drawX = x+lengthdir_x(shake,shake_direction);
    drawY = y+lengthdir_y(shake,shake_direction);
        
    shake += shake_per_step;
    shake_direction = irandom(359);
}
else if (speed_reset == false)
{
    old_speed = speed;
    speed = 0;
    speed_reset = true;
}

///Audio
audio_emitter_position(audio_emitter, x, y, 0);






