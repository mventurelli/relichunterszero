var __b__;
__b__ = action_if(global.pause);
if !__b__
{
{
///Animation & VFX

if (look_direction == 1) image_xscale = 1;
else image_xscale = -1;


//Hit Taken
if (hit_taken)
{   
    
    energy_regen_time_current = 0;
    
    if (shield)
    {
        shield_effect = instance_create_layer(x,y,"Interactive",fx_shield);
        shield_effect.sprite_index = spr_shield_boss;
		owner_add_owned_instance(shield_effect);
        //shield_effect.owner = id;
        shield_effect.blue = false;
        hit_taken = false;
    }
    
    if (!shield)
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
}
else
{
    if (moving) sprite_index = sprite_walk;
    else sprite_index = sprite_idle;
    
    if (dodging)
    {
        if (!instance_exists(myDash))
        {
            myDash = instance_create_layer(x,y,"Interactive",fx_duck_dash);
            owner_add_owned_instance(myDash);
            myDash.slowness = 2;
            myDash.alpha = 100;
        }
        if (!instance_exists(myDash2))
        {
            myDash2 = instance_create_layer(x,y,"Interactive",fx_duck_dash);
            owner_add_owned_instance(myDash2);
            myDash2.slowness = 4;
            myDash2.alpha = 60;
        }
        sprite_index = sprite_dash;
    }
    image_speed = 0.2;
    hit_taken_count = 0;
}

///Life, Shield & Death

if (hp > hp_max) hp = hp_max;
if (energy > energy_max) energy = energy_max;

if instance_exists(controller_main){
    if (controller_main.debug_forceLevelExit) hp = 0;
}

if (!elite)
{
    shield = false;
}


//Shield
if energy < energy_max
{
    energy_regen_time_current += delta_time;
    if energy_regen_time_current >= energy_regen_time
    {
        if (!energy) energy = 1;
        shield = true;
        energy += energy_regen_speed * delta_time * ms_to_s_60;
        if (energy > energy_max) energy = energy_max;
    }
    
    if energy_regen_time_current = energy_regen_time
    {
        myRecharge = instance_create_layer(x,y,"Interactive",fx_shield_up);   
        owner_add_owned_instance(myRecharge);
        myRecharge.blue = false;
    }
}

if (!energy) && (shield == true)
{
    myShieldEffect = instance_create_layer(x,y,"Interactive",fx_shield_explosion);
    owner_add_owned_instance(myShieldEffect);
    myShieldEffect.blue = false;
    
    mySparks = instance_create_layer(x,y,"Interactive",fx_shield_down);
    owner_add_owned_instance(mySparks);
    mySparks.blue = false;
    
    shield = false;
    
}

///HP Milestones & Boss Phases Control
if (hpMilestoneCurrent < 4) {
	if (hpMilestoneCurrent == 0)
	{
	    if hp < hpMilestone1
	    {
	        hpMilestoneCurrent = 1;

	        shield = true;
	        elite = true;
	        energy = energy_max;
	        if instance_exists(obj_generator1)
	        {
	            obj_generator1.isVulnerable = true;
	            show_debug_message("Boss just toggled generator1 variable isVulnerable to "+string(obj_generator1.isVulnerable));
	        }
        
	        //Wave 1
	        instance_create_layer(1928,832,"Interactive",obj_turtle3);
	        instance_create_layer(2120,832,"Interactive",obj_turtle3);
	        instance_create_layer(2100,832,"Interactive",obj_turtle3);
        
	        instance_create_layer(1700,850,"Interactive",obj_turtle2_shotgun);
	        instance_create_layer(1696,480,"Interactive",obj_turtle2_shotgun);
	        instance_create_layer(2048,480,"Interactive",obj_turtle3);
	        instance_create_layer(2000,480,"Interactive",obj_turtle3);
        
	        instance_create_layer(2432,900,"Interactive",obj_turtle2_submachinegun);
	        instance_create_layer(2550,900,"Interactive",obj_turtle2_submachinegun);
	        instance_create_layer(2390,880,"Interactive",obj_turtle3);
	    }
	}

	else if (hpMilestoneCurrent == 1)
	{
	    if (!instance_exists(obj_generator1))
	    {
	        shield = false;
	        elite = false;
	        energy = 0;
	    }
    
	    if hp < hpMilestone2
	    {
	        hpMilestoneCurrent = 2;
        
	        shield = true;
	        elite = true;
	        energy = energy_max;
	        if instance_exists(obj_generator2)
	        {
	            obj_generator2.isVulnerable = true;
	        }
        
	        //Wave 2
	        instance_create_layer(832,1472,"Interactive",obj_turtle3);
	        instance_create_layer(832,1664,"Interactive",obj_turtle3);
	        instance_create_layer(832,1728,"Interactive",obj_turtle2_submachinegun);
        
	        instance_create_layer(1088,2112,"Interactive",obj_duck3);
	        instance_create_layer(1088,2240,"Interactive",obj_duck2_submachinegun);
	        instance_create_layer(1088,2190,"Interactive",obj_duck2_submachinegun);
        
	        instance_create_layer(2240,2176,"Interactive",obj_duck2_shotgun);
	        instance_create_layer(2112,2176,"Interactive",obj_turtle3);
	        instance_create_layer(2368,2176,"Interactive",obj_turtle3);
        
	        instance_create_layer(3136,2048,"Interactive",obj_turtle3_sniper);
	        instance_create_layer(3200,1024,"Interactive",obj_turtle3_sniper);
        
	        instance_create_layer(2240,832,"Interactive",obj_turtle3);
	        instance_create_layer(2240,896,"Interactive",obj_turtle3);
	        instance_create_layer(2240,960,"Interactive",obj_turtle3);
	    }
	}

	else if (hpMilestoneCurrent == 2)
	{
	    if (!instance_exists(obj_generator2))
	    {
	        shield = false;
	        elite = false;
	        energy = 0;
	    }
    
	    if hp < hpMilestone3
	    {
	        hpMilestoneCurrent = 3;
        
	        shield = true;
	        elite = true;
	        energy = energy_max;
	        if instance_exists(obj_generator3)
	        {
	            obj_generator3.isVulnerable = true;
	        }
        
	        //Wave 3
	        instance_create_layer(896,1472,"Interactive",obj_turtle3);
	        instance_create_layer(896,1600,"Interactive",obj_turtle3);
	        instance_create_layer(1024,1472,"Interactive",obj_duck2_submachinegun);
	        instance_create_layer(1024,1600,"Interactive",obj_duck3);

	        instance_create_layer(3520,896,"Interactive",obj_duck3_rocket);
        
	        instance_create_layer(1536,2176,"Interactive",obj_duck2_submachinegun);
	        instance_create_layer(1664,2176,"Interactive",obj_duck2_submachinegun);
        
	        instance_create_layer(3456,2176,"Interactive",obj_turtle2_shotgun);
	        instance_create_layer(3520,2176,"Interactive",obj_turtle2_shotgun);
        
	        instance_create_layer(3456,1120,"Interactive",obj_duck3);
        
	        instance_create_layer(3008,1088,"Interactive",obj_duck2_shotgun);

	    }
	}

	else if (hpMilestoneCurrent == 3)
	{
	    //if (!instance_exists(obj_generator3))
	    {
	        hpMilestoneCurrent = 4;
        
	        shield = false;
	        elite = false;
	        energy = -1;
	        energy_max = -1;
        
	        isMoveable = true;
	        ai_grenade_chance = 0.12;
        
	        aggro_distance = 1500;
        
	        aggro_add_patrol = 0.5;
	        aggro_add_close = 2;
	        aggro_add_hit = aggro_max;
	        aggro_cost_attack = 10;
	        aggro_cost_chase = 1;
        
	        fire_range = 1500;
	        speed_walk = 2.5;
	        speed_sprint = 3.2;
        
	        ai_dash_chance = 0;
	        ai_dash_cooldown = 0;//room_speed*9999999999;
        
	        ai_supression = false;
	    }   
	}
}

///Homing Rockets Launch
var wantToFire = false;
var fireRocket = false;
var fireAngleModifier = 0;

if (rocketTimeCurrent < rocketTime) && (!wantToFire) rocketTimeCurrent += delta_time;
else wantToFire = true;

if (wantToFire) 
{   
    if (rocketFireBurst)
    {
        if (rocketFireBurstRateCurrent >= rocketFireBurstRate)
        {
            rocketFireBurstRateCurrent = 0;
            
            if (rocketFireBurst == 3) fireAngleModifier = 160;
            else if (rocketFireBurst == 2) fireAngleModifier = 180;
            else if (rocketFireBurst == 1) fireAngleModifier = 200;
            
            rocketFireBurst--;
            fireRocket = true;
        }
        else rocketFireBurstRateCurrent += delta_time;
    }
    else
    {
        wantToFire = false;
        rocketTimeCurrent = 0;
        rocketFireBurstRateCurrent = rocketFireBurstRate;
        rocketFireBurst = rocketFireBurstMax;
    }
}

if (fireRocket)
{
    var myRocket = instance_create_layer(x,y,"Interactive",obj_rocket_homing);
    if (my_gun != noone) myRocket.direction = fireAngleModifier + my_gun.shoot_direction;
    owner_add_owned_instance(myRocket);
    myRocket.damage = 160;
	myRocket.faction = f_enemy;
    fireRocket = false;
}

///AI & Movement

//Setup
ai_movetarget_x = -1;
ai_movetarget_y = -1;
distance_to_target = distance_far;
current_distance = 0;
move_speed = speed_walk * delta_time * ms_to_s_60;
firing = false;

var myClosestPlayer = instance_nearest(x,y,faction_player);
distance_to_player = 0;
if (myClosestPlayer != noone) distance_to_player = point_distance(x,y,myClosestPlayer.x,myClosestPlayer.y);

if (grenade_count > grenade_count_max) grenade_count = grenade_count_max;

//Activate AI
if (hit_taken) want_to_activate = true;

if (!ai_active)
{
    if (distance_to_player < ai_activation_range) && (myClosestPlayer != noone) && (!want_to_activate)
    {
        if collision_line(x,y,myClosestPlayer.x,myClosestPlayer.y,obj_limit,false,true) < 0
        {
            want_to_activate = true;
        }
    }
    
    if (want_to_activate)
    {
        ai_active = true;
        activationFX = instance_create_layer(x,y,"Interactive",fx_activation);
        owner_add_owned_instance(activationFX);
    }
}

//Resolve AI
if (ai_active) && ( (distance_to_player < ai_shutdown_range) || (on_screen(x,y)) )
{
    //Find my Target 
    if ai_target_change_current >= ai_target_change || (!instance_exists_fast(ai_target))
    {
        ai_target_change_current = 0;

        ai_target = myClosestPlayer;
        distance_to_target = distance_to_player;
    }
    else 
    {
        ai_target_change_current += delta_time;
        if (ai_target == myClosestPlayer) distance_to_target = distance_to_player;
    }
    
        
    // Resolve AI with Target found
    
    if instance_exists_fast(ai_target) && (!pushed)
    {
        //Aggro Control
        if (distance_to_target <= aggro_distance) aggro += aggro_add_close;
        if (ai_state == "PATROL" || ai_state == "COVER") aggro += aggro_add_patrol;
        else if (ai_state == "CHASE") aggro -= aggro_cost_chase;
        
        if (ai_state == "PATROL" && distance_to_target > ai_patrol_max) aggro += aggro_add_close;
        
        
        if (aggro < 0) aggro = 0;
        else if (aggro > aggro_max) aggro = aggro_max;
        
        if (energy <= ai_cover_shield_threshold) && (hp > ai_cover_hp_threshold) && (elite)
        {
            ai_state = "COVER";
        }
        
        if instance_exists(class_grenadeNew)
        {
            wow_look_out_dude = instance_nearest(x,y,class_grenadeNew);
            if (point_distance(x,y,wow_look_out_dude.x,wow_look_out_dude.y) <= wow_look_out_dude.detonationRadius+50) && ai_test_dash_chance(10)
            {
                ai_state = "DASH";
                dash_direction = 180+point_direction(x,y,wow_look_out_dude.x,wow_look_out_dude.y);
            }
        }
        
        //State Switches
        if ai_state == "CHASE"
        {
            if (aggro <= 0) 
            { 
                ai_state = "PATROL"; 
                exit; 
            }
            
            if (ai_test_dash_chance(1))
            { 
                ai_state = "DASH"; 
                dash_direction = irandom_range(-50,50) + point_direction(x,y,ai_target.x,ai_target.y);
                exit;
            }
        }
        
        else if ai_state == "COVER"
        {
            if (energy >= energy_max) 
            { 
                ai_state = "PATROL"; 
                exit; 
            }
            if (hp <= ai_cover_hp_threshold) 
            { 
                ai_state = "CHASE"; 
                exit; 
            }
        }
        
        else if ai_state == "PATROL"
        {
            if aggro >= aggro_min_chase
            {
                ai_state = "CHASE";
                exit;
            }
        }
        
        //State Descriptions
        if ai_state == "CHASE"
        {
            sight_forbidden = noone;
            sight_blocked = (collision_line(x,y,ai_target.x,ai_target.y,class_solid,false,true));
            if (sight_blocked) sight_forbidden = (collision_line(x,y,ai_target.x,ai_target.y,obj_limit,false,true));
            
            throwGrenade = false;
            if (sight_blocked) && (!sight_forbidden) && (grenade_count) && (ai_test_grenade_chance(ai_grenade_cover_multiplier)) && (distance_to_target <= 400) && (!instance_exists(ai_myGrenade)) throwGrenade = true;
            if (!sight_forbidden) && (grenade_count) && (distance_to_target <= 400) && (!instance_exists(ai_myGrenade)) && (ai_test_grenade_chance(1)) throwGrenade = true;
            
            if (throwGrenade)
            {
                ai_myGrenade = instance_create_layer(x,y,"Interactive",obj_grenade_enemyNew);
                ai_myGrenade.speed_per_second = 8;
                ai_myGrenade.direction = point_direction(x,y,ai_target.x,ai_target.y);
                ai_myGrenade.speed_initial = 8;
                grenade_count--;
            }
            
            if (distance_to_target > fire_range) || ( (sight_blocked) && (!ai_supression) ) || (sight_forbidden && (!ai_supression)) || (sight_blocked && ai_target != faction_player)
            {
                ai_movetarget_x = ai_target.x;
                ai_movetarget_y = ai_target.y;
                firing = false;
            }
            else
            {
                ai_movetarget_x = x;
                ai_movetarget_y = y;
                firing = true;
            }
            
            if (sight_forbidden) && (ai_supression) aggro -= aggro_cost_sight_forbidden;
        }
        
        else if ai_state == "COVER"
        {
            move_speed = speed_sprint * delta_time * ms_to_s_60;
            sight_blocked = (collision_line(x,y,ai_target.x,ai_target.y,class_solid,false,true));
            if (distance_to_target <= fire_range) && (!sight_blocked) firing = true;
            
            //Checks for nearby covers
            if ds_priority_empty(ai_cover_priority)
            {
                cover_count = instance_number(obj_wall);
                for (i=0; i<cover_count; i++)
                {
                    cover_candidate = instance_find(obj_wall,i);
                    cover_distance = point_distance(x,y,cover_candidate.x,cover_candidate.y);
                    if cover_distance <= ai_cover_check_range
                    {
                        ds_priority_add(ai_cover_priority,cover_candidate,cover_distance);
                    }    
                }
            }
            
            //Look for best closest cover position against player (checks 4 sides)
            if (!ds_priority_empty(ai_cover_priority)) && (ai_cover_x == -1) && (ai_cover_y == -1)
            {
                tile_size = 64;
                current_distance = distance_far;
                for (i=0; i<ds_priority_size(ai_cover_priority); i++)
                {
                    cover_candidate = ds_priority_delete_min(ai_cover_priority);
                    if instance_exists(cover_candidate)
                    {
                        //Side 1
                        checkX = cover_candidate.x-(tile_size/2);
                        checkY = cover_candidate.y+(tile_size/2);
                        if (!collision_point(checkX,checkY,obj_wall,false,true)) && (collision_line(checkX,checkY,ai_target.x,ai_target.y,obj_wall,false,true))
                        {
                            candidate_distance = point_distance(x,y,ai_cover_x,ai_cover_y)
                            if candidate_distance < current_distance { ai_cover_x = checkX; ai_cover_y = checkY; current_distance = candidate_distance; }
                        }
                        //Side2
                        checkX = cover_candidate.x+(tile_size*1.5);
                        checkY = cover_candidate.y+(tile_size/2);
                        if (!collision_point(checkX,checkY,obj_wall,false,true)) && (collision_line(checkX,checkY,ai_target.x,ai_target.y,obj_wall,false,true))
                        {
                            candidate_distance = point_distance(x,y,ai_cover_x,ai_cover_y)
                            if candidate_distance < current_distance { ai_cover_x = checkX; ai_cover_y = checkY; current_distance = candidate_distance; }
                        }
                        //Side3
                        checkX = cover_candidate.x+(tile_size/2);
                        checkY = cover_candidate.y-(tile_size/2);
                        if (!collision_point(checkX,checkY,obj_wall,false,true)) && (collision_line(checkX,checkY,ai_target.x,ai_target.y,obj_wall,false,true))
                        {
                            candidate_distance = point_distance(x,y,ai_cover_x,ai_cover_y)
                            if candidate_distance < current_distance { ai_cover_x = checkX; ai_cover_y = checkY; current_distance = candidate_distance; }
                        }
                        //Side4
                        checkX = cover_candidate.x+(tile_size/2);
                        checkY = cover_candidate.y+(tile_size*1.5);
                        if (!collision_point(checkX,checkY,obj_wall,false,true)) && (collision_line(checkX,checkY,ai_target.x,ai_target.y,obj_wall,false,true))
                        {
                            candidate_distance = point_distance(x,y,ai_cover_x,ai_cover_y)
                            if candidate_distance < current_distance { ai_cover_x = checkX; ai_cover_y = checkY; current_distance = candidate_distance; }
                        } 
                    }
                }
            }
            
            //Resolve
            if (ai_cover_x) && (ai_cover_y)
            {
                ai_movetarget_x = ai_cover_x;
                ai_movetarget_y = ai_cover_y;
                
                if point_distance(x,y,ai_cover_x,ai_cover_y) < 20
                {
                    ai_cover_x = -1;
                    ai_cover_y = -1;
                    ds_priority_clear(ai_cover_priority);
                }
            }
            
        }
        
        if ai_state == "PATROL"
        {
            if (ai_patrol_x) && (ai_patrol_y)
            {
                if (collision_point(ai_patrol_x,ai_patrol_y,class_solid,false,true) < 0)
                {
                    ai_movetarget_x = ai_patrol_x;
                    ai_movetarget_y = ai_patrol_y;
                }
                else
                {
                    ai_movetarget_x = x;
                    ai_movetarget_y = y;
                }
            }
            else
            {
                ai_patrol_x = x+(random_range(-400,400));
                ai_patrol_y = y+(random_range(-400,400));
            }
        }
        else
        {
            ai_patrol_x = -1;
            ai_patrol_y = -1;
        }
        
        if ai_state == "DASH"
        {
            ai_state = "PATROL";
            ai_dash_cooldown_current = 0;
            audio_play(audio_emitter,false,1,sfx_dash1,sfx_dash2,sfx_dash3);
            
            dodging = true;
            pushed = true;
            push_direction = dash_direction;
            push_speed = dash_speed * delta_time * ms_to_s_60;
            exit;
        }
        else if (ai_dash_cooldown_current < ai_dash_cooldown) ai_dash_cooldown_current += delta_time;
    }
}

//Look Direction
if instance_exists_fast(ai_target)
{
    if (ai_target.x > x) look_direction = 1;   
    else look_direction = 0;
}

//Resolve
if (isMoveable) path_update();

moving = false;
if (ai_movetarget_x) && (ai_movetarget_y) && (point_distance(x,y,ai_movetarget_x,ai_movetarget_y) > 3)
{
    moving = true;
}


// Push
if (pushed) && (isMoveable)
{
    path_end();
    move_step_ext(x + lengthdir_x(push_speed, push_direction),y + lengthdir_y(push_speed, push_direction),0,class_solid,0,0,0,0,0,0);

    push_speed -= push_friction * delta_time * ms_to_s_60;
    if push_speed < 0 push_speed = 0;
    
    push_duration_current += delta_time;
    if push_duration_current >= push_duration
    {
        push_duration_current = 0;
        pushed = false;
        dodging = false;
    }
}
else
{
    push_duration_current = 0;
    pushed = false;
    dodging = false;
    push_speed = 0;
}

///Audio
audio_emitter_position(audio_emitter, x, y, 0);

}
}
///Anti-Bug: Teleport If Inside Wall

if collision_point(x,y,obj_limit,false,true) && (room==room_boss)
{
    //Middle of Boss Room
    x=2440;
    y=1480;
}

