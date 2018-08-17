///Buy
event_inherited();

if (activationClient != noone)
{   
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;    
    
    if (wantToActivate) && (in_range)
    {
        if (global.bountyEndless >= price)
        {
            global.bountyEndless -= price;
            unlock = true;
            audio_play(activationClient.audio_emitter,false,1,sfx_buy);
            global.hasPurchasedAnything = true;
        }
        else{
			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", K_BETU_RED, loc_key("INFO_NOTENOUGHBOUNTY"));
			//guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
			//guiInfo.myString = loc_key("INFO_NOTENOUGHBOUNTY");;
			//guiInfo.colorMain = K_BETU_RED;
			//guiInfo.owner = activationClient;
			audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full); 
        }    
    }
}


//Animation
if (in_range) image_index = 1;
else image_index = 0;

