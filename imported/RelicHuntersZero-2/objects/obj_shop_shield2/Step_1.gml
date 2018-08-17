///Unlock and Draw Weapon

price = global.price_shield2;
weaponName = loc_key("GENERAL_SHOP_OVERSHIELD");

if (unlock)
{
    global.unlock_shield2 = 1;
    pack = instance_create_layer(x,y,"GUI",obj_pickup_shield);
    pack.want_to_die = false;
        
    //Pickup
    if (activationClient) && (activationClient != noone)
    {
        if (activationClient.overshield < activationClient.energy_max)
        {
            activationClient.overshield += min(pack.overshield, (activationClient.energy_max - activationClient.overshield));
            activationClient.energy_regen_time_current = activationClient.energy_regen_time-1;
            
            audio_play(activationClient.audio_emitter,false,1,sfx_pickup_health);
                
			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", K_BETU_BLUE, loc_key("INFO_SHIELDPLUS"));
            //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"Interactive_Over",gui_info);
            //guiInfo.colorMain = K_BETU_BLUE;
            //guiInfo.myString = loc_key("INFO_SHIELDPLUS");
            //guiInfo.owner = activationClient;
            
            pack.want_to_die = true;
        }

        if (pack.want_to_die) with (pack) { instance_destroy(); }
    }
    instance_destroy();
}
else event_inherited();

