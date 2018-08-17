///cmd_fire_enemy();
if (owner != noone)
{     
    fire_burst_current++;
    can_fire = false;

    repeat(fire_amount)
    {
        projectileX = x+(lengthdir_x(spawn_distance_from_barrel,shoot_direction));
        projectileY = y+(lengthdir_y(spawn_distance_from_barrel,shoot_direction));
            
        projectile = instance_create_layer(projectileX,projectileY,"Interactive",projectile_obj);
        projectile.myGun = id;
		projectile.owner = owner;
        projectile.speed_per_second = projectile_speed * global.enemyProjectileSpeed;
        projectile.decay = projectile_speed_decay * global.enemyProjectileSpeed;
        projectile.range = projectile_range;
        projectile.push_power = projectile_power;
        projectile.ammo_type = ammo_type;		
                        
        var precision = random_range(-accuracy,accuracy);
        projectile.direction = shoot_direction+precision;
                        
        projectile.faction = f_enemy;
            
        var damageBonus = round(projectile_damage * (global.challengeWanted*global.challengeWantedMultiplier));
        if (ammo_type == type_light) damageBonus += round(projectile_damage * (global.challengeLightFocus*global.challengeLightFocusMultiplier));
        else if (ammo_type == type_medium) damageBonus += round(projectile_damage * (global.challengeMediumFocus*global.challengeMediumFocusMultiplier));
        else if (ammo_type == type_heavy) damageBonus += round(projectile_damage * (global.challengeHeavyFocus*global.challengeHeavyFocusMultiplier));
            
        projectile.damage = projectile_damage + damageBonus;
            
        if (sound == "pistol") 
        {
            if (fire_burst_current == 1) && (fire_burst > 1) audio_play(owner.audio_emitter,false,1,sfx_burstfire_start);
            audio_play(owner.audio_emitter,false,1,sfx_pistol,sfx_pistol,sfx_pistol);
        }
        else if (sound = "machinegun")
        {
            audio_play(owner.audio_emitter,false,1,sfx_burstfire_start);
            audio_play(owner.audio_emitter,false,1,sfx_pistol,sfx_pistol,sfx_pistol);
        }
        else if (sound == "shotgun") && (!audio_is_playing(sfx_shotgun)) audio_play(owner.audio_emitter,false,1,sfx_shotgun);
        else if (sound == "sniper") audio_play(owner.audio_emitter,false,1,sfx_sniper);
        else if (sound = "smg") audio_play(owner.audio_emitter,false,1,sfx_smg1,sfx_smg2,sfx_smg3,sfx_smg4,sfx_smg5);
        else if (sound = "rocket") audio_play(owner.audio_emitter,false,1,sfx_rocket_start);
        else if (sound == "rifle") 
        {
            if (fire_burst_current == 1) audio_play(owner.audio_emitter,false,1,sfx_burstfire_start);
            audio_play(owner.audio_emitter,false,1,sfx_rifle1,sfx_rifle2,sfx_rifle3);
        }
    }
        
    recoil_speed = 4;
        
    //if (global.count_casings < global.max_casings) 
    //{
        if (!is_rocket) {
            //casing = instance_create_layer(x,y+16,"Interactive",fx_casing);
	        casing = get_object_from_pool(casing_pool);
			if (instance_exists_fast(casing)) reset_casing_instance(casing, x, y+16, "Interactive", shoot_direction, ammo_type);
        }
    //}
}
