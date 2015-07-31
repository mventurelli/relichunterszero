///loc_JP();
//Sets the language as Japanese with all the fonts and keys

//Fonts
global.font_menuLarge = ftJP_menuLarge;


//Keys


////////////////////////////////// MENUS AND GAME OPENING //////////////////////////////////////
//Main Menu
ds_map_add(global.loc_map , "MAINMENU_ADVENTURE"    ,   "冒険を再生"        );  
ds_map_add(global.loc_map , "MAINMENU_ENDLESS"      ,   "エンドレス"        );
ds_map_add(global.loc_map , "MAINMENU_SETTINGS"      ,   "オプション"                );
ds_map_add(global.loc_map , "MAINMENU_CREDITS"      ,   "クレジット"              );
ds_map_add(global.loc_map , "MAINMENU_QUIT"         ,   "やめます"                  );

//Settings Menu
//ds_map_add(global.loc_map , "SETTINGS_LANGUAGE"     ,   "Lingua"                  );
