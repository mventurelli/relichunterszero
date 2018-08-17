///Friendly Fire
if (global.friendlyFire)
{
    if instance_exists(other)
    {
        if (other.id != owner.id)
        {
            spreadX = irandom_range(-15,15);
            spreadY = irandom_range(-15,15);
                    
            if (!other.dodging) && (other.isVulnerable)
            {
                ffDamage = round(damage * global.friendlyFireDamageRatio);
                
                if (ds_list_find_index(damage_list,other.id) < 0) && (ds_list_size(damage_list) < max_hits)
                {
                    ds_list_add(damage_list,other.id);
                    
                    if (global.relic_midnight_beer == 2) ffDamage += round(damage*global.midnightDamageMultiplier ); //Midnight Beer
                    if (global.relic_midnight_meal == 2) ffDamage += round(damage*global.midnightDamageMultiplier ); //Midnight Beer
                    
                    if (other.shield) 
                    {
                        other.energy -= ffDamage;
                        audio_play_exclusive(other.audio_emitter,false,1,sfx_shield_hit1,sfx_shield_hit2);
                        if (other.energy <= 0) audio_play(other.audio_emitter,false,1,sfx_shield_destroy);
                    }
                    else 
                    {
                        other.hp -= ffDamage;
                        //repeat(round(ffDamage/10)) blood = instance_create_layer(x,y,"Interactive",fx_blood);
					    repeat(round(ffDamage/10)) 
						{
							blood = get_object_from_pool(blood_pool);
							if (instance_exists_fast(blood)) reset_blood_instance(blood, x, y, "Interactive");
						}
                        
                        if (other.hp <= 0) achievement_give("ACHIEVEMENT_TEAMKILL");
                    }
                    other.hit_taken = true;
                    if (hasJoy) joy_rumble(joy,7,7);
                    
                    damageEffect = instance_create_layer(other.x+spreadX,other.y+spreadY,"Interactive_Over",fx_damage);
                    damageEffect.damage = ffDamage;
                    damageEffect.critical = true;
                    
                    if (sprite_index == spr_melee_gloves)
                    {
                        audio_play(other.audio_emitter,false,1,sfx_gloves_hit1,sfx_gloves_hit2,sfx_gloves_hit3);
                    }
                    else audio_play(other.audio_emitter,false,1,sfx_impact_flesh1,sfx_impact_flesh2,sfx_impact_flesh3,sfx_impact_flesh4);
                }
            }
            
            if (other.dodging) && (ds_list_find_index(damage_list,other.id) < 0)
            {
                damageEffect = instance_create_layer(other.x+spreadX,other.y+spreadY,"Interactive_Over",fx_damage);
                ds_list_add(damage_list,other.id);
            }
        }
    }
}

