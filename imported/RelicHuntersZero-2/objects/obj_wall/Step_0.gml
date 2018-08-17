//Shake
if (shake)
    {
        if shake > shake_max shake = shake_max;
         
        drawX = x+lengthdir_x(shake,shake_direction);
        drawY = y+lengthdir_y(shake,shake_direction);
        
        shake -= shake_recovery;
        shake_direction = irandom(359);
        
        if shake < 0 shake = 0;
    }
    
//Hit Taken
if (hit_taken)
{
    sprite_index = sprite_hit;
    
    if (!hit_taken_time) && (hasImpactSound)
    {
        audio_play_exclusive(audio_emitter,false,1,impactSound1,impactSound2,impactSound3);
    }
    
    hit_taken_time++;
    
    if hit_taken_time >= 5
    {
        hit_taken_time = 0;
        hit_taken = false;
    }
}
else sprite_index = sprite;
    
//Damage
if (hp < maxhp) {
	if (hp > hp_medium) {
		damage = 0;
	}
	else if ((hp <= hp_medium) && (hp > hp_low))
	{
	    if (damage == 0)
	    {
	        myDirt = instance_create_layer(x,y,"Interactive",fx_dirt);
	        myDirt.sprite_index = sprite_dirt;
	    }
	    damage = 1;
	}
	else //if (hp <= maxhp*0.33)
	{
	    if (damage == 1)
	    {
	        myDirt = instance_create_layer(x,y,"Interactive",fx_dirt);
	        myDirt.sprite_index = sprite_dirt;
	    }
	    damage = 2;
	}
}

