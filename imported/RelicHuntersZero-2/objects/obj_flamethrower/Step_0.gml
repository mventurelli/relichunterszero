///Looping Sound FX

event_inherited();

if (!reloading) && (ammo_current) && (owner) && (instance_exists(owner))
{
    if (input_pressed)
    {
        audio_play(owner.audio_emitter,false,1,sfx_flamethrower_start);
    }   
    if (input_held) joy_rumble(global.input[owner.myPlayerId],0.1,0.1);
}

if (!input_held)
{   
    if audio_is_playing(sfx_flamethrower_start) audio_stop_sound(sfx_flamethrower_start);
}





