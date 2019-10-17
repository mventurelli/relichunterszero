///Button Action
event_inherited();

if (executeAction)
{
	global.masterDifficulty = K_DIFFICULTY_MASTER_HARD;
    save_all();
    room_goto(room_charSelection);
}

