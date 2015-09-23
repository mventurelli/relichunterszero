///game_pause();

//Takes screengrab, reset camera zoom, pauses the game
screen_save("pauseScreen.png");
view_wview[0] = 1280;
view_hview[0] = 720;
global.pauseBackground = background_add("pauseScreen.png",0,0);
global.pauseMenu = true;

// Remembers the original input method being used
global.pauseInput = global.input[global.pauseClient];

// Reset button selection
global.selectedButton[K_INPUT_ALL] = -1;
if ds_exists(global.buttonGrid,ds_type_grid) ds_grid_destroy(global.buttonGrid);

//Prepare player info
//Don't let player execute input right after pause
if (instance_exists(class_player)) {
    with (class_player) inputLocked = true;
}

//Find the player with the correct playerID
var char = noone;
for (var i=0; i<instance_number(class_player); i++)
{
    var tryPlayer = instance_find(class_player,i);
    if (tryPlayer) && instance_exists(tryPlayer)    if (tryPlayer.myPlayerId == global.pauseClient) char = tryPlayer;
}



if (instance_exists(char))
{
    //Character Info
    instance_activate_object(global.pausePlayerInfo);
    with (global.pausePlayerInfo) event_perform(ev_create,0);
    global.pausePlayerInfo.myName = char.playerName;
    global.pausePlayerInfo.mySprite = char.sprite_idle;
    global.pausePlayerInfo.myHp = char.hp;
    global.pausePlayerInfo.myHpMax = char.hp_max;
    global.pausePlayerInfo.myShield = char.energy;
    global.pausePlayerInfo.myShieldMax = char.energy_max;
    global.pausePlayerInfo.myStamina = char.stamina;
    global.pausePlayerInfo.myStaminaMax = char.stamina_max;
    
    // Weapon Info
    instance_activate_object(global.pauseWeapon1);
    instance_activate_object(global.pauseWeapon2);
    
    if instance_exists(char.weapon1) global.pauseWeapon1.myWeapon = char.weapon1; else global.pauseWeapon1.myWeapon = noone;
    if instance_exists(char.weapon2) global.pauseWeapon2.myWeapon = char.weapon2; else global.pauseWeapon2.myWeapon = noone;

    with (global.pauseWeapon1) event_perform(ev_step,ev_step_normal);
    with (global.pauseWeapon2) event_perform(ev_step,ev_step_normal);
}

// Activate all menu objects (reactivate the ones in the previous step too)
instance_deactivate_all(true);
instance_activate_object(global.pauseController);
instance_activate_object(global.pauseFX);
instance_activate_object(global.pauseButtonContinue);
instance_activate_object(global.pauseButtonBackToShip);
instance_activate_object(global.pauseButtonBackToMenu);
instance_activate_object(global.pauseButtonExit);
instance_activate_object(global.pauseWeapon1);
instance_activate_object(global.pauseWeapon2);
instance_activate_object(global.pausePlayerInfo);

//Dynamic GUIs
instance_activate_object(global.dynamicBounty);
instance_activate_object(global.dynamicRelic1);
instance_activate_object(global.dynamicRelic2);
instance_activate_object(global.dynamicRelic3);

// Menu button manager
instance_activate_object(global.pauseMenuButtonController);
    
//Initialize instances
with(global.pauseController) event_perform(ev_create,0);
with (global.pauseFX) event_perform(ev_create,0);
with (global.pauseButtonContinue) event_perform(ev_create,0);
with (global.pauseButtonBackToShip) event_perform(ev_create,0);
with (global.pauseButtonBackToMenu) event_perform(ev_create,0);
with (global.pauseButtonExit) event_perform(ev_create,0);

with (global.pauseMenuButtonController) event_perform(ev_create,0);
if (global.pauseInput != K_INPUT_KEYBOARD) global.mouseActive = false;

//Hide tiles and stop the music
tile_layer_hide(-9999);
tile_layer_hide(-99999);
tile_layer_hide(-999999); //Too lazy to fix this on the rooms :p
audio_group_set_gain(ag_music, 0, room_speed*0.4);
audio_play_sound(sfx_menu_pause,1,false);
