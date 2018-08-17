///Pick Up

if (instance_exists_fast(activationClient)) && (isInteractiveObjectActive)
{
    player = activationClient;
    p = player.myPlayerId;
    
    if (point_distance(x,y,player.x,player.y) <= range) in_range = true;
    
    if (wantToActivate) && (in_range)
    {
        var want_to_die = false;
        var isAmmoFull = false;
        
        if (sprite_index == spr_pickup_light) if (global.ammo_light[p] < global.ammo_light_max) { global.ammo_light[p] += ammo; want_to_die = true;} else isAmmoFull = true;
        else if (sprite_index == spr_pickup_medium) if (global.ammo_medium[p] < global.ammo_medium_max) { global.ammo_medium[p] += ammo; want_to_die = true;} else isAmmoFull = true;
        else if (sprite_index == spr_pickup_heavy) if (global.ammo_heavy[p] < global.ammo_heavy_max) { global.ammo_heavy[p] += ammo; want_to_die = true;} else isAmmoFull = true;
        
        if (sprite_index == spr_pickup_grenade) 
        {
			if (global.grenades[p] < global.grenades_max) { 
				global.grenades[p] += ammo; 
				want_to_die = true;
			} 
			else isAmmoFull = true;
        }
        
        if (want_to_die)
        {
			var guiInfoString = "";
			var guiInfoColor = c_white;
            if (sprite_index == spr_pickup_light) { guiInfoString = "+ "+ loc_key("GENERAL_LIGHTAMMO"); guiInfoColor = K_BETU_GREEN; }
            else if (sprite_index == spr_pickup_medium)  { guiInfoString = "+ "+ loc_key("GENERAL_MEDIUMAMMO"); guiInfoColor = K_BETU_RED; }
            else if (sprite_index == spr_pickup_heavy) { guiInfoString = "+ "+ loc_key("GENERAL_HEAVYAMMO"); guiInfoColor = K_BETU_BLUE; } 
            else if (sprite_index == spr_pickup_grenade)  { guiInfoString = "+ "+ loc_key("GENERAL_GRENADES"); guiInfoColor = K_BETU_ORANGE; }

			guiInfoColor = c_white;
  
			gui_info_show_at(player.id, player.x, player.y, "Interactive_Over", guiInfoColor, guiInfoString);
            
            audio_play(player.audio_emitter,false,1,sfx_pickup_weapon);
            isInteractiveObjectActive = false;
        }
        
        if (isAmmoFull)
        {
			gui_info_show_at(player.id, player.x, player.y, "Interactive_Over", c_white, loc_key("INFO_FULLAMMO"));
            audio_play(player.audio_emitter, false, 1, sfx_pickup_full);
        }
        
        if (instance_exists(global.dynamicAmmo1)) && (sprite_index != spr_pickup_grenade)
        {
            if (p == 1) { global.dynamicAmmo1.timedActive = true; global.dynamicAmmo1.activeTimeCurrent = 0; }
            else if (p == 2) { global.dynamicAmmo2.timedActive = true; global.dynamicAmmo2.activeTimeCurrent = 0; }
        }
    }
}


//Betu Goze
if (!on_top_of_object)
{
    myObject = collision_point(x,y,obj_wall,false,true);
    if (myObject != noone) on_top_of_object = true; 
}

if (on_top_of_object)
{
    if (!instance_exists_fast(myObject))
    {
        y+=32;
        on_top_of_object = false;
    }
}

///Animation

if (isInteractiveObjectActive)
{
    if (in_range) image_index = 1;
    else image_index = 0;
}
else
{
    if instance_exists(myPrompt)
    {
        with (myPrompt)
        {
            instance_destroy();
        }
    }
    
    image_speed = 0.3;
}

