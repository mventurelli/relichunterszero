///Follow Owner's Owner (The Player!)

var timeToDie = false;

if (owner != noone)  
{
    if (instance_exists_fast(owner.owner))
    {
        x = owner.owner.x;
        y = owner.owner.y;
        
        depth = owner.owner.depth-1;
    }
    else timeToDie = true;
}
else timeToDie = true;

if (timeToDie) instance_destroy();

///Hit Effect

if (isActive)
{
    if (animationTrigger)
    {
        image_index = 0;
        image_speed = animationSpeed;
        animationTrigger = false;
        
        if (owner != noone) 
		{
			if (instance_exists_fast(owner.owner))
	        {
	            audio_play_exclusive(owner.owner.audio_emitter,false,1,sfx_biu_shield_hit1,sfx_biu_shield_hit2,sfx_biu_shield_hit3,sfx_biu_shield_hit4,sfx_biu_shield_hit5,sfx_biu_shield_hit6,sfx_biu_shield_hit7);
	        }
		}
    }
}

