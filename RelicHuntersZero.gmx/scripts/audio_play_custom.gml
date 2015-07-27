///audio_play_custom(x,y,priority,falloff_ref_dist,falloff_max_dist,falloff_factor,loops,audio1,audio2,...)

var i, random_pick, random_argument, sound_file, audioX, audioY;

for (i=7; i< 10; i++)
{
    if (argument_count > i)
    {
       random_argument[i] = argument[i]
    }
    else
    {
       random_argument[i] = -1;
    }
}

random_pick = irandom_range(3,(argument_count-1));
sound_file = random_argument[random_pick];

audioX = argument[0] - controller_camera.x;
audioY = argument[1] - controller_camera.y;

audio_play_sound_at(sound_file,audioX,audioY,0,argument[3],argument[4],argument[5],argument[6],argument[2]);

