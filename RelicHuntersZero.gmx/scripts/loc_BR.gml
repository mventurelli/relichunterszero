///loc_BR();
//Sets the language as Brazilian Portuguese, with all the fonts and keys

//Fonts

global.font_menuLarge = ftBR_menuLarge;


//Keys


////////////////////////////////// MENUS AND GAME OPENING //////////////////////////////////////
//Main Menu
ds_map_add(global.loc_map , "MAINMENU_ADVENTURE"    ,   "JOGAR AVENTURA"        );  
ds_map_add(global.loc_map , "MAINMENU_ENDLESS"      ,   "JOGAR INFINITO"        );
ds_map_add(global.loc_map , "MAINMENU_SETTINGS"      ,   "OPÇÕES"                );
ds_map_add(global.loc_map , "MAINMENU_CREDITS"      ,   "CRÉDITOS"              );
ds_map_add(global.loc_map , "MAINMENU_QUIT"         ,   "SAIR"                  );

//Settings Menu
//ds_map_add(global.loc_map , "SETTINGS_LANGUAGE"     ,   "Lingua"                  );
