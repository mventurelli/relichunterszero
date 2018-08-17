///Pickup
if (vertical_speed_start < interactive_speed) && (instance_exists(other)) &&  (isInteractive)
{
    var p = other.myPlayerId;
    var isAmmoFull = false;
    
    if (ammoType == type_light) 
	{
		if (global.ammo_light[p] < global.ammo_light_max) 
		{ 
			global.ammo_light[p] += myAmmo; 
		} 
		else 
		{
			isAmmoFull = true;
		}
	}
    else if (ammoType == type_medium) 
	{
		if (global.ammo_medium[p] < global.ammo_medium_max) 
		{ 
			global.ammo_medium[p] += myAmmo; 
		} 
		else 
		{
			isAmmoFull = true;
		}
	}
    else if (ammoType == type_heavy) 
	{
		if (global.ammo_heavy[p] < global.ammo_heavy_max) 
		{ 
		global.ammo_heavy[p] += myAmmo; 
		} 
		else {
			isAmmoFull = true;
		}
	}
    
    if (isAmmoFull)
    {        
		//destroy if following player and reaches but already full
		if (isInteractive && instance_exists_fast(magnet_player)) {
			if audio_emitter_exists(other.audio_emitter) audio_play(other.audio_emitter, false, 1, sfx_pickup_weapon);
			instance_destroy();
		}
		else {
			gui_info_show_at(other.id, other.x, other.y, "Interactive_Over", c_white, loc_key("INFO_FULLAMMO"));
	        //guiInfo = instance_create_layer(other.x,other.y,"Interactive",gui_info);
	        //guiInfo.myString = loc_key("INFO_FULLAMMO");
	        //guiInfo.colorMain = c_white;
	        //guiInfo.owner = other;
	        audio_play(other.audio_emitter, false, 1, sfx_pickup_full);			
	        isInteractive = false;
	        alarm[0] = interactionTime;
		}
    }
    else
    {
        if (instance_exists(global.dynamicAmmo1))
        {
            if (p == 1) { global.dynamicAmmo1.timedActive = true; global.dynamicAmmo1.activeTimeCurrent = 0; }
            if (p == 2) { global.dynamicAmmo2.timedActive = true; global.dynamicAmmo2.activeTimeCurrent = 0; }
        }
        
        if audio_emitter_exists(other.audio_emitter) audio_play(other.audio_emitter, false, 1, sfx_pickup_weapon);
        instance_destroy();
    }
}

