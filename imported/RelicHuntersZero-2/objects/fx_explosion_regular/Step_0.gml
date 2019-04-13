///Expand Radius

if (image_index >= trigger_frame)
{
    if (radiusSpeed < radiusSpeedMax) radiusSpeed += min ( radiusAccel, (radiusSpeedMax-radiusSpeed));

    if (radius < radiusFinal) radius += min(radiusSpeed, (radiusFinal-radius) );
    
    radiusAlpha -= radiusAlphaSpeed * delta_time * ms_to_s_60;
}

///Damage

if (image_index >= trigger_frame) && (image_index <= end_frame) && (damage) && (currentTargets < maxTargets)
{    
    is_enemy = true;
	poor_guy = noone;
    if (faction != f_player) poor_guy = collision_circle(x,y,radiusFinal,faction_player,false,true);
    
    if (!poor_guy) || (ds_list_find_index(damage_list,poor_guy)) 
    {
        poor_guy = collision_circle(x,y,radiusFinal,class_enemy,false,true);
    }
    else is_enemy = false;
    
    if (poor_guy)
    {
        if (ds_list_find_index(damage_list,poor_guy) < 0) && (poor_guy.isVulnerable)
        {
            ds_list_add(damage_list,poor_guy);
            
            if (poor_guy.shield)
            {
                if (!is_enemy){
                    if (poor_guy.superShield) damage = 0;
                }
                
                if damage > poor_guy.energy
                {
                    damage -= poor_guy.energy;
                    poor_guy.energy = 0;
                    if (is_enemy) poor_guy.hp -= damage;
                    else{
                        damage = floor(damage*0.4);
                        if (damage) poor_guy.hp -= damage;
                    }
                    repeat(10) 
                    {
						blood = get_object_from_pool(blood_pool);
						if (instance_exists_fast(blood)) {
							reset_blood_instance(blood, poor_guy.x, poor_guy.y, "Interactive");
							blood.vertical_speed_start = random_range(5,10);
							blood.speed_per_second = random_range(5,9);
						}
                    }
                }
                else poor_guy.energy -= damage;
            }
            else 
            {
                poor_guy.hp -= damage;
                repeat(10) 
                {
                    //blood = instance_create_layer(poor_guy.x,poor_guy.y,"Interactive",fx_blood);
                    //blood.vertical_speed_start = random_range(5,10) * global.target_fps;
                    //blood.speed = random_range(5,9) * global.target_fps;
					
					blood = get_object_from_pool(blood_pool);
					if (instance_exists_fast(blood)) {
						reset_blood_instance(blood, poor_guy.x, poor_guy.y, "Interactive");
						blood.vertical_speed_start = random_range(5,10);
						blood.speed_per_second = random_range(5,9);
					}
                }
            }
            
            var spreadX = irandom_range(-15,15);
            var spreadY = irandom_range(-15,15);
            var damage_fx = instance_create_layer(poor_guy.x+spreadX,poor_guy.y+spreadY,"Interactive_Over",fx_damage);
            damage_fx.damage = damage;
            
            if (poor_guy.hp <= 0) want_to_pause = true;
            poor_guy.hit_taken = true;
            
            if (is_enemy)
            {
                poor_guy.pushed = true;
                poor_guy.push_direction = point_direction(x,y,poor_guy.x,poor_guy.y);
                poor_guy.push_speed = push_power;
            }
            
            currentTargets++;
        }
    }
    
    poor_object = collision_circle(x,y,radiusFinal,obj_wall,false,true);
    if (poor_object != noone) && (ds_list_find_index(damage_list,poor_object) < 0)
    {
        ds_list_add(damage_list,poor_object);
        poor_object.hp -= damage*2;
        poor_object.shake_direction = irandom(360);
        poor_object.shake += 4;
    }
}

///Audio
audio_emitter_position(audio_emitter, x, y, 0);

///Pause-Controlled Animation

if (want_to_pause) && (image_index >= trigger_frame)
{
    //if (global.allowKillFreeze) global.pause = 70000;//room_speed*0.07;
    want_to_pause = false;
}

if (image_index >= trigger_frame)
{
    image_speed = 0.2;
    image_speed_unpaused = image_speed;

    if (!screen_shaken)
    {
        add_screen_shake(75,0,true);
        screen_shaken = true;
        audio_play(audio_emitter, false, 99, sfx_grenade_explosion);
    }
}

if (global.pause) && (image_index >= trigger_frame) image_speed = 0;
else image_speed = image_speed_unpaused;




