///Setup
if (!setup)
{
    if (!coin)
    {
        if (kill_count == 1)
			myString = loc_key("HUD_KILL1");
        else if kill_count == 2
        {
            myString = loc_key("HUD_KILL2");
            value += global.score_doublekill;
            if (global.gameMode == gamemode_adventure) global.score_total += global.score_doublekill;
            else //if (global.gameMode == gamemode_endless) 
            {
                global.bountyEndless += global.score_doublekill;
                global.scoreEndless += global.score_doublekill;
            }
        }
        else if kill_count == 3 
        {
            myString = loc_key("HUD_KILL3");
            value += global.score_triplekill;
            global.score_total += global.score_triplekill;
        }
        else if kill_count > 3 
        {
            if (kill_count == 4) myString = loc_key("HUD_KILL4");
            else if (kill_count == 5) myString = loc_key("HUD_KILL5");
            else if (kill_count == 6) myString = loc_key("HUD_KILL6");
            else if (kill_count == 7) myString = loc_key("HUD_KILL7");
            else if (kill_count == 8) myString = loc_key("HUD_KILL8");
            else if (kill_count == 9) myString = loc_key("HUD_KILL9");
            else if (kill_count >= 10) myString = loc_key("HUD_KILL10");
            
            value += global.score_multikill;
            if (global.gameMode == gamemode_adventure) global.score_total += global.score_multikill;
            else //if (global.gameMode == gamemode_endless) 
            {
                global.bountyEndless += global.score_multikill;
                global.scoreEndless += global.score_multikill;
            }
            //Achievement
            if (kill_count >= 10) 
				achievement_give("ACHIEVEMENT_KILLCOMBO");
        }
    }
    else {
		myString = loc_key("HUD_BOUNTY");
	}
    setup = true;
}

duration_current += delta_time;
if (duration_current >= duration)
{
    global.total_value = 0;
	duration_current = 0;
	value = 0;
	kill_count = 0;
	headshot = false;
	coin = false;	
	setup = false;
	size_current = size_start;
	orientation = 0;
	myString = "";
	showScore = false;	
}
