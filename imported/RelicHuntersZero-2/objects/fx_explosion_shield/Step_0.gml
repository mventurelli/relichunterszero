///Expand Radius
{
    if (radiusSpeed < radiusSpeedMax) radiusSpeed += min ( radiusAccel, (radiusSpeedMax-radiusSpeed));

    if (radius < radiusFinal) radius += min(radiusSpeed, (radiusFinal-radius) );
    else {
        audio_emitter_free(audio_emitter);
        instance_destroy();
    }
    radiusAlpha -= radiusAlphaSpeed;
}

///Damage

if (damage)
{    
    var poor_guy = collision_circle(x,y,radiusFinal,class_enemy,false,true);

    if (poor_guy)
    {
        if (ds_list_find_index(damage_list,poor_guy) < 0) && (poor_guy.isVulnerable)
        {
            ds_list_add(damage_list,poor_guy);
            
            if (poor_guy.shield)
            {
                if damage > poor_guy.energy
                {
                    damage -= poor_guy.energy;
                    poor_guy.energy = 0;
                    poor_guy.hp -= damage;

                    repeat(10) 
                    {
                        //blood = instance_create_layer(poor_guy.x,poor_guy.y,"Interactive",fx_blood);
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
					blood = get_object_from_pool(blood_pool);
					if (instance_exists_fast(blood)) {
						reset_blood_instance(blood, poor_guy.x, poor_guy.y, "Interactive");
						blood.vertical_speed_start = random_range(5,10);
						blood.speed_per_second = random_range(5,9);
					}
                }
            }
            
            if (poor_guy.hp <= 0) want_to_pause = true;
            poor_guy.hit_taken = true;
            
            poor_guy.pushed = true;
            poor_guy.push_direction = point_direction(x,y,poor_guy.x,poor_guy.y);
            poor_guy.push_speed = push_power;
        }
    }
    
    poor_object = collision_circle(x,y,radiusFinal,obj_wall,false,true);
    if instance_exists(poor_object) && (ds_list_find_index(damage_list,poor_object) < 0)
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

if (want_to_pause)
{
    ////if (global.allowKillFreeze) global.pause = room_speed*0.07;
    want_to_pause = false;
}


if (!screen_shaken)
{
    add_screen_shake(40,0,true);
    screen_shaken = true;
}




