///Button Action
event_inherited();

//Testing Character Selection
if (executeAction)
{
    global.gameMode = gamemode_adventure;
    global.isDaily = false;
    room_goto(room_difficulty);
}

