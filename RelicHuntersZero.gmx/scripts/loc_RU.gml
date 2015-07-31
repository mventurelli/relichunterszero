///loc_BR();
//Sets the language as Russian with all the fonts and keys

//Fonts
global.font_menuLarge = ftRU_menuLarge;


//Keys


////////////////////////////////// MENUS AND GAME OPENING //////////////////////////////////////
//Main Menu
ds_map_add(global.loc_map , "MAINMENU_ADVENTURE"    ,   "играть приключения"        );  
ds_map_add(global.loc_map , "MAINMENU_ENDLESS"      ,   "бесконечное"        );
ds_map_add(global.loc_map , "MAINMENU_SETTINGS"      ,   "опции"                );
ds_map_add(global.loc_map , "MAINMENU_CREDITS"      ,   "кредиты"              );
ds_map_add(global.loc_map , "MAINMENU_QUIT"         ,   "выход"                  );

//Settings Menu
//ds_map_add(global.loc_map , "SETTINGS_LANGUAGE"     ,   "Lingua"                  );
