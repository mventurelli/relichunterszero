///projectile_bounce()
//bounces the projectile

if (bounce && bounceMax > bounceCurrent)
{
    bounceCurrent++;
    isBouncing = true;
    
    var bounceDir = -1;
    if (direction) && (direction < 180) bounceDir = 1;
    if (direction > 90) && (direction <270) bounceDir = -1*bounceDir;
    
    direction += 180 + (90 * bounceDir);
    
    var randomDir = irandom_range(0,1);
    if (!randomDir) randomDir = -1;
    var randomAngle = random_range(0,12);
    
    direction += randomAngle * randomDir;
    
    audio_play_exclusive(audio_emitter,false,1,sfx_biu_shield_hit1,sfx_biu_shield_hit2,sfx_biu_shield_hit3,sfx_biu_shield_hit4,sfx_biu_shield_hit5,sfx_biu_shield_hit6,sfx_biu_shield_hit7);
}
