///Buy
if (activationClient != noone) && (!unlock)
{
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;   

    if (wantToActivate) && (in_range)
    { 
        if (global.score_total >= price)
        {
            global.score_total -= price;
            unlock = true;
            audio_play(activationClient.audio_emitter,false,1,sfx_buy);
            
            announce = instance_create_layer(x,y,"GUI",fx_bigMessage);
            announce.textBig = loc_key("HUD_UNLOCK_RELIC_PIECE");
            announce.textSmall = loc_key("HUD_UNLOCK_RELIC_ALLPIECES");
            announce.relicSprite1 = relicSprite1;
            announce.relicSprite1Draw = relicSprite1Draw;
            announce.relicSprite2 = relicSprite2;
            announce.relicSprite2Draw = relicSprite2Draw;
            announce.relicSprite3 = relicSprite3;
            announce.relicSprite3Draw = relicSprite3Draw;
        }
        else{
			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", K_BETU_RED, loc_key("INFO_NOTENOUGHBOUNTY"));
            //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
            //guiInfo.myString = loc_key("INFO_NOTENOUGHBOUNTY");
            //guiInfo.colorMain = K_BETU_RED;
            //guiInfo.owner = activationClient;
            audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full);
        }
    }
}

if (in_range) image_index = 1;
else image_index = 0;

