///Check canActivate, inherit and unlock

canActivate = true;
infoString = "";

if (activationClient != noone) && (isInteractiveObjectActive)
{
    if (activationClient.hp >= activationClient.hp_max)
    {
        canActivate = false;
        infoString = loc_key("INFO_HEALTHFULL");
    }
}

event_inherited();

if (unlock)
{
    if ((activationClient != noone))
    {
        activationClient.hp += hp;
        audio_play(activationClient.audio_emitter,false,1,sfx_pickup_health);
    }
    
	gui_info_show_at(other.id, other.x, other.y, "Interactive_Over", c_white, loc_key("INFO_HEALTHPLUS"));
    //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
    //guiInfo.colorMain = c_white;
    //guiInfo.myString = loc_key("INFO_HEALTHPLUS");
    //guiInfo.owner = activationClient;
    
    unlock = false;
    wantToActivate = false;
}





///Sync price tier
global.endPriceTier_health = priceTier;

