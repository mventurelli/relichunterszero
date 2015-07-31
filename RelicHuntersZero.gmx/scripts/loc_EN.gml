///loc_EN();
//Sets the language as English, with all the fonts and keys

//Fonts

//you can override a global.font here if needed

//Keys

/*

////////////////////////////////// MENUS AND GAME OPENING //////////////////////////////////////
//Main Menu
ds_map_add(global.loc_map , "MAINMENU_ADVENTURE"    ,   "Play Adventure"        );  
ds_map_add(global.loc_map , "MAINMENU_ENDLESS"      ,   "Play Endless"        );
ds_map_add(global.loc_map , "MAINMENU_SETTINGS"      ,   "Settings"        );
ds_map_add(global.loc_map , "MAINMENU_CREDITS"      ,   "Credits"        );
ds_map_add(global.loc_map , "MAINMENU_QUIT"         ,   "Exit"                  );
ds_map_add(global.loc_map , "MAINMENU_CANCEL"         ,   "Cancel"                  );
ds_map_add(global.loc_map , "MAINMENU_CONFIRM"         ,   "Confirm"                  );

//Settings Menu
ds_map_add(global.loc_map , "SETTINGS_FXGAMEPLAY"     ,   "GAMEPLAY OPTIONS"                  );
ds_map_add(global.loc_map , "SETTINGS_FXPERFORMANCE"  ,   "VIDEO OPTIONS"                  );
ds_map_add(global.loc_map , "SETTINGS_FXMAPPING"         ,   "KEY MAPPING"                  );
ds_map_add(global.loc_map , "SETTINGS_DELETESAVE"           ,   "DELETE SAVED GAME"                  );
ds_map_add(global.loc_map , "SETTINGS_DELETESAVE_CONFIRM"   ,   "YES! DELETE!"                    );
ds_map_add(global.loc_map , "SETTINGS_DELETESAVE_TEXT"   ,   "CONFIRM YOU REALLY WANT TO DELETE ALL OF YOUR SAVED DATA"                    );
ds_map_add(global.loc_map , "SETTINGS_PERFORMANCE"      ,   "VIDEO OPTIONS"                  );
ds_map_add(global.loc_map , "SETTINGS_GAMEPLAY"         ,   "GAMEPLAY OPTIONS"                  );
ds_map_add(global.loc_map , "SETTINGS_MAPPING"         ,   "KEYBOARD MAPPING"                  );
ds_map_add(global.loc_map , "SETTINGS_LANGUAGE"     ,   "Language"                  );
ds_map_add(global.loc_map , "SETTINGS_MASTER"         ,   "MASTER VOLUME"                  );
ds_map_add(global.loc_map , "SETTINGS_SOUND"         ,   "FX VOLUME"                  );
ds_map_add(global.loc_map , "SETTINGS_MUSIC"         ,   "MUSIC VOLUME"                  );

ds_map_add(global.loc_map , "SETTINGS_ON"         ,   "ON"                  );
ds_map_add(global.loc_map , "SETTINGS_OFF"         ,   "OFF"                  );
ds_map_add(global.loc_map , "SETTINGS_FULL"         ,   "FULL"                  );
ds_map_add(global.loc_map , "SETTINGS_LOW"         ,   "LOW"                  );

//Gameplay Options Menu
ds_map_add(global.loc_map , "GAMEPLAY_DOUBLETAP"         ,   "DOUBLE TAP TO DASH"                  );
ds_map_add(global.loc_map , "GAMEPLAY_MWHEEL"         ,   "MOUSE WHEEL TO SWITCH WEAPONS"                  );
ds_map_add(global.loc_map , "GAMEPLAY_SCREENSHAKE"         ,   "SCREEN SHAKE AMOUNT"                  );
ds_map_add(global.loc_map , "GAMEPLAY_VIBRATION"         ,   "CONTROLLER VIBRATION"                  );
ds_map_add(global.loc_map , "GAMEPLAY_TARGETING"         ,   "CONTROLLER AUTO-AIM"                  );
ds_map_add(global.loc_map , "GAMEPLAY_TARGETING_ASSIST"         ,   "ASSIST"                  );
ds_map_add(global.loc_map , "GAMEPLAY_STICKY"         ,   "CONTROLLER STICKY AIM"                  );

//Performance Options Menu
ds_map_add(global.loc_map , "PERFORMANCE_RESOLUTION"         ,   "RESOLUTION"                  );
ds_map_add(global.loc_map , "PERFORMANCE_FULLSCREEN"         ,   "WINDOW MODE"                  );
ds_map_add(global.loc_map , "PERFORMANCE_FULLSCREEN_FULL"         ,   "FULL"                  );
ds_map_add(global.loc_map , "PERFORMANCE_FULLSCREEN_WINDOW"         ,   "WINDOW"                  );
ds_map_add(global.loc_map , "PERFORMANCE_DYNAMICS"         ,   "MAX DYNAMIC OBJECTS"                  );
ds_map_add(global.loc_map , "PERFORMANCE_PARTICLES"         ,   "PARTICLE EFFECTS"                  );
ds_map_add(global.loc_map , "PERFORMANCE_SHADOWS"         ,   "DYNAMIC SHADOWS"                  );
ds_map_add(global.loc_map , "PERFORMANCE_PERSISTENT"         ,   "PERSISTENT OBJECTS"                  );
ds_map_add(global.loc_map , "PERFORMANCE_REFLECTIONS"         ,   "REFLECTIONS"                  );

//Key Mapping Menu
ds_map_add(global.loc_map , "MAPPING_DEFAULT"         ,   "RESET TO DEFAULT"                  );
ds_map_add(global.loc_map , "MAPPING_MOVEUP"         ,   "Move Up"                  );
ds_map_add(global.loc_map , "MAPPING_MOVEDOWN"         ,   "Move Down"                  );
ds_map_add(global.loc_map , "MAPPING_MOVERIGHT"         ,   "Move Right"                  );
ds_map_add(global.loc_map , "MAPPING_MOVELEFT"         ,   "Move Left"                  );
ds_map_add(global.loc_map , "MAPPING_FIRE"         ,   "Fire"                  );
ds_map_add(global.loc_map , "MAPPING_AIM"         ,   "Aim"                  );
ds_map_add(global.loc_map , "MAPPING_GRENADE"         ,   "Grenade"                  );
ds_map_add(global.loc_map , "MAPPING_MELEE"         ,   "Melee"                  );
ds_map_add(global.loc_map , "MAPPING_SPRINT"         ,   "Sprint/Dash"                  );
ds_map_add(global.loc_map , "MAPPING_USE"         ,   "Use"                  );
ds_map_add(global.loc_map , "MAPPING_SWITCH"         ,   "Switch Weapon"                  );
ds_map_add(global.loc_map , "MAPPING_RELOAD"         ,   "Reload"                  );
ds_map_add(global.loc_map , "MAPPING_SPRINTTOGGLE"         ,   "Sprint Toggle"                  );

//Pause Menu
ds_map_add(global.loc_map , "PAUSE_FXPAUSE"     ,   "GAME PAUSED"                  );
ds_map_add(global.loc_map , "PAUSE_CONTINUE"     ,   "CONTINUE"                  );
ds_map_add(global.loc_map , "PAUSE_SHIP"     ,   "BACK TO SHIP"                  );
ds_map_add(global.loc_map , "PAUSE_MENU"     ,   "MAIN MENU"                  );
ds_map_add(global.loc_map , "PAUSE_EXIT"     ,   "EXIT"                  );

//Player Feedback Messages (gui_info)
ds_map_add(global.loc_map , "INFO_LOWSTAMINA"     ,   "Low Stamina"                  );
ds_map_add(global.loc_map , "INFO_OUTOFGRENADES"     ,   "Out of Grenades"                  );
ds_map_add(global.loc_map , "INFO_CANTUSEGRENADES"     ,   "Can't Use Grenades"                  );
ds_map_add(global.loc_map , "INFO_RELOADING"     ,   "Reloading"                  );
ds_map_add(global.loc_map , "INFO_OUTOFAMMO"     ,   "No Ammo"                  );
ds_map_add(global.loc_map , "INFO_FULLAMMO"     ,   "Ammo Is Full"                  );
ds_map_add(global.loc_map , "INFO_HEALTHPLUS"     ,   "+ Health"                  );
ds_map_add(global.loc_map , "INFO_HEALTHFULL"     ,   "Health Is Full"                  );

//Weapon Names
//


//Weapon Info
ds_map_add(global.loc_map , "WEAPON_DAMAGE"     ,   "DAMAGE"                  );
ds_map_add(global.loc_map , "WEAPON_RANGE"     ,   "RANGE"                  );
ds_map_add(global.loc_map , "WEAPON_CAPACITY"     ,   "CAPACITY"                  );
ds_map_add(global.loc_map , "WEAPON_AMMOTYPE"     ,   "AMMO TYPE"                  );
ds_map_add(global.loc_map , "WEAPON_AMMOCOST"     ,   "AMMO COST"                  );
ds_map_add(global.loc_map , "WEAPON_IMPACT"     ,   "IMPACT"                  );
ds_map_add(global.loc_map , "WEAPON_RATE"     ,   "RATE"                  );
ds_map_add(global.loc_map , "WEAPON_RELOAD"     ,   "RELOAD"                  );
ds_map_add(global.loc_map , "WEAPON_BURST"     ,   "BURST"                  );
ds_map_add(global.loc_map , "WEAPON_PIERCING"     ,   "PIERCING"                  );

//Game Stuff
ds_map_add(global.loc_map , "GENERAL_HP"     ,      "HP"                       );
ds_map_add(global.loc_map , "GENERAL_SHIELD"     ,   "SHIELD"                  );
ds_map_add(global.loc_map , "GENERAL_STAMINA"     ,   "STAMINA"                  );
ds_map_add(global.loc_map , "GENERAL_LIGHTAMMO"     ,   "LIGHT AMMO"                  );
ds_map_add(global.loc_map , "GENERAL_MEDIUMAMMO"     ,   "MEDIUM AMMO"                  );
ds_map_add(global.loc_map , "GENERAL_HEAVYAMMO"     ,   "HEAVY AMMO"                  );
ds_map_add(global.loc_map , "GENERAL_GRENADES"     ,   "GRENADES"                  );


