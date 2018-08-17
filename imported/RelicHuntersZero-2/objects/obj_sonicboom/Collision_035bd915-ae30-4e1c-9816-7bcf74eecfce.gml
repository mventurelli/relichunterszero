///Player Damage
if instance_exists(other) 
{
    if (faction == f_player) && instance_exists(owner)
    {
        //Friendly Fire
        if (global.friendlyFire)
        {
            if (other.myPlayerId != owner.myPlayerId) && (other.isVulnerable)
            {
                ffDamage = round(damage * global.friendlyFireDamageRatio);
                
                if (!other.dodging) && (ds_list_find_index(damage_list,other.id) < 0)
                {
                    ds_list_add(damage_list,other.id);
                    
                    if (global.relic_midnight_beer == 2) ffDamage += round(ffDamage*global.midnightDamageMultiplier ); //Midnight Beer
                    if (global.relic_midnight_meal == 2) ffDamage += round(ffDamage*global.midnightDamageMultiplier ); //Midnight Meal
                    
                    if (other.shield)
                    {
                        if (distance_travelled > range) ffDamage = ffDamage/3;
                        other.energy -= ffDamage;
                        audio_play_exclusive(other.audio_emitter,false,1,sfx_shield_hit1,sfx_shield_hit2);
                        if (other.energy <= 0) audio_play_exclusive(other.audio_emitter,false,1,sfx_shield_destroy);
                    }
                    else
                    {
                        if (distance_travelled > range) ffDamage = round(damage/3);
                        other.hp -= ffDamage;
                        audio_play(other.audio_emitter,false,1,sfx_impact_flesh1,sfx_impact_flesh2,sfx_impact_flesh3,sfx_impact_flesh4);
                        
                        //bloodAmount = min(round(ffDamage/5), (global.max_casings-global.count_casings), 5);
                        //if (bloodAmount) repeat(bloodAmount) blood = instance_create_layer(x,y,"Interactive",fx_blood);
			            bloodAmount = min(round(ffDamage/5), 5);
			            if (bloodAmount) repeat(bloodAmount) 
						{
							blood = get_object_from_pool(blood_pool);
							if (instance_exists_fast(blood)) reset_blood_instance(blood, x, y, "Interactive");
						}
                        
                        if (other.hp <= 0) achievement_give("ACHIEVEMENT_TEAMKILL");
                    }
                    other.hit_taken = true;
                    
                    spreadX = irandom_range(-15,15);
                    spreadY = irandom_range(-15,15);
                    damage_fx = instance_create_layer(other.x+spreadX,other.y+spreadY,"Interactive_Over",fx_damage);
                    damage_fx.damage = ffDamage;
            
                    if (!instance_exists(hit)) && (global.count_particles < global.max_particles)
                    {
                        hit = instance_create_layer(x,y,"Interactive",fx_hit);
                        hit.type = ammo_type;
                    }
                    
                    if (!piercing) 
                    {
                        instance_destroy();
                    }
                    else piercing--;
                }
            }
        }
    }
    else
    {
        spreadX = irandom_range(-15,15);
        spreadY = irandom_range(-15,15);
        
        if (!other.dodging) && (other.isVulnerable)
        {
            if (other.shield)
            {
                if (other.superShield) damage = 0;
                if (distance_travelled > range) damage = round(damage/3);
                if (global.challengeSupressor) damage = damage*2;
                other.energy -= damage;
                
                audio_play_exclusive(other.audio_emitter,false,1,sfx_shield_hit1,sfx_shield_hit2);
                if (other.energy <= 0) audio_play_exclusive(other.audio_emitter,false,1,sfx_shield_destroy);
            }
            else
            {
                if (distance_travelled > range) damage = round(damage/3);
                other.hp -= damage;
                audio_play(other.audio_emitter,false,1,sfx_impact_flesh1,sfx_impact_flesh2,sfx_impact_flesh3,sfx_impact_flesh4);
                
                //bloodAmount = min(round(damage/5), (global.max_casings-global.count_casings), 5);
                //if (bloodAmount) repeat(bloodAmount) blood = instance_create_layer(x,y,"Interactive",fx_blood);
			    bloodAmount = min(round(damage/5), 5);
			    if (bloodAmount) repeat(bloodAmount) 
				{
					blood = get_object_from_pool(blood_pool);
					if (instance_exists_fast(blood)) reset_blood_instance(blood, x, y, "Interactive");
				}
            }
            other.hit_taken = true;
            
            
            damage_fx = instance_create_layer(other.x+spreadX,other.y+spreadY,"Interactive_Over",fx_damage);
            damage_fx.damage = damage;
    
            if (!instance_exists(hit)) && (global.count_particles < global.max_particles)
            {
                hit = instance_create_layer(x,y,"Interactive",fx_hit);
                hit.type = ammo_type;
            }
            instance_destroy();
        }
        
        if (other.dodging) && (ds_list_find_index(damage_list,other.id) < 0)
        {
            ds_list_add(damage_list,other.id);
            damageEffect = instance_create_layer(other.x+spreadX,other.y+spreadY,"Interactive_Over",fx_damage);
        }
    }
}

