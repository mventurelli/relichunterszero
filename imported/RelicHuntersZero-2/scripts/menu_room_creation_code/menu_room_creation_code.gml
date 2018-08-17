show_debug_message(room_get_name(room));

controller = instance_create_layer(0,0,"Controllers",controller_menu_main);
buttonController = instance_create_layer(0,0,"Controllers",controller_menuButtons);
steamUGCController = instance_create_layer(100,100,"Controllers",controller_steamUGC);

//buttonController.allowDynamicInputSwitch = true;
goToNextRoom = false;

//Background
if (!instance_exists(controller_menu_background)) {
	backgroundController = instance_create_layer(0,0,"BackgroundOverlay", controller_menu_background);
}
with (backgroundController) {
	backgroundX = 0;
	backgroundY = 0;
	backgroundSpeed = 0.5;
}

fade = instance_create_layer(x,y,"Fade",fx_fadeFromBlack);
with(fade) {
	durationInSeconds = 1;
}
