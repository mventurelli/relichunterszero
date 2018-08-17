///Button Action
event_inherited();

if (executeAction)
{
    //global.input[global.pauseClient] = global.pauseInput;
    save_and_clean();
	
	if (room == room_start) {
		show_debug_message("restart");
		room_restart();
	}
	else {
		show_debug_message("go to room start");
		room_goto(room_start);
	}
}

