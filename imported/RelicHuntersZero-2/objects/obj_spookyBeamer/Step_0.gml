///Mega Beam Charge

if (input_held) && (!reloading) && (isActive) megaBeamTimeCurrent += delta_time;
else {
    megaBeamTimeCurrent = 0;
    megaBeam = false;
    beamThickness = oldThickness;
}
        
if (!megaBeam) && (megaBeamTimeCurrent >= megaBeamTime)
{
        megaBeam = true;
        oldThickness = beamThickness;
        oldDamage = projectile_damage;
        beamThickness = megaBeamThickness;
        
        // <-- Play mega beam sound here
}

if (megaBeam) projectile_damage = projectile_damage * megaBeamDamageMultiplier;

event_inherited(); // <- Calling the Gun scripts afterwards to ensure damage will be updated before shot is fired

///Looping Sound FX

if (!reloading) && (ammo_current) && (owner != noone) && (isActive)
{
    if (input_pressed)
    {
        audio_play(owner.audio_emitter,false,1,sfx_flamethrower_start);
    }   
    if (input_held) joy_rumble(global.input[owner.myPlayerId],0.1,0.1);
}

if (!input_held) || (!isActive)
{   
    if audio_is_playing(sfx_flamethrower_start) audio_stop_sound(sfx_flamethrower_start);
}





