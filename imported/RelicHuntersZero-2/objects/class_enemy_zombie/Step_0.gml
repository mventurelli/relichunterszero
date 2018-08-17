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
else
{
    if (moving) sprite_index = sprite_walk;
    else sprite_index = sprite_idle;
    
    if (dodging)
    {
        if (!instance_exists(myDash))
        {
            myDash = instance_create_layer(x,y,"Interactive",fx_kamikaze_dash);
            owner_add_owned_instance(myDash);
            myDash.slowness = 2;
            myDash.alpha = 100;
        }
        if (!instance_exists(myDash2))
        {
            myDash2 = instance_create_layer(x,y,"Interactive",fx_kamikaze_dash);
            owner_add_owned_instance(myDash2);
            myDash2.slowness = 4;
            myDash2.alpha = 60;
        }
        sprite_index = sprite_dash;
    }
    image_speed = 0.2;
    hit_taken_count = 0;
    
    //Speed up animation during sprint
    if (sprite_index == sprite_walk && move_speed == speed_sprint) image_speed = 0.4;
}

///Life 
if (hp > hp_max) hp = hp_max;


///AI & Movement

//Setup
ai_movetarget_x = -1;
ai_movetarget_y = -1;
distance_to_target = distance_far;
current_distance = 0;
move_speed = speed_walk * delta_time * ms_to_s_60;
firing = false;

var myClosestPlayer = noone;
distance_to_player = distance_to_closest_player_fast(x,y);

//Activate AI
if (hit_taken) want_to_activate = true;

if (!ai_active)
{
	myClosestPlayer = instance_nearest(x,y,faction_player);
	if (myClosestPlayer != noone) distance_to_player = point_distance(x,y,myClosestPlayer.x,myClosestPlayer.y);

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
	if (myClosestPlayer == noone) {
		myClosestPlayer = instance_nearest(x,y,faction_player);
		if (myClosestPlayer != noone) distance_to_player = point_distance(x,y,myClosestPlayer.x,myClosestPlayer.y);
	}   
    
    if ai_target_change_current >= ai_target_change || (!instance_exists_fast(ai_target))
    {
        ai_target_change_current = 0;
		
		//Find my Target (Faction Check)
	    fuckingEnemy = instance_nearest(x,y,faction_monster);
	    if (fuckingEnemy != noone) distance_to_enemy = point_distance(x,y,fuckingEnemy.x,fuckingEnemy.y);
	    else distance_to_enemy = 9999;

        
        if (distance_to_enemy < distance_to_player)
        {
            ai_target = fuckingEnemy;
            distance_to_target = distance_to_enemy;
        }
        else 
        {
            ai_target = myClosestPlayer;
            distance_to_target = distance_to_player;
        }
    }
    else 
    {
        ai_target_change_current += delta_time;
        if (ai_target == myClosestPlayer) distance_to_target = distance_to_player;
        else distance_to_target = distance_to_enemy;
    }
        
    // Resolve AI with Target found
    
    if instance_exists_fast(ai_target) && (!pushed)
    {
        //Aggro Control
        if (distance_to_target <= aggro_distance) aggro += aggro_add_close;
        if (ai_state == "PATROL") aggro += aggro_add_patrol;
        if (ai_state == "CHASE") aggro -= aggro_cost_chase;
        
        if (aggro < 0) aggro = 0;
        if (aggro > aggro_max) aggro = aggro_max;

        
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
        
        
        if ai_state == "PATROL"
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
            if (damage_timer_current >= damage_timer)
            {
                ai_movetarget_x = ai_target.x;
                ai_movetarget_y = ai_target.y;
            }
            else
            {
                ai_movetarget_x = x;
                ai_movetarget_y = y;
            }
            
            //Sprint control
            if (point_distance(x,y,ai_target.x, ai_target.y) <= ai_sprint_distance) 
            {
                if (move_speed == speed_walk) && (!instance_exists(mySprintFx)) 
                {
                    mySprintFx = instance_create_layer(x,y,"Interactive",fx_sprint); 
                    mySprintFx.image_xscale = image_xscale;
                    audio_play_exclusive(audio_emitter,false,1,sfx_sprint);
                }
                move_speed = speed_sprint * delta_time * ms_to_s_60;
            }
            else move_speed = speed_walk * delta_time * ms_to_s_60;
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
            
            audio_play(audio_emitter,false,1,sfx_kami_dash);
            
            dodging = true;
            pushed = true;
            push_direction = dash_direction;
            push_speed = dash_speed * delta_time * ms_to_s_60;
            exit;
        }
        else if (ai_dash_cooldown_current < ai_dash_cooldown) ai_dash_cooldown_current += delta_time;
    }
    
    
    
    //Resolve
    path_update();
    
    moving = false;
    if (ai_movetarget_x) && (ai_movetarget_y) && point_distance(x,y,ai_movetarget_x,ai_movetarget_y) > 3
    {
        moving = true;
    }
    
    
    
    
}
/*
else
{
    ai_movetarget_x = x;
    ai_movetarget_y = y;
}*/





//Look Direction
if instance_exists(ai_target)
{
    if (ai_target.x > x) look_direction = 1;   
    else look_direction = 0;
}



//Resolve (tirei daqui)


// Push
if (pushed)
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
else push_speed = 0;

/* */
///Damage

is_player = false;
myEnemy = noone;
myEnemy = collision_ellipse(bbox_left,bbox_top,bbox_right,bbox_bottom,faction_player,false,true);
if (!myEnemy) myEnemy = collision_ellipse(bbox_left,bbox_top,bbox_right,bbox_bottom,faction_monster,false,true);
else is_player = true;

if (myEnemy) && (damage_timer_current >= damage_timer) && instance_exists(myEnemy) && (!hit_taken)
{
    if (!myEnemy.dodging)
    {
        var originalDamage = damage;
        
        damage_timer_current = 0;
        
        if (myEnemy.energy)
        {
            if (is_player) if (myEnemy.superShield) damage = 0;
            
            damage = damage*2;
            if (global.challengeSupressor) damage = damage*2;
            myEnemy.energy -= damage*2;
            
            
            if (global.challengeJaws) myEnemy.energy = 0;
            
            if (myEnemy.energy <= 0) audio_play(myEnemy.audio_emitter,false,1,sfx_shield_destroy);
            else audio_play(myEnemy.audio_emitter,false,1,sfx_shield_hit1,sfx_shield_hit2);
        }
        else myEnemy.hp -= damage;
        
        myEnemy.hit_taken = true;
        
        spreadX = irandom_range(-15,15);
        spreadY = irandom_range(-15,15);
        damage_fx = instance_create_layer(myEnemy.x+spreadX,myEnemy.y+spreadY,"Interactive_Over",fx_damage);
        damage_fx.damage = damage;
        
        if (!is_player)
        {
            myEnemy.pushed = true;
            myEnemy.push_direction = point_direction(x,y,myEnemy.x,myEnemy.y);
            myEnemy.push_speed += 4;
            
            if (myEnemy.hp <= 0) myEnemy.no_score = true;
        }
        
        audio_play(audio_emitter,false,1,sfx_kami_bite);
        
        damage = originalDamage;
    }
}
else damage_timer_current += delta_time;

/* */
///Audio
audio_emitter_position(audio_emitter, x, y, 0);

/* */
}
}


/* */
/*  */
