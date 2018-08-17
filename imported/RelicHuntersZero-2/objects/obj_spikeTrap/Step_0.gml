///Animation & Damage

if (activated) {
    //Damage
    is_enemy = true;
    poor_guy = collision_circle(x,y,damageRadius,faction_player,false,true);
    
    if (!poor_guy) || (ds_list_find_index(damageList,poor_guy)) 
    {
        poor_guy = collision_circle(x,y,damageRadius,class_enemy,false,true);
    }
    else is_enemy = false;
    
    if (poor_guy)
    {
        if (ds_list_find_index(damageList,poor_guy) < 0) && (poor_guy.isVulnerable) && (!poor_guy.dodging)
        {
            ds_list_add(damageList,poor_guy);
            
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
            
            if (is_enemy)
            {
                poor_guy.pushed = true;
                poor_guy.push_direction = point_direction(x,y,poor_guy.x,poor_guy.y);
                poor_guy.push_speed = push_power;
            }
        }
    }
    
    //Animation
    if (allTheWayUp) {
        damageTimeCurrent += delta_time;
        
        if (damageTimeCurrent >= damageTime) {
            allTheWayUp = false;
            goingDown = true;
            image_speed = -0.2;
        }
    }
}

//Reset
if (goingDown) && (image_index <= 0.2){
    activated = false;
    allTheWayUp = false;
    goingDown = false;
    damageTimeCurrent = 0;
    ds_list_clear(damageList);
    image_speed = 0;
}

///Shut Down on Level End

if (instance_exists(controller_main)) && (canActivate) {
    if (controller_main.level_end) canActivate = false;
}

