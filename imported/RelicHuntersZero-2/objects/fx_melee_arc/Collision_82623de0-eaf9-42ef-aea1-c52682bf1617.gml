if instance_exists(other)
{
    if (ds_list_find_index(damage_list_solid,other.id) < 0)
    {
        ds_list_add(damage_list_solid,other.id);
        
        if (global.relic_midnight_beer == 2) damage += round(damage*global.midnightDamageMultiplier ); //Midnight Beer
        if (global.relic_midnight_meal == 2) damage += round(damage*global.midnightDamageMultiplier ); //Midnight Meal
        
        if (instance_exists(owner)) push_direction = point_direction(owner.x,owner.y,other.x,other.y);
        
        other.hp -= damage;
        other.shake_direction = push_direction;
        other.hitDirection = push_direction;
        other.explosionDirection = push_direction;
        other.shake += 5;
        if (hasJoy) joy_rumble(joy,7,7);
        other.hit_taken = true;
        
        if (sprite_index == spr_melee_gloves)
        {
            audio_play(other.audio_emitter,false,1,sfx_gloves_hit1,sfx_gloves_hit2);
        }
    }
}

