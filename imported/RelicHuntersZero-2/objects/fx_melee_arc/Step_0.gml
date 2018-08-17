///Damage and Death
if (owner != noone) 
{
    depth = owner.depth+2;
    image_xscale = owner.image_xscale;
    if (!owner.melee) && (!owner.dodging) instance_destroy();
    
    //Player back damage
    fucker = collision_ellipse(owner.bbox_left,owner.bbox_top,owner.bbox_right,owner.bbox_bottom,class_enemy,false,true);
    
    if instance_exists_fast(fucker)
    {
        
        if (ds_list_find_index(damage_list,fucker.id) < 0) && (ds_list_size(damage_list) < max_hits) && (fucker.isVulnerable)
        {
            ds_list_add(damage_list,fucker.id);
            
            fucker.aggro += fucker.aggro_add_hit;
            
            if (global.relic_midnight_beer == 2) damage += round(damage*global.midnightDamageMultiplier ); //Midnight Beer
            if (global.relic_midnight_meal == 2) damage += round(damage*global.midnightDamageMultiplier ); //Midnight Meal
            
            if (fucker.shield) 
            {
                fucker.energy -= damage;
                if (fucker.energy <= 0) audio_play(fucker.audio_emitter,false,1,sfx_shield_destroy);
                else audio_play_exclusive(fucker.audio_emitter,false,1,sfx_shield_hit1,sfx_shield_hit2);
            }
            else fucker.hp -= damage;
    
            fucker.hit_taken = true;
            if (hasJoy) joy_rumble(joy,7,7);
            
            fucker.pushed = true;
            fucker.push_direction = point_direction(owner.x,owner.y,fucker.x,fucker.y);
            fucker.push_speed += push_power;
            
            spreadX = irandom_range(-15,15);
            spreadY = irandom_range(-15,15);
            damage_fx = instance_create_layer(fucker.x+spreadX,fucker.y+spreadY,"Interactive_Over",fx_damage);
            damage_fx.damage = damage;
            damage_fx.critical = true;
        }
    }
    else
    {
        fucker = collision_ellipse(owner.bbox_left,owner.bbox_top,owner.bbox_right,owner.bbox_bottom,obj_wall,false,true);
        if instance_exists_fast(fucker)
        {
            if (ds_list_find_index(damage_list_solid,fucker.id) < 0)
            {
                ds_list_add(damage_list_solid,fucker.id);
                
                push_direction = point_direction(owner.x,owner.y,fucker.x,fucker.y);
                
                fucker.hp -= damage;
                if (hasJoy) joy_rumble(joy,7,7);
                fucker.shake_direction = push_direction;
                fucker.hitDirection = push_direction;
                fucker.push_direction = push_direction;
                fucker.shake += 5;
                fucker.hit_taken = true;
            }
        }
    }
}
else instance_destroy();

