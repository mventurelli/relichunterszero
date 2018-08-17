/// @description dynamic depth & death
// You can write your code in this editor

depth = -y;

//Death
if (hp <= 0)
{
    var corpseSprite = sprite_death;
    
    if (no_score == false)
    {
        var randomDeath = irandom_range(1,3)
        if (randomDeath == 1) corpseSprite = sprite_death;
        else if (randomDeath == 2) corpseSprite = sprite_death2;
        else if (randomDeath == 3) corpseSprite = sprite_death3;
        
        if (!critical_death)
        {
            //if (global.allowKillFreeze) global.pause = 50000;//room_speed*0.05;
            score_add(myRegularScore,false);
        }
        else
        {
            //if (global.allowKillFreeze) global.pause = 75000;//room_speed*0.075;
            score_add(myRegularScore+myPrecisionScore,true);
        }
    }
    
    repeat(myCoinDropAmount) instance_create_layer(x,y,"Interactive",obj_pickup_coin);
    roll_ammo_drop(x,y);
    
    myCorpse = instance_create_layer(x,y,"Interactive",fx_corpse);
    myCorpse.image_xscale = image_xscale;
    myCorpse.sprite_index = corpseSprite;
    
    if (pushed)
    {
        myCorpse.speed = push_speed*2 * delta_time * ms_to_s_60;
        myCorpse.direction = push_direction;
    }
    
    audio_play(audio_emitter,false,1,deathSfx);
    
    if (critical_death) audio_play_exclusive(audio_emitter,false,1,sfx_precision_kill1,sfx_precision_kill2,sfx_precision_kill3,sfx_precision_kill4,sfx_precision_kill5);
    
    instance_destroy();
}
else {
	///Anti-Bug: Destroy If Inside Wall

	if collision_point(x,y,obj_limit,false,true)
	{
	    myCorpse = instance_create_layer(x,y,"Interactive",fx_corpse);
	    myCorpse.image_xscale = image_xscale;
	    if (pushed)
	    {
	        myCorpse.speed = push_speed*2 * delta_time * ms_to_s_60;
	        myCorpse.direction = push_direction;
	        myCorpse.sprite_index = sprite_death;
	    }
    
	    instance_destroy();
	}

}

