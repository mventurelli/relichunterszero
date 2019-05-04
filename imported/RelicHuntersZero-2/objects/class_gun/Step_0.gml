///Multitool Relic

if (!global.pause)
{
///Animation and Rotation

if instance_exists(owner)
{
    var p = owner.myPlayerId;
    
    if (isActive)
    {
        if (!owner.sprinting)
        {
            image_angle = point_direction(x,y,global.crosshairX[p],global.crosshairY[p]);
        
            if owner.look_direction == 0 { image_xscale = -1; image_angle = image_angle+180; }
            if owner.look_direction == 1 image_xscale = 1; 
        }
        else
        {
            if (owner.move_direction > 90 && owner.move_direction <= 270) { image_angle = 45; image_xscale = -1}
            else { image_angle = -45; image_xscale = 1; }
        }
            
        if ((owner.melee) || (owner.throw)) && (owner.animation_current == "melee")
        {
            if (owner.animation_index >= 0) && (owner.animation_index < 1)
            {
                x = owner.x-(5*owner.look_direction);
                y = owner.y-15;
                image_angle = 0;
            }
            if (owner.animation_index >= 1) && (owner.animation_index < 2)
            {
                x = owner.x-(5*owner.look_direction);
                y = owner.y-15;
                image_angle = 25;
            }
            if (owner.animation_index >= 2) && (owner.animation_index < 5)
            {
                x = owner.x-(10*owner.look_direction);
                y = owner.y-10;
                image_angle = 25;
            }
            if (owner.animation_index >= 5)
            {
                x = owner.x+(38*owner.look_direction);
                y = owner.y-7;
                image_angle = 160;
            }
            
            if (owner.look_direction == 0)
            { 
                image_xscale = -1;
                if (image_angle = 160)  x = owner.x-38;
                image_angle = -image_angle;
            }
            else image_xscale = 1;
        }   
    }
    else
    {
        if (owner.look_direction == 0) { image_angle = 225; image_xscale = -1}
        else { image_angle = 135; image_xscale = 1; }
    }
}

//Adjust Gun Height for Rider

if (instance_exists(owner)) if (owner.myChar == char_rider){
    y -= 18;
}

//Recoil

recoil_current += recoil_speed;

if (recoil_current > 0) recoil_speed -= recoil_return;
else
{
    recoil_current = 0;
    recoil_speed = 0;
}

if (recoil_current > recoil_max) recoil_current = recoil_max;



drawX = x +lengthdir_x( (-1*image_xscale*recoil_current), image_angle );
drawY = y +lengthdir_y( (-1*image_xscale*recoil_current), image_angle );

///Ammo
if (isActive)
{
    var input_reloading = false;

    if (instance_exists(owner))
    {
        if (owner.reloadKey) input_reloading = true;
    }

    if ( (!ammo_current) || (input_reloading) ) && (!reloading) && (ammo_current < ammo) && instance_exists(owner)
    {
        var p = owner.myPlayerId;
        
        var ammoTotal = 999;
        if (ammo_cost > 0)
        {
            if (ammo_type == type_light) ammoTotal = floor(global.ammo_light[p]/ammo_cost);
            else if (ammo_type == type_medium) ammoTotal = floor(global.ammo_medium[p]/ammo_cost);
            else if (ammo_type == type_heavy) ammoTotal = floor(global.ammo_heavy[p]/ammo_cost);
            else if (ammo_type == type_grenade) ammoTotal = floor(global.ammo_grenade[p]/ammo_cost);
        }
        
        if (ammoTotal)
        {
            ammo_diff = min(ammoTotal, (ammo - ammo_current));
            
            reloading = true;

            audio_play(owner.audio_emitter,false,1,sfx_reload_start);
            audio_play_exclusive(owner.audio_emitter,false,1,sfx_reload_loop1,sfx_reload_loop2,sfx_reload_loop3);
        }
    }
    
    if (reloading) && instance_exists(owner)
    {
        var p = owner.myPlayerId;
        
        if (!owner.melee) {
			reload_time_current += delta_time;
			if (global.relic_multitool ==2) reload_time_current += delta_time*2;
		}
		
        if reload_time_current >= reload_time
        {
            reload_time_current = 0;
            reloading = false;
            ammo_current += ammo_diff;
            
            if (ammo_type = type_light) global.ammo_light[p] -= ammo_diff*ammo_cost;
            else if (ammo_type = type_medium) global.ammo_medium[p] -= ammo_diff*ammo_cost;
            else if (ammo_type = type_heavy) global.ammo_heavy[p] -= ammo_diff*ammo_cost;
            else if (ammo_type = type_grenade) global.ammo_grenade[p] -= ammo_diff*ammo_cost;
            
            if instance_exists(owner) audio_play(owner.audio_emitter,false,1,sfx_reload_end);
            if (audio_is_playing(sfx_reload_loop1)) audio_stop_sound(sfx_reload_loop1);
            if (audio_is_playing(sfx_reload_loop2)) audio_stop_sound(sfx_reload_loop2);
            if (audio_is_playing(sfx_reload_loop3)) audio_stop_sound(sfx_reload_loop3);
        }
    }
    
    if ammo_current > ammo ammo_current = ammo;
}
else 
{
    reload_time_current = 0;
    reloading = false;
}

///Aiming

if instance_exists(owner) && (isActive)
{
    var p = owner.myPlayerId;
    if (owner.aiming) || (projectile_obj == obj_projectile_beam) 
    {
        aiming_direction = point_direction(x,y,global.crosshairX[p],global.crosshairY[p]);
          
        range_to_solid = range_finder(x,y,aiming_direction,projectile_range,class_solid,false,true);
        range_to_enemy = range_finder(x,y,aiming_direction,projectile_range,class_enemy,false,true);
        
        range_to_friendly = -1;
        if (global.playerCount > 1) && (global.friendlyFire)
        {
            for (var i=0; i<instance_number(class_player); i++)
            {
                var testFriendly = instance_find(class_player,i);
                if (testFriendly) && instance_exists(testFriendly)
                {
                    if (testFriendly.myPlayerId != owner.myPlayerId) range_to_friendly = range_finder(x,y,aiming_direction,projectile_range,testFriendly,false,true);
                }
            }
        }
        
        if (!range_to_solid) range_to_solid = distance_far;
        if (!range_to_enemy) range_to_enemy = distance_far;
        if (!range_to_friendly) range_to_friendly = distance_far;

        if (!goesThroughWalls) draw_range = min(range_to_solid,range_to_enemy,range_to_friendly,projectile_range);
        else draw_range = projectile_range;
        
        lineX = x+lengthdir_x(draw_range,aiming_direction);
        lineY = y+lengthdir_y(draw_range,aiming_direction);
        
        isPrecisionAiming = false;
        
        var enemyTargetTest = collision_line(x, y, x+lengthdir_x(projectile_range,aiming_direction), y+lengthdir_y(projectile_range,aiming_direction), class_enemy , false , true )
        if instance_exists(enemyTargetTest)
        {
            var bbox_center = get_bbox_center(enemyTargetTest);
            var distanceToTarget = point_distance(x,y, bbox_center[0], bbox_center[1]) - global.precisionDistance;
            var angleToTarget = point_direction(x+lengthdir_x(distanceToTarget,aiming_direction), y+lengthdir_y(distanceToTarget,aiming_direction), bbox_center[0], bbox_center[1]);
            
            if ( abs( angle_difference(aiming_direction, angleToTarget) ) <= (global.precisionAngle) )
            {
                isPrecisionAiming = true;
            }
        }
    }
}

///Firing Control
if (isActive) && (owner) && instance_exists(owner)
{
    input_held = false;
    input_pressed = false;
    
    if (global.input[owner.myPlayerId] == K_INPUT_KEYBOARD) && (!owner.inputLocked)
    {
        if input_key_fire() input_held = true;
        if input_key_fire_pressed() input_pressed = true;
    }
    else if (!owner.inputLocked)
    {
        var joy = global.input[owner.myPlayerId];
        if (joy_rpos(joy) > 0.7) 
        {
            input_held = true;
            if (!trigger_pressed)
            {
                trigger_pressed = true;
                input_pressed = true;
            }
        }
        
        if (joy_rpos(joy) < 0.4) && (trigger_pressed) trigger_pressed = false;
    }
    
    if ((input_held) || (input_pressed)) && (owner.sprinting) //hackz0r!
    {
        if (!reloading) && (can_fire) owner.sprinting = false;
    }
    
    
    if (input_held) && (fire_automatic)
    {
        if (!reloading) && (can_fire) && (!owner.sprinting) && (!owner.melee) cmd_fire();
    }
    
    if (input_pressed) && (!fire_automatic)
    {
        if (!reloading) && (can_fire) && (!owner.sprinting) && (!owner.melee) cmd_fire();
    }
    
    if (input_pressed) && (reloading)
    {
        audio_play(owner.audio_emitter,false,1,sfx_click);
		gui_info_show_at(owner.id, owner.x, owner.y, "Interactive_Over", K_BETU_RED, loc_key("INFO_RELOADING"));
    }
    else if (input_pressed) && (!ammo_current)
    {
        audio_play(owner.audio_emitter,false,1,sfx_click);
		gui_info_show_at(owner.id, owner.x, owner.y, "Interactive_Over", K_BETU_RED, loc_key("INFO_OUTOFAMMO"));
    }
	
    //Rate of Fire
    if (!can_fire)
    {
        fire_rate_current += delta_time;
        if fire_rate_current >= (fire_rate + fireRateDecayCurrent) || (global.relic_fire_freak == 2 && fire_rate_current >= (0.5*fire_rate + fireRateDecayCurrent))
        {
            fire_rate_current = 0;
            fire_burst_current = 0;
            can_fire = true;
        }
    }
    
    //Rate of Fire Decay Recovery    
    if (!input_held) || (reloading) || (!ammo_current)
    {
        fireRateDecayCurrent += fireRateDecayRecovery * delta_time * ms_to_s_60;
	    if (fireRateDecayCurrent > fireRateDecayMax) fireRateDecayCurrent = fireRateDecayMax;
	    else if (fireRateDecayCurrent < fireRateDecayMin) fireRateDecayCurrent = fireRateDecayMin;
    }
    
    //Burst Fire
    if fire_burst_current < fire_burst && (!can_fire)
    {
        fire_burst_rate_current += delta_time;
        if fire_burst_rate_current >= fire_burst_rate
        {
            fire_burst_rate_current = 0;
            cmd_fire();
        }   
    }
}

///Death
if (!instance_exists(owner)) instance_destroy();

}
///Set Camera Distance When Zoomed
if (isActive) && instance_exists(controller_camera)
{
    controller_camera.weaponRange = projectile_range;
}

