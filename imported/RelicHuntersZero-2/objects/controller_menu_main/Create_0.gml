show_debug_message("controller_menu_main->create");
///Init
//if (room == room_menu) draw_texture_flush();
/*
buttonController = instance_create_layer(0,0,"Instances",controller_menuButtons);

//buttonController.allowDynamicInputSwitch = true;
goToNextRoom = false;

//Background
if (!instance_exists(controller_menu_background)) {
	backgroundController = instance_create_layer(0,0,"BackgroundOverlayLayer", controller_menu_background);
}
with (backgroundController) {
	backgroundX = 0;
	backgroundY = 0;
	backgroundSpeed = 0.5;
}
*/

// Save File Read
save_sync_read();

// Debug Shit, don't mess with this
if (os_type == os_macosx) global.version = os_macosx;
else if (os_type == os_linux) global.version = os_linux;
else global.version = os_windows;

joy_init();

//Soundtrack stuff
if (room == room_menu)
{
    if !audio_is_playing(bgm_menu)
    {
        audio_stop_all();
        audio_play_sound(bgm_menu,99,true);
    }
}

volume_update();


///////////////////////////////////////////////////////////////
//Special Youtuber Stuff YOUTUBE DELETE LATER PLEASE TODO TO DO
///////////////////////////////////////////////////////////////
/*
global.unlockEndless = true;
global.unlockPinky = true;
global.unlockRaff =  true;
global.unlockBiu =  true;
global.unlockPunny = true;
global.unlockAss =  true;

///////////////////////////////////////////////////////////////

/* */
/*  */
