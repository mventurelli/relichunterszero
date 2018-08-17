/// @description dynamic depth & death
// You can write your code in this editor
depth = -y;

//death
if (hp <= 0)
{
    var corpseSprite = sprite_death;
    
    if (!no_score)
    {
        if (!critical_death)
        {
            ////if (global.allowKillFreeze) global.pause = 50000;//room_speed*0.05;
            score_add(global.score_kill,false);
            
            var randomDeath = irandom_range(1,2)
            if (randomDeath == 1) corpseSprite = sprite_death;
            if (randomDeath == 2) corpseSprite = sprite_death2;
        }
        else
        {
            ////if (global.allowKillFreeze) global.pause = 75000;//room_speed*0.075;
            score_add(global.score_kill+global.score_headshot,true);
            
            var randomDeath = irandom_range(1,2)
            if (randomDeath == 1) corpseSprite = sprite_precision1;
            if (randomDeath == 2) corpseSprite = sprite_precision2;
        }
    }
    
    repeat(3) instance_create_layer(x,y,"Interactive",obj_pickup_coin);
    roll_ammo_drop(x,y);
    myCorpse = instance_create_layer(x,y,"Interactive",fx_corpse);
    myCorpse.image_xscale = image_xscale;
    myCorpse.sprite_index = corpseSprite;
    
    if (pushed)
    {
        myCorpse.speed = push_speed*2 * delta_time * ms_to_s_60;
        myCorpse.direction = push_direction;
    }
    
    audio_play(audio_emitter,false,1,sfx_kami_death);
    
    if (critical_death) audio_play_exclusive(audio_emitter,false,1,sfx_precision_kill1,sfx_precision_kill2,sfx_precision_kill3,sfx_precision_kill4,sfx_precision_kill5);
    
    instance_destroy();
}
else {

	if (create_flight_object == true) {
	    iAmFlying = instance_create_layer(x,y,"Interactive",obj_kamikazelite_flying);
	    iAmFlying.targetX = fly_target_x;
	    iAmFlying.targetY = fly_target_y;
	    iAmFlying.hp = hp;
	    instance_destroy();
	}
	
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
