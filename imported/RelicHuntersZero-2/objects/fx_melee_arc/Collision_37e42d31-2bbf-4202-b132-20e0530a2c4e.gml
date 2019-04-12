///Damage
if instance_exists(other) && instance_exists(owner)
{
    spreadX = irandom_range(-15,15);
    spreadY = irandom_range(-15,15);
        
    if (ds_list_find_index(damage_list,other.id) < 0) && (ds_list_size(damage_list) < max_hits) && (other.isVulnerable) && (!other.dodging)
    {
        var originalDamage = damage;
        
        ds_list_add(damage_list,other.id);
        
        other.aggro += other.aggro_add_hit;
        if (global.relic_midnight_beer == 2) damage += round(damage*global.midnightDamageMultiplier ); //Midnight Beer
        if (global.relic_midnight_meal == 2) damage += round(damage*global.midnightDamageMultiplier ); //Midnight Meal
        if (global.relic_black_cat == 2) if (random(1) <= 0.25) damage += damage;
		
        if (other.shield) 
        {
            if (global.challengeSupressor) damage = damage*2;
            var excessDamage = (damage - other.energy);
            other.energy -= damage;
            if (other.energy <= 0) {
                audio_play(other.audio_emitter,false,1,sfx_shield_destroy);
                if (excessDamage) other.hp -= excessDamage;
            }
            else audio_play_exclusive(other.audio_emitter,false,1,sfx_shield_hit1,sfx_shield_hit2);
            
        }
        else 
        {
            other.hp -= damage;
            //repeat(round(damage/10)) blood = instance_create_layer(x,y,"Interactive",fx_blood);
			repeat(round(damage/10)) 
			{
				blood = get_object_from_pool(blood_pool);
				if (instance_exists_fast(blood)) reset_blood_instance(blood, x, y, "Interactive");
			}
        }
        other.hit_taken = true;
        if (hasJoy) joy_rumble(joy,7,7);
        
        other.pushed = true;
        other.push_direction = point_direction(owner.x,owner.y,other.x,other.y);
        other.push_speed += push_power;
        
        damageEffect = instance_create_layer(other.x+spreadX,other.y+spreadY,"Interactive_Over",fx_damage);
        damageEffect.damage = damage;
        damageEffect.critical = true;
        
        if (sprite_index == spr_melee_gloves)
        {
            audio_play(other.audio_emitter,false,1,sfx_gloves_hit1,sfx_gloves_hit2,sfx_gloves_hit3);
        }
        else audio_play(other.audio_emitter,false,1,sfx_impact_flesh1,sfx_impact_flesh2,sfx_impact_flesh3,sfx_impact_flesh4);
        
        damage = originalDamage;
    }
    
    if (other.dodging) && (ds_list_find_index(damage_list,other.id) < 0)
    {
        damageEffect = instance_create_layer(other.x+spreadX,other.y+spreadY,"Interactive_Over",fx_damage);
        ds_list_add(damage_list,other.id);
    }
}




