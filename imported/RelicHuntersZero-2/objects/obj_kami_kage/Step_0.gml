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
    if (damage == 0) sprite_index = spr_cage1_hit;
    if (damage == 1) sprite_index = spr_cage1_hit;
    if (damage == 2) sprite_index = spr_cage1_hit;
    
    if (!hit_taken_time) audio_play_exclusive(audio_emitter,false,1,impactSound1,impactSound2,impactSound3);
    hit_taken_time++;
    if hit_taken_time >= 5
    {
        hit_taken_time = 0;
        hit_taken = false;
	    if (damage == 0) sprite_index = spr_cage1;
	    if (damage == 1) sprite_index = spr_cage2;
	    if (damage == 2) sprite_index = spr_cage3;
    }
}
//removido e movido para dentro do teste do fim do tempo de hit_taken
/*else
{
    if (damage == 0) sprite_index = spr_cage1;
    if (damage == 1) sprite_index = spr_cage2;
    if (damage == 2) sprite_index = spr_cage3;
}*/

//Damage
if (hp < maxhp) {
	if (hp > hp_medium) {
		damage = 0;
	}
	else if (hp <= hp_medium) && (hp > hp_low)
	{
	    if damage == 0
	    {
	        myDirt = instance_create_layer(x,y,"Interactive",fx_dirt);
	        myDirt.sprite_index = spr_longbox_dirt;
	    }
	    damage = 1;
	}
	else //if (hp <= maxhp*0.33)
	{
	    if damage == 1
	    {
	        myDirt = instance_create_layer(x,y,"Interactive",fx_dirt);
	        myDirt.sprite_index = spr_longbox_dirt;
	    }
	    damage = 2;
	}

	if (hp <= 0)
	{
	    var spawnObj = obj_kamikaze1;
	    var spawnAmount = 6;
	    //if (global.gameMode == gamemode_endless) && (global.currentLoop >= 2) { spawnObj = obj_kamitank; spawnAmount = 2};
	    if (global.character[1] == char_rider) || (global.character[2] == char_rider) spawnObj = obj_kamiAlly;
    
	    repeat(spawnAmount)
	    {
	        spawnX = x + irandom_range(-10,10) + 64;
	        spawnY = y + irandom_range(-10,10) + 64;
	        instance_create_layer(spawnX,spawnY,"Interactive",spawnObj);
	    }    
    
	    instance_create_layer(x,y,"Interactive",fx_kami_cageDestroy);
    
	    //Stats and Achievements
	    steam_set_stat_int("STAT_TOTAL_KAMICAGES", steam_get_stat_int("STAT_TOTAL_KAMICAGES") + 1  ); 
	    if (steam_get_stat_int("STAT_TOTAL_KAMICAGES") >= 20) 
	    {
	        achievement_give("ACHIEVEMENT_DESTROY_KAMIKAGES");
	        achievement_give("ACHIEVEMENT_UNLOCK_RIDER");
	        global.unlockRider = 1;
	    }
	    instance_destroy();
	}
}
