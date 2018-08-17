show_debug_message("room start:"+room_get_name(room));

///*
//preload characters test
global.playerBaseInstance = create_character("mods\\_rhz2\\characters\\raff\\config.json", 300, 200);

//preload weapons test
global.weaponBaseInstance = create_weapon("mods\\_rhz2\\weapons\\assault_pistol\\config.json", 300, 200);
//*/

room_goto_next();