///Price + Buy
event_inherited();

if (!global.unlockEndless){
    if (global.relic_morning_star) ||
    (global.relic_pineapple_pie) ||
    (global.relic_rabbit_foot) ||
    (global.relic_midnight_meal) ||
    (global.relic_yottabyte_processor) ||
    (global.relic_alcoholic_carrot) ||
    (global.relic_yottabyte_drive) ||
    (global.relic_pineapple_pudding) ||
    (global.relic_infinity_battery) ||
    (global.relic_crystal_bacon) ||
    (global.relic_midnight_beer) ||
    (global.relic_watchful_eye) ||
    (global.relic_dev_potion) {
        allowBuy = true;
    }
}
else {
    unlock = true;
    allowBuy = false;
}

if (instance_exists_fast(activationClient) && (allowBuy))
{
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) && (price) in_range = true;    
  
    if (wantToActivate) && (in_range)
    {
        if (global.score_total >= price)
        {
            global.score_total -= price;
            global.unlockEndless = true;
            wantToActivate = false;
                    
            announce = instance_create_layer(x,y,"GUI",fx_bigMessage);
            announce.textBig = loc_key("HUD_UNLOCK_ENDLESS");
            announce.textSmall = loc_key("HUD_UNLOCK_ENDLESS_DESC");
                    
            audio_play(activationClient.audio_emitter,false,1,sfx_buy);
                        
            unlock = true;
            myBalloon.upgradeTalk = true;
        }
        else{
			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "GUI", K_BETU_RED, loc_key("INFO_NOTENOUGHBOUNTY"));
            //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"GUI",gui_info);
            //guiInfo.myString = loc_key("INFO_NOTENOUGHBOUNTY");;
            //guiInfo.colorMain = K_BETU_RED;
            //guiInfo.owner = activationClient;
            audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full); 
        }    
    }
}

///Talk when player is nearby

if instance_exists(class_player)
{
    var distToPlayer = point_distance(x,y-8,class_player.x,class_player.y);
    
    if (distToPlayer <= 280) && (!instance_exists(obj_endless_balloon))
    {
        myBalloon = instance_create_layer(x,y,"GUI",obj_endless_balloon);
		owner_add_owned_instance(myBalloon);
        if (!image_xscale) myBalloon.x -= 50;        
    }
}

