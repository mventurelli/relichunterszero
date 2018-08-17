///Physics

depth= -y;

if (vertical_speed_start) 
	vertical_speed += fake_gravity;
else 
	depth = layer_get_depth("Interactive_Under");

draw_height += vertical_speed * delta_time * ms_to_s_60;

if draw_height >= 0 && (vertical_speed_start)
{
    draw_height = 0;
    vertical_speed = 0;
    vertical_speed_start -= random_range(bounce_min,bounce_max);
        
    if (vertical_speed_start <= vertical_speed_start_min) 
	{
		vertical_speed_start = 0;
		speed_per_second = 0;
	}
    else {
		vertical_speed = -vertical_speed_start;
	}
}

///Attraction and Pickup
if (!instance_exists_fast(magnet_player)) 
{
	if (vertical_speed_start < interactive_speed) && instance_exists(class_player)
	{
	    var candidate_magnet_player = instance_nearest(x,y,class_player);
		if (candidate_magnet_player != noone) {
		    var p = candidate_magnet_player.myPlayerId;
		    var isAmmoFull = false;
        
		    if (ammoType == type_light) {
				if (global.ammo_light[p] >= global.ammo_light_max) 
					isAmmoFull = true;
			}
		    else if (ammoType == type_medium) {
				if (global.ammo_medium[p] >= global.ammo_medium_max) 
					isAmmoFull = true;
			}
		    else if (ammoType == type_heavy) {
				if (global.ammo_heavy[p] >= global.ammo_heavy_max) 
					isAmmoFull = true;
			}
    
		    if (!isAmmoFull)
		    {
		        isInteractive = true;            
            
				if point_distance(x,y,candidate_magnet_player.x,candidate_magnet_player.y) <= magnet_range
				{
					magnet_player = candidate_magnet_player;
				}  
		    }
		}
	}
}

///Ammo Type
if (ammoType == type_light) sprite_subimage = 1;
else if (ammoType == type_medium) sprite_subimage = 2;
else if (ammoType == type_heavy) sprite_subimage = 0;
