///Trigger & Start the Game
event_inherited();

if (isActive) && (owner.slotInput != K_INPUT_KEYBOARD) if joy_check_pressed(owner.slotInput,1) trigger = true;

if (trigger)
{
    if (!audio_is_playing(sfx_menu_click)) audio_play_sound(sfx_menu_click,9,false);    

    global.character[1] = -1;
    global.character[2] = -1;
    
    if (instance_exists(menu_char_card1))
    {
        if (menu_char_card1.slotInput != -1) && (menu_char_card1.slotCharacter != -1)
        {
            global.input[1] = menu_char_card1.slotInput;
            global.character[1] = menu_char_card1.slotCharacter;
            global.playerCount = 1;
        }
    }
    
    if (instance_exists(menu_char_card2))
    {
        if (menu_char_card2.slotInput != -1) && (menu_char_card2.slotCharacter != -1)
        {
            global.input[2] = menu_char_card2.slotInput;
            global.character[2] = menu_char_card2.slotCharacter;
            global.playerCount = 2;
        }
    } 
    
    //Check random
    if (global.character[1] == char_random) || (global.character[2] == char_random)
    {
        var randomList = ds_list_create();
        if (global.character[1] != char_jimmy) && (global.character[2] != char_jimmy) ds_list_add(randomList,char_jimmy);
        if (global.unlockPinky) && (global.character[1] != char_pinky) && (global.character[2] != char_pinky) ds_list_add(randomList,char_pinky);
        if (global.unlockRaff) && (global.character[1] != char_raff) && (global.character[2] != char_raff) ds_list_add(randomList,char_raff);
        if (global.unlockBiu) && (global.character[1] != char_biu) && (global.character[2] != char_biu) ds_list_add(randomList,char_biu);
        if (global.unlockPunny) && (global.character[1] != char_punny) && (global.character[2] != char_punny) ds_list_add(randomList,char_punny);
        if (global.unlockAss) && (global.character[1] != char_ass) && (global.character[2] != char_ass) ds_list_add(randomList,char_ass);
        //if (global.unlockRider) && (global.character[1] != char_rider) && (global.character[2] != char_rider) ds_list_add(randomList,char_rider);
        
        if (global.character[1] == char_random)
        {
            var randomPick = irandom_range(0,ds_list_size(randomList)-1);
            global.character[1] = ds_list_find_value(randomList, randomPick);
            ds_list_delete(randomList, randomPick);
        }
        
        if (global.character[2] == char_random) global.character[2] = ds_list_find_value(randomList, irandom_range(0,ds_list_size(randomList)-1));
        
        ds_list_destroy(randomList);
    }

    
    //Reset everything, save and start the game
    global.isDaily = false;
    
    global.selectionLocked[K_INPUT_ALL] = false;
    global.selectionLocked[K_INPUT_KEYBOARD] = false;
    global.selectionLocked[K_INPUT_JOYSTICK1] = false;
    global.selectionLocked[K_INPUT_JOYSTICK2] = false;
    
    ini_open(working_directory + "\\saveData.ini");
    
    ini_write_real("Character","playerCount",global.playerCount);
    ini_write_real("Input","Input1",global.input[1]);
    ini_write_real("Character","Character1",global.character[1]);
    
    if (global.playerCount > 1)
    {
        ini_write_real("Input","Input2",global.input[2]);
        ini_write_real("Character","Character2",global.character[2]);
    }
    else{
        global.character[2] = noone;
        ini_write_real("Character","Character2",global.character[2]);
    }
    
    ini_close();
    
    
    if (global.gameMode == gamemode_adventure) room_goto(room_start);
    else if (global.gameMode == gamemode_endless) 
    {
        room_goto(level1_1);
        exit;
    }
	else if (global.gameMode == gamemode_storm)
	{
		room_goto(level_storm_1);	
		exit;
	}
    trigger = false;
}

