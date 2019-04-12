///cmd_fire();
if (owner != noone)
{
    var p = owner.myPlayerId;
    var joy = global.input[p];
    
    if (ammo_current)
    {
	    var shoot_direction = point_direction(x,y,global.crosshairX[p],global.crosshairY[p]);
                        
	    fire_burst_current++;
	    ammo_current--;
	    can_fire = false;
		
		//Prepare Shell Candy
		var shellCandyActivated = false;
		var shellCandyFireAmount = 0;
       
	    for (var i=0; i<(fire_amount+shellCandyFireAmount); i++;)
	    {
			var recoil = crosshair_recoil;
			if (shellCandyActivated) recoil = shellRecoil;
	        global.crosshair_scale[p] += recoil;
		  
	        projectileX = x+(lengthdir_x(spawn_distance_from_barrel,shoot_direction));
	        projectileY = y+(lengthdir_y(spawn_distance_from_barrel,shoot_direction));
				
			if (projectile_obj == obj_sonicboom) 
				projectile = instance_create_layer(projectileX,projectileY,"Interactive_Over",projectile_obj);	
			else 
				projectile = instance_create_layer(projectileX,projectileY,"Interactive",projectile_obj);			
			
			if (shellCandyActivated)
			{
				projectile.ammo_type = shellType;
				projectile.speed_per_second = shellSpeed;
				projectile.range = shellCandyRange;
			}
			else {
				projectile.ammo_type = ammo_type;
				projectile.speed_per_second = projectile_speed;
				projectile.range = projectile_range;
			}
			
			projectile.decay = projectile_speed_decay;
	        projectile.push_power = projectile_power;
	        projectile.piercing = projectile_piercing;
	        projectile.bounce = projectileBounce;
	        projectile.bounceMax = projectileBouceMax;
			
	        projectile.allowPrecision = allowPrecision;
	        projectile.goesThroughWalls = goesThroughWalls;
	        projectile.owner = owner;
                            
	        var precision;
                
	        if (global.relic_mega_quantum_chip == 2) precision = 0;//Check for Relic buff
	        else if (shellCandyActivated) precision = random_range(-shellCandyPrecision,shellCandyPrecision);
			else{
	            if (owner.aiming) precision = random_range(-accuracy_aiming*owner.base_accuracy,accuracy_aiming*owner.base_accuracy);
	            else precision = random_range(-accuracy*owner.base_accuracy,accuracy*owner.base_accuracy);
	        }
	        projectile.direction = shoot_direction+precision;
                            
	        projectile.faction = f_player;
	        //projectile.type = shot_type;
                
	        var damageBonus = 0;
	        if (ammo_type == type_light) damageBonus += round(projectile_damage * (global.challengeLightFocus*global.challengeLightFocusMultiplier));
	        else if (ammo_type == type_medium) damageBonus += round(projectile_damage * (global.challengeMediumFocus*global.challengeMediumFocusMultiplier));
	        else if (ammo_type == type_heavy) damageBonus += round(projectile_damage * (global.challengeHeavyFocus*global.challengeHeavyFocusMultiplier));
	        if (global.challengeMedieval) damageBonus -= round(projectile_damage * global.challengeMedievalPenalty);
			
	        projectile.damage = projectile_damage + damageBonus;
			if (shellCandyActivated) projectile.damage = round(shellCandyDamageMultiplier * projectile.damage);
			
			if (global.relic_shell_candy == 2) if (i=fire_amount-1)
			{
				shellCandyActivated = true;
				shellCandyFireAmount = 9;
				
				var shellCandyPrecision = 20;
				var shellCandyRange = 250;
				var shellRecoil = 0;
				var shellSpeed = 25;
				var shellType = type_medium;
				var shellCandyDamageMultiplier = 0.2;
			}
	    }
		
		
		shellCandyActivated = false;
		shellCandyFireAmount = 0;
            
	    add_screen_shake(shake_amount,shoot_direction+180,false);
            
	    recoil_speed = projectile_recoil;
            
	    //LOW AMMO CLICK
	    if (ammo_current < (ammo*0.25)) audio_play(owner.audio_emitter,false,1,sfx_click);
            
	    if (sound == "pistol") 
	    {
	        if (fire_burst_current == 1) && (fire_burst > 1) audio_play(owner.audio_emitter,false,1,sfx_burstfire_start);
	        audio_play(owner.audio_emitter,false,1,sfx_pistol,sfx_pistol,sfx_pistol);
	    }
            
	    else if (sound = "machinegun")
	    {
	        audio_play(owner.audio_emitter,false,1,sfx_burstfire_start);
	        audio_play(owner.audio_emitter,false,1,sfx_pistol,sfx_pistol,sfx_pistol);;
	    }
            
	    else if (sound == "shotgun")
	    {
	        audio_play(owner.audio_emitter,false,1,sfx_shotgun,sfx_shotgun,sfx_shotgun);
	    }
            
	    else if (sound == "sniper")
	    {
	        audio_play(owner.audio_emitter,false,1,sfx_sniper);
	    }
            
	    else if (sound = "smg")
	    {
	        audio_play(owner.audio_emitter,false,1,sfx_smg1,sfx_smg2,sfx_smg3,sfx_smg4,sfx_smg5);
	    }
	    else if (sound = "rocket")
	    {
	        audio_play(owner.audio_emitter,false,1,sfx_rocket_start);
	    }
	    else if (sound == "rifle") 
	    {
	        if (fire_burst_current == 1) && (fire_burst > 1) audio_play(owner.audio_emitter,false,1,sfx_burstfire_start);
	        audio_play(owner.audio_emitter,false,1,sfx_rifle1,sfx_rifle2,sfx_rifle3);
	    }
	    else if (sound == "reaper") 
	    {
	        if (fire_burst_current == 1) audio_play(owner.audio_emitter,false,1,sfx_weapon_reaper1,sfx_weapon_reaper2,sfx_weapon_reaper3);
	    }
	    else if (sound == "keytar")
	    {
	        audio_play(owner.audio_emitter,false,1,sfx_keyShot1,sfx_keyShot2,sfx_keyShot3,sfx_keyShot4);
	        audio_play(owner.audio_emitter,false,1,sfx_keyMel1,sfx_keyMel2,sfx_keyMel3,sfx_keyMel4,sfx_keyMel5,sfx_keyMel6,sfx_keyMel7);
	    }
	    else if (sound == "plasma")
	    {
	        audio_play(owner.audio_emitter,false,1,sfx_plasma_start);
	    }
            
	    //if (global.count_casings < global.max_casings)
	    //{
	        if (dropCasing) {
	            //casing = instance_create_layer(x,y+16,"Interactive",fx_casing);
	            casing = get_object_from_pool(casing_pool);
				if (instance_exists_fast(casing)) reset_casing_instance(casing, x, y+16, "Interactive", shoot_direction, ammo_type);						
	        }
	    //}
            
	    //joypad rumble
	    joy_rumble(joy,joypadRumbleFactor, joypadRumbleFactor);
            
	    //Fire Rate Decay Update
	    fireRateDecayCurrent += fireRateDecay * delta_time * ms_to_s_60;
	    if (fireRateDecayCurrent > fireRateDecayMax) fireRateDecayCurrent = fireRateDecayMax;
	    else if (fireRateDecayCurrent < fireRateDecayMin) fireRateDecayCurrent = fireRateDecayMin;
	}
}
