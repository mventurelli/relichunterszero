/// Pause-Controlled Movement

if (!global.pause)
{
    //Speed Reset After Pause
    if (speed_reset)
    {
        speed_per_second = old_speed;
        speed_reset = false;
    }
    
    immortalTimer -= delta_time;
    image_angle = direction;
    speed_per_second -= decay;
    if (speed_per_second > maxSpeed) speed_per_second = maxSpeed;
    
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
    old_speed = speed_per_second;
    speed_per_second = 0;
    speed_reset = true;
}

///Audio
audio_emitter_position(audio_emitter, x, y, 0);

///Explode
if (explode)
{
    big_bang = instance_create_layer(x,y,"Interactive",fx_explosion_regular);
    big_bang.damage = damage;
    big_bang.radius = radius;
    big_bang.push_power = push_power;
	big_bang.faction = faction;
    
    instance_destroy();
}







