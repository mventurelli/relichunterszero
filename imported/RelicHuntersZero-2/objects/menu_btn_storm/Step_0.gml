///Button Action
event_inherited();

//if (global.unlockEndless) isAvailable = true;
isAvailable = true;

if (executeAction)
{
    global.gameMode = gamemode_storm;
    global.isDaily = false;
    room_goto(room_difficulty);
}

