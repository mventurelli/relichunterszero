///Button Action
event_inherited();

if (executeAction)
{
	global.masterDifficulty = K_DIFFICULTY_MASTER_BEGINNER;
    save_all();
    room_goto(room_charSelection);
}

