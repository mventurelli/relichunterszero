///Interaction

event_inherited();

if (activationClient != noone)
{   
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;    
    
    if (wantToActivate) && (in_range) && (instance_exists(class_slot_tiered)) && (instance_exists(data_shopEndless))
    {
        if (global.bountyEndless >= price)
        {
            wantToActivate = false;
            global.bountyEndless -= price;
            global.hasPurchasedAnything = true;
            sprite_index = spr_resetButton_press;
            image_speed = 0.2;
            image_index = 0;
                
            //Reset slots
            global.endTierSlot1 = 1;
            global.endTierSlot2 = 1;
            global.endTierSlot3 = 1;
            global.endTierItem1 = noone;
            global.endTierItem2 = noone;
            global.endTierItem3 = noone;
            with (class_slot_tiered){
                if (instance_exists(spawnedItem)) with(spawnedItem) instance_destroy();
                tier = 1;
            }
                
			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", c_white, loc_key("TERMINAL_RESET_INFO"));
            audio_play(activationClient.audio_emitter,false,1,sfx_buy);
    }
        else{
			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", K_BETU_RED, loc_key("INFO_NOTENOUGHBOUNTY"));
            audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full); 
        }    
    }
}

