///Character Swap
if global.character[myPlayerId] != char_biu
{
    audio_emitter_free(audio_emitter);
    instance_destroy();
}

///Heal on Level End
if (instance_exists(controller_main)){
    if (controller_main.level_end) && (!receivedLevelEndHealing){
        hp += min(hp_max*0.2, hp_max-hp);
                
        audio_play(audio_emitter,false,1,sfx_pickup_health);
                
		gui_info_show_at(id, x, y, "Interactive_Over", c_white, loc_key("INFO_HEALTHPLUS"));
        //guiInfo = instance_create_layer(x,y,"Interactive",gui_info);
        //guiInfo.colorMain = c_white;
        //guiInfo.myString = loc_key("INFO_HEALTHPLUS");
        //guiInfo.owner = id;
		        
        receivedLevelEndHealing = true;
    }
}

