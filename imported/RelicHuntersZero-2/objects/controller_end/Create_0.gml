///Main Shit
show_debug_message("I INSTANTIATED WITHOUT CRASHING");

joy_init();
goToNextRoom = false;
allowInput = false;


//Timeline
alarm[0] = room_speed*1; //spawns scrolling text
alarm[3] = room_speed*4; // Allow the player to skip
alarm[1] = room_speed*53; //fade to black
alarm[2] = room_speed*57; //go back to start of the game


if (room == room_end)
{
    audio_stop_all();
    audio_play_sound(bgm_victory,99,true);
}

volume_update();

show_debug_message("FINISHED CREATE WITHOUT CRASHING");

