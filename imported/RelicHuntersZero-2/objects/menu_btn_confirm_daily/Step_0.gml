///Button Action
event_inherited();

if (isAvailable)
{
    if (global.selectedButton[K_INPUT_KEYBOARD] == id)  { global.input[1] = K_INPUT_KEYBOARD; show_debug_message("Setting player input to KEYBOARD");}
    if (global.selectedButton[K_INPUT_JOYSTICK1] == id) { global.input[1] = K_INPUT_JOYSTICK1; show_debug_message("Setting player input to JOY1");}
    if (global.selectedButton[K_INPUT_JOYSTICK2] == id) { global.input[1] = K_INPUT_JOYSTICK2; show_debug_message("Setting player input to JOY2");}
        
    if (executeAction)
    {
        global.isDaily = true;
        global.gameMode = gamemode_endless;
        global.dailySeed = current_day+current_month+current_year;
        random_set_seed(global.dailySeed);
       
        var randomList = ds_list_create();
        ds_list_add(randomList,char_jimmy);
        ds_list_add(randomList,char_pinky);
        ds_list_add(randomList,char_raff);
        ds_list_add(randomList,char_punny);
        ds_list_add(randomList,char_rider);
        ds_list_add(randomList,char_ass);
        
        var randomPick = irandom_range(0,ds_list_size(randomList)-1);
        global.character[1] = ds_list_find_value(randomList, randomPick);
        global.character[2] = noone;
        ds_list_destroy(randomList);
    
        if (global.mouseActive)  { global.input[1] = K_INPUT_KEYBOARD; show_debug_message("Setting player input to KEYBOARD");}
        else { global.input[1] = K_INPUT_JOYSTICK1; show_debug_message("Setting player input to JOY1");}
        
        ini_open(working_directory + "\\saveData.ini");
        
        ini_write_real("Input","Input1",global.input[1]);
        ini_write_real("Character","Character1",global.character[1]);
        ini_write_real("Character","Character2",global.character[2]);
        ini_write_real("Temp","isDaily",true);
        ini_close();
        
         //start daily
         //instance_create_layer(x,y,"Interactive",controller_main); // This runs the "Create" event of the controller_main before going into level1_1. No time to go by the required Globals and refactoring the code right now =(
         room_goto(level1_1);
         executeAction=false;
    }
}
else{
    if (!instance_exists(controller_steamAsync)) {
		instance_create_layer(x,y,"Controllers",controller_steamAsync);
	}
}

