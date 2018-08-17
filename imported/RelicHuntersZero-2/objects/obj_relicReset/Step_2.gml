///Interaction

event_inherited();

if (activationClient != noone)
{   
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;    
    
    if (wantToActivate) && (in_range)
    {
        wantToActivate = false;
        //Reset Adventure Mode Relic Selection
        global.relic_slot[1] = "";
        global.relic_slot[2] = "";
        global.relic_slot[3] = "";
        
        global.relic_alcoholic_carrot = 0;
        global.relic_yottabyte_drive = 0;
        global.relic_pineapple_pudding = 0;
        global.relic_infinity_battery = 0;
        global.relic_crystal_bacon = 0;
        global.relic_midnight_beer = 0;
        global.relic_watchful_eye = 0;
        global.relic_dev_potion = 0;
        
        sprite_index = spr_resetButton_press;
        image_speed = 0.2;
        image_index = 0;
        
		gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "GUI", c_white, loc_key("TERMINAL_RELIC_INFO"));
        //guiInfo = instance_create_layer(activationClient.x,activationClient.y,"GUI",gui_info);
        //guiInfo.myString = loc_key("TERMINAL_RELIC_INFO");;
        //guiInfo.colorMain = c_white;
        //guiInfo.owner = activationClient;
        audio_play(activationClient.audio_emitter,false,1,sfx_relic_off);
    }
}

