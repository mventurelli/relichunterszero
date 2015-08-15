///game_unpause();

audio_play_sound(sfx_menu_unpause,1,false);

//Deletes screengrab, unpauses the game
if background_exists(global.pauseBackground) background_delete(global.pauseBackground);
global.pauseMenu = false;

//Restore original input method
//global.input[1] = global.pauseInput;

//Activate all instances, shut down Pause Menu objects
instance_activate_all();

instance_deactivate_object(global.pauseMenuButtonController);
instance_deactivate_object(global.pauseController);
instance_deactivate_object(global.pauseFX);
instance_deactivate_object(global.pauseButtonContinue);
instance_deactivate_object(global.pauseButtonBackToShip);
instance_deactivate_object(global.pauseButtonBackToMenu);
instance_deactivate_object(global.pauseButtonExit);
instance_deactivate_object(global.pauseWeapon1);
instance_deactivate_object(global.pauseWeapon2);
instance_deactivate_object(global.pausePlayerInfo);

//Return all tile layers and music volume
tile_layer_show(-9999);
tile_layer_show(-99999);
tile_layer_show(-999999);

volume_update();
