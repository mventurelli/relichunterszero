///Interaction

if (instance_exists_fast(activationClient) && (active))
{
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;   

    if (wantToActivate) && (in_range)
    { 
        global.level_complete = true;

        if (myLevel != -1)
        {
            global.stage_current = myLevel;
            global.hasUsedCheckpoint = true; //Achievement purposes
        }
        
        if (overrideCurrentLevel)
        {
            global.overrideLevel = overrideLevel;
        }
    }
}
else in_range = false;


///Buy
if (buy = true) && (!active)
{
    if (myLevel == 1) myPrice = global.price_checkpoint1;
    else if (myLevel == 2) myPrice = global.price_checkpoint2;
    else if (myLevel == 3) myPrice = global.price_checkpoint3;
    
    if (instance_exists_fast(activationClient))
    {
        if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;   
        
        if (wantToActivate) && (in_range) 
        { 
            if (global.score_total >= myPrice)
            {
                global.score_total -= myPrice;
                if (myLevel == 1) global.checkpoint1 = 2;
                if (myLevel == 2) global.checkpoint2 = 2;
                if (myLevel == 3) global.checkpoint3 = 2;
                audio_play(class_player.audio_emitter,false,1,sfx_buy);
                
                //Raff Unlock
                if (global.checkpoint1 == 2) && (global.checkpoint2 == 2) && (global.checkpoint3 == 2) && (!global.unlockRaff)
                {
                    global.unlockRaff = true;
                    achievement_give("ACHIEVEMENT_UNLOCKRAFF");
                    announce = instance_create_layer(x,y,"GUI",fx_bigMessage);
                    announce.textBig = loc_key("HUD_UNLOCK_HUNTER");
                    announce.textSmall = loc_key("HUD_UNLOCK_RAFF");
                    announce.hunterUnlockSprite = spr_hud_face_raff;
                }
            }
            else{
				gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "GUI", K_BETU_RED, loc_key("INFO_NOTENOUGHBOUNTY"));
                //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"GUI",gui_info);
                //guiInfo.myString = loc_key("INFO_NOTENOUGHBOUNTY");
                //guiInfo.colorMain = K_BETU_RED;
                //guiInfo.owner = activationClient;
                audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full);
            }
        }
    }
}

///Persistence

if myLevel == 1
{
    if (global.checkpoint1 != 2) active = false;
    else active = true;
    if (global.checkpoint1 == 1) buy = true;
    
}
else if myLevel == 2
{
    if (global.checkpoint2 != 2) active = false;
    else active = true;
    if (global.checkpoint2 == 1) buy = true;
}
else if myLevel == 3
{
    if (global.checkpoint3 != 2) active = false;
    else active = true;
    if (global.checkpoint3 == 1) buy = true;
}

if (active == false) && (buy == false) && (myLevel != -1)
{
    image_blend = c_white;
    image_alpha = 0.42;
}
else
{
    image_blend = c_white;
    image_alpha = 1;
}

if (active) image_index = 0;
else image_index = 1;

