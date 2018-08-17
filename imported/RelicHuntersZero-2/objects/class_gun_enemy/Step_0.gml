///Animation and Rotation
if ((!global.pause) && (owner != noone))
{
	stepHasTarget = false;

	if (owner.ai_target != noone)
	{
		stepHasTarget = true;
		image_angle = point_direction(x,y,owner.ai_target.x,owner.ai_target.y);
	    if owner.look_direction == 0 image_angle = image_angle+180;
	}
    
	if owner.look_direction == 0 image_xscale = -1;
	if owner.look_direction == 1 image_xscale = 1; 


	//Recoil
	recoil_current += recoil_speed;

	if (recoil_current > 0) {
		recoil_speed -= recoil_return;
	}
	else
	{
	    recoil_current = 0;
	    recoil_speed = 0;
	}

	if (recoil_current > recoil_max) recoil_current = recoil_max


	drawX = x +lengthdir_x( (-1*image_xscale*recoil_current), image_angle );
	drawY = y +lengthdir_y( (-1*image_xscale*recoil_current), image_angle );

	///Firing Control
	if (stepHasTarget)
	{
	    shoot_direction = point_direction(x,y,owner.ai_target.x,owner.ai_target.y);
	    if (owner.firing) && (can_fire)
	    {
	        //shot_type = 0;
	        cmd_fire_enemy();
	    }
    
	    //Rate of Fire
	    if (!can_fire) && (fire_burst_current >= fire_burst)
	    {
			if (global.challengeBloodlust)
				var timeToAdd = delta_time * global.challengeBloodlustRate;
			else
				var timeToAdd = delta_time;
				
	        if (!is_sniper) || (drawLaserSight) fire_rate_current += timeToAdd;
	        else fire_rate_current -= min(fire_rate_current,timeToAdd);
        
	        if fire_rate_current >= fire_rate
	        {
	            fire_rate_current = 0;
	            fire_burst_current = 0;
	            can_fire = true;
	        }
	    }
    
	    //Burst Fire
	    if (fire_burst_current < fire_burst) && (!can_fire) && (owner.firing)
	    {
			if (!is_sniper) || (drawLaserSight) fire_burst_rate_current += delta_time;
	        else fire_burst_rate_current -= min(fire_burst_rate_current,delta_time);
			
	        if fire_burst_rate_current >= fire_burst_rate
	        {
	            fire_burst_rate_current = 0;
	            cmd_fire_enemy();
	        }   
	    }
	}
	
	//Sniper Laser Sight
	if (is_sniper)
	{
		drawLaserSight = false;
		
		if (owner.firing) && (owner.ai_target != noone)
	    {
	        aiming_direction = point_direction(x,y,owner.ai_target.x,owner.ai_target.y);
        
	        range_to_solid = range_finder(x,y,aiming_direction,projectile_range,class_solid,false,true);
	        range_to_enemy = range_finder(x,y,aiming_direction,projectile_range,class_player,false,true);
	        {
	            if (!range_to_solid) range_to_solid = distance_far;
	            if (!range_to_enemy) range_to_enemy = distance_far;
	            laserDrawRange = min(range_to_solid,range_to_enemy,projectile_range);
            
	            laserLineX = x+lengthdir_x(laserDrawRange,aiming_direction);
	            laserLineY = y+lengthdir_y(laserDrawRange,aiming_direction);
				
				drawLaserSight = true;
	        }
	    }
	}
}
