///Buy

priceCurrent = priceArray [ min(priceTier,9) ];

if (activationClient != noone)
{
    var displayWarning = false;
    
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;    
    
    if (wantToActivate) && (in_range)
    {
        if (global.bountyEndless >= priceCurrent)
        {
            if (canActivate)
            {
                global.bountyEndless -= priceCurrent;
                unlock = true;
                audio_play(activationClient.audio_emitter,false,1,sfx_buy);
                priceTier++;
                global.hasPurchasedAnything = true;
            }
            else displayWarning = true;
        }
        else{
            displayWarning = true;
            infoString = loc_key("INFO_NOTENOUGHBOUNTY");
        }
    }
    
    if (displayWarning){
		gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", K_BETU_RED, infoString);
        //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
        //guiInfo.myString = infoString;
        //guiInfo.colorMain = K_BETU_RED;
        //guiInfo.owner = activationClient;
        audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full);
    }
}

//Animation
if (in_range) image_index = 1;
else image_index = 0;

