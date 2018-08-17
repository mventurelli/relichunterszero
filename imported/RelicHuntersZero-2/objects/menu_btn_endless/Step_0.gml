///Button Action
event_inherited();

if (global.unlockEndless) isAvailable = true;

if (executeAction)
{
    global.gameMode = gamemode_endless;
    global.isDaily = false;
    room_goto(room_charSelection);
}

