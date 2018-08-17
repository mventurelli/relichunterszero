/// Pause-Controlled Movement

if (!global.pause)
{
    //Speed Reset After Pause
    if (speed_reset)
    {
        speed_per_second = old_speed;
        speed_reset = false;
    }
    
    image_angle = direction;
    speed_per_second -= decay;
    if speed_per_second < 5 speed_per_second = 5;
	if (maxSpeed > 0 && speed_per_second > maxSpeed) speed_per_second = maxSpeed;
	
	speed = speed_per_second * delta_time * ms_to_s_60;
    distance_travelled += speed;
    
    //Max Range
    
    if distance_travelled > range
    {
        instance_destroy();
    }
    //Fade if range is almost over
    if (range)
    {
        if (distance_travelled/range) >= 0.9
        {
            myAlpha -= fade;
        }
    }
}
else if (speed_reset == false)
{
    old_speed = speed_per_second;
    speed_per_second = 0;
    speed_reset = true;
}
/*
depth = -y-99;

/* */
///Audio
audio_emitter_position(audio_emitter, x, y, 0);

/* */
/*  */
