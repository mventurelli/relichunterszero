///Life & Death
if (hp > hp_max) hp = hp_max;

    

///Hit Taken
if (hit_taken)
{   
    hit_taken_count += delta_time;
        
    if (hit_taken_count >= hit_taken_max) hit_taken = false;
    if (image_index == image_number-1) image_speed = 0;
        
    if (hit_taken_count > 0) && (sprite_index != sprite_hit)
    {
        sprite_index = sprite_hit;
        image_speed = 0.2;
        image_index = 0;
    }
}
else sprite_index = sprite_idle;

///Damage Player

player = collision_ellipse(bbox_left,bbox_top,bbox_right,bbox_bottom,class_player,false,true);

if (player) && (damage_timer_current >= damage_timer) && instance_exists_fast(player)
{
    if (!player.dodging)
    {
        damage_timer_current = 0;
        
        if (player.energy) player.energy = 0;
        else player.hp -= damage;
        
        player.hit_taken = true;
        
        spreadX = irandom_range(-15,15);
        spreadY = irandom_range(-15,15);
        damage_fx = instance_create_layer(player.x+spreadX,player.y+spreadY,"Interactive_Over",fx_damage);
        damage_fx.damage = damage;
    }

}
else damage_timer_current += delta_time;

