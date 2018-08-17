///Explode unless invulnerable, but deals trampleDamage
if (!isInvulnerable) explode = true;
else
{
    spreadX = irandom_range(-15,15); spreadY = irandom_range(-15,15);

    if (!other.dodging) && (ds_list_find_index(hitList,other.id) < 0)
    {
        ds_list_add(hitList,other.id);
        other.aggro += other.aggro_add_hit;
        
        if (other.shield)
        {
            other.energy -= trampleDamage;
            audio_play_exclusive(other.audio_emitter,false,1,sfx_shield_hit1,sfx_shield_hit2);
            if (other.energy <= 0) audio_play(other.audio_emitter,false,1,sfx_shield_destroy);
        }
        else 
        {
            other.hp -= trampleDamage;
            
            audio_play(audio_emitter,false,1,sfx_impact_flesh1,sfx_impact_flesh2,sfx_impact_flesh3,sfx_impact_flesh4);
            
            //bloodAmount = min(round(trampleDamage/5), (global.max_casings-global.count_casings), 5);
            //if (bloodAmount) repeat(bloodAmount) blood = instance_create_layer(x,y,"Interactive",fx_blood);
			bloodAmount = min(round(trampleDamage/5), 5);
			if (bloodAmount) repeat(bloodAmount)
			{
				blood = get_object_from_pool(blood_pool);
				if (instance_exists_fast(blood)) reset_blood_instance(blood, x, y, "Interactive");
			}
        }
        other.hit_taken = true;
        
        other.pushed = true;
        other.push_direction = direction;
        other.push_speed += push_power;
        
        
        
        trampleDamageEffect = instance_create_layer(other.x+spreadX,other.y+spreadY,"Interactive_Over",fx_damage);
        if (type == 2) && (!other.shield) trampleDamageEffect.critical = true;
        trampleDamageEffect.damage = trampleDamage;
        
        if (global.count_particles < global.max_particles)
        {
            hit = instance_create_layer(x,y,"Interactive",fx_hit);
            hit.type = ammo_type;
        }
    }
    
    if (other.dodging) && (ds_list_find_index(hitList,other.id) < 0)
    {
        ds_list_add(hitList,other.id);
        damageEffect = instance_create_layer(other.x+spreadX,other.y+spreadY,"Interactive_Over",fx_damage);
    }
}

