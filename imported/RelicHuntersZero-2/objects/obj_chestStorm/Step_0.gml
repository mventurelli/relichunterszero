///Open if you have money

if (!canActivate) {
    if (activateTimeCurrent < activateTime) activateTimeCurrent += delta_time;
    else canActivate = true;
}

// <---------------- Set priceCurrent dynamically?

if (activationClient != noone) && (canActivate)
{
    var displayWarning = false;
    
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;    
    
    if (wantToActivate) && (in_range)
    {
        if (global.bountyEndless >= priceCurrent)
        {
			global.bountyEndless -= priceCurrent;
            unlock = true;
			global.chestsAvailable--;
            audio_play(activationClient.audio_emitter,false,1,sfx_buy);
        }
        else{
            displayWarning = true;
            infoString = loc_key("INFO_NOTENOUGHBOUNTY");
        }
    }
    
    if (displayWarning){
		gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", K_BETU_RED, infoString);
        audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full);
    }
}