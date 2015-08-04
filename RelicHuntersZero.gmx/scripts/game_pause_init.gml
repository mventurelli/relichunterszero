///game_pause_init
//Initializes the variables and objects used by game_pause() and game_unpause(). Wrote to be used by controller_main.

//Main Variables
global.pauseClient = 1;
global.pauseBackground = -1;
global.pauseMenu = false;
global.selectedButton[K_INPUT_ALL] = -1;
global.pauseInput = global.input[global.pauseClient];

//Create all Pause Menu objects
global.pauseFX = instance_create(0,0,menu_fx_pause);
global.pauseButtonContinue = instance_create(0,0,pausemenu_btn_continue);
global.pauseButtonBackToShip = instance_create(0,0,pausemenu_btn_ship);
global.pauseButtonBackToMenu = instance_create(0,0,pausemenu_btn_menu);
global.pauseButtonExit = instance_create(0,0,pausemenu_btn_exit);

global.pausePlayerInfo = instance_create(0,0,gui_playerInfo);
global.pauseWeapon1 = instance_create(0,0,gui_weaponInfo);
global.pauseWeapon2 = instance_create(0,0,gui_weaponInfo);

global.pauseController = instance_create(0,0,controller_pause);
global.pauseMenuButtonController = instance_create(0,0,controller_menuButtons);

//All Pause Menu objects must start the game deactivated
instance_deactivate_object(global.pauseFX);
instance_deactivate_object(global.pauseButtonContinue);
instance_deactivate_object(global.pauseButtonBackToShip);
instance_deactivate_object(global.pauseButtonBackToMenu);
instance_deactivate_object(global.pauseButtonExit);

instance_deactivate_object(global.pausePlayerInfo);
instance_deactivate_object(global.pauseWeapon1);
instance_deactivate_object(global.pauseWeapon2);

instance_deactivate_object(global.pauseController);
instance_deactivate_object(global.pauseMenuButtonController);
