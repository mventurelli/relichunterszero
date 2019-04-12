///Friendly Fire
if (global.friendlyFire)
{
    if (owner != noone)//(instance_exists(other)) && (instance_exists(owner))
    {
        if (other.myPlayerId != owner.myPlayerId)
        {
            ffDamage = round(damage * global.friendlyFireDamageRatio);
            
            spreadX = irandom_range(-15,15);
            spreadY = irandom_range(-15,15);
                
            if (!other.dodging)
            {
                ds_list_add(damage_list,other.id);
                
                if (global.relic_midnight_beer == 2) ffDamage += round(ffDamage*global.midnightDamageMultiplier ); //Midnight Beer
                if (global.relic_midnight_meal == 2) ffDamage += round(ffDamage*global.midnightDamageMultiplier ); //Midnight Meal
                if (global.relic_black_cat == 2) if (random(1) <= 0.25) ffDamage += ffDamage;
				
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
		            bloodAmount = min(round(ffDamage/5), 5);//min(round(damage/5), (global.max_casings-global.count_casings), 5);
		            if (bloodAmount) repeat(bloodAmount) 
					{
						//blood = instance_create_layer(x,y,"Interactive",fx_blood);
						blood = get_object_from_pool(blood_pool);
						if (instance_exists_fast(blood)) reset_blood_instance(blood, x, y, "Interactive");
					}
                    
                    if (other.hp <= 0) achievement_give("ACHIEVEMENT_TEAMKILL");
                }
                other.hit_taken = true;
                
                
                damage_fx = instance_create_layer(other.x+spreadX,other.y+spreadY,"Interactive_Over",fx_damage);
                damage_fx.damage = ffDamage;
        
                instance_destroy();
            }
            
            if (other.dodging) && (ds_list_find_index(damage_list,other.id) < 0)
            {
                ds_list_add(damage_list,other.id);
                damageEffect = instance_create_layer(other.x+spreadX,other.y+spreadY,"Interactive_Over",fx_damage);
            }
        }
    }
}

