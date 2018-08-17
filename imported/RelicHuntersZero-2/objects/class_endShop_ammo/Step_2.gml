///Check canActivate, inherit and unlock

canActivate = true;
infoString = "";

if (activationClient != noone)
{
    var p = activationClient.myPlayerId;
    
    if (ammoType == type_light) { if (global.ammo_light[p] >= global.ammo_light_max) canActivate = false; }
    else if (ammoType == type_medium) { if (global.ammo_medium[p] >= global.ammo_medium_max) canActivate = false; }
    else if (ammoType == type_heavy) { if (global.ammo_heavy[p] >= global.ammo_heavy_max) canActivate = false; }
    else if (ammoType == type_grenade) { if (global.grenades[p] >= global.grenades_max) canActivate = false; }
    
    if (!canActivate) && (infoString == "") infoString = loc_key("INFO_FULLAMMO");
}

event_inherited();

if (unlock)
{
    if ((activationClient != noone))
    {
        var p = activationClient.myPlayerId;
        if (ammoType == type_light) global.ammo_light[p] += ammo;
        else if (ammoType == type_medium) global.ammo_medium[p] += ammo;
        else if (ammoType == type_heavy) global.ammo_heavy[p] += ammo;
        else if (ammoType == type_grenade) global.grenades[p] += ammo;
        
        audio_play(activationClient.audio_emitter,false,1,sfx_pickup_weapon);
    }
    
    //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
    //guiInfo.owner = activationClient;
	var guiInfoString = "";
	var guiInfoColor = c_white;
    if (sprite_index == spr_pickup_light) { guiInfoString = "+ "+ loc_key("GENERAL_LIGHTAMMO"); guiInfoColor = K_BETU_GREEN; }
    if (sprite_index == spr_pickup_medium)  { guiInfoString = "+ "+ loc_key("GENERAL_MEDIUMAMMO"); guiInfoColor = K_BETU_RED; }
    if (sprite_index == spr_pickup_heavy) { guiInfoString = "+ "+ loc_key("GENERAL_HEAVYAMMO"); guiInfoColor = K_BETU_BLUE; } 
    if (sprite_index == spr_pickup_grenade)  { guiInfoString = "+ "+ loc_key("GENERAL_GRENADES"); guiInfoColor = K_BETU_ORANGE; }
    
	gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", guiInfoColor, guiInfoString);
	
    unlock = false;
    wantToActivate = false;
}





