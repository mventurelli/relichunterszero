///Pickup Override

if (vertical_speed_start < interactive_speed) && (instance_exists(other))
{
    global.scrapEndless += scrapValue;  
	if (global.gameMode == gamemode_storm) global.scrapEndless += scrapValue;  
    global.dynamicBounty.timedActive = true;
    if audio_emitter_exists(other.audio_emitter) audio_play(other.audio_emitter, false, 1, eatSfx1, eatSfx2, eatSfx3);
    
    //steam_set_stat_int("STAT_TOTAL_CANDIES", steam_get_stat_int("STAT_TOTAL_CANDIES") + 1  ); 
    //if (steam_get_stat_int("STAT_TOTAL_CANDIES") >= 50) achievement_give("ACHIEVEMENT_EAT_CANDY");
    
    instance_destroy();
}

