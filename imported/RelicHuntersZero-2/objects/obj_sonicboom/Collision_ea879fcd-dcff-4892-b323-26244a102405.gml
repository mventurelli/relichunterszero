///Enemy Damage
if faction == f_player && instance_exists(other)
{
    if (!other.dodging) && (ds_list_find_index(damage_list,other.id) < 0)
    {
        var originalDamage = damage;
        ds_list_add(damage_list,other.id);
        
        if (global.relic_midnight_beer == 2) damage += round(damage*global.midnightDamageMultiplier ); //Midnight Beer
        if (global.relic_midnight_meal == 2) damage += round(damage*global.midnightDamageMultiplier ); //Midnight Meal
        if (global.relic_black_cat == 2) if (random(1) <= 0.25) damage += damage;
		
        other.aggro += other.aggro_add_hit;
        
        if (other.shield)
        {
            if (global.challengeSupressor) damage = damage*2
            other.energy -= damage;
            audio_play_exclusive(other.audio_emitter,false,1,sfx_shield_hit1,sfx_shield_hit2);
            if (other.energy <= 0) audio_play(other.audio_emitter,false,1,sfx_shield_destroy);
        }
        else 
        {
            if (allowPrecision)
            {
                var otherBBoxCenter = get_bbox_center(other.id);
                var precisionAngle = angle_precision(x,y,otherBBoxCenter[0],otherBBoxCenter[1],direction);
                //var angleToTarget = point_direction(x,y,otherBBoxCenter[0],otherBBoxCenter[1]);
                if  (precisionAngle != -1) && (precisionAngle <= global.precisionAngle) isPrecise = true;
                else isPrecise = false;
                
                if (isPrecise) damage = damage*1.5;
            }
            
            other.hp -= damage;
            
            audio_play(audio_emitter,false,1,sfx_impact_flesh1,sfx_impact_flesh2,sfx_impact_flesh3,sfx_impact_flesh4);
            
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
        
		if (!other.isBoss)
		{
	        other.pushed = true;
	        other.push_direction = direction;
	        other.push_speed += push_power;
		}
		
        if (other.hp) <= 0 && (type == 2)
        {
            other.critical_death = true;
        }
        
        spreadX = irandom_range(-15,15);
        spreadY = irandom_range(-15,15);
        
        damageEffect = instance_create_layer(other.x+spreadX,other.y+spreadY,"Interactive_Over",fx_damage);
        if (isPrecise) && (!other.shield) damageEffect.critical = true;
        damageEffect.damage = damage;
        
        if (global.count_particles < global.max_particles)
        {
            hit = instance_create_layer(x,y,"Interactive",fx_hit);
            hit.type = ammo_type;
        }
        
        if (!piercing) 
        {
            instance_destroy();
        }
        else piercing--;
        
        damage = originalDamage;
    }
}

