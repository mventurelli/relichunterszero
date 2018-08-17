if (!variable_global_exists("steamUGCChecked")) {
	global.steamUGCChecked = false;
}

//fileFound = "false";
if (!global.steamUGCChecked) {

	global.hasModType = ds_map_create();	
	global.steamUGCItemsList = ds_list_create();
	global.steamUGCItemsDataMap = ds_map_create();
	global.steamUGCChecked = steam_ugc_get_subscribed_items(global.steamUGCItemsList);

	//init mod types
	ds_map_add(global.hasModType, "gun", false);
	
	//preload each item config
	if (global.steamUGCChecked) {
		show_debug_message("steamUGCChecked");
		for (var i = 0; i < ds_list_size(global.steamUGCItemsList); i += 1)
		{
			var value = ds_list_find_value(global.steamUGCItemsList, i);
			show_debug_message(value);	
			var item_map = ds_map_create();
			var itemInfoLoaded = steam_ugc_get_item_install_info(value, item_map);
			if (itemInfoLoaded) {
				show_debug_message("itemInfoLoaded");	
				folder = string(item_map[? "folder"]);	
				show_debug_message("folder: " + folder);	
				
				//move items to sandbox location on linux
				if (os_type == os_linux) {
					configFolder = string(value);
					if (!directory_exists(working_directory + configFolder)) {
						//directory_create(configFolder);
						directory_copy_fmns(folder,  working_directory + configFolder); 
					}

					configFilename = "config.json";
					fullPath = working_directory + configFolder + "//" + configFilename;

				}
				else {			
					configFolder = string_replace_all(folder, "\\", "\\\\");
					configFilename = "config.json";
					fullPath = configFolder + "\\" + configFilename;
				}

				if file_exists(fullPath)
				{
					var num = 0;
					file = file_text_open_read(fullPath);
					jsonStr = "";
					while (!file_text_eoln(file)) {
						jsonStr = jsonStr + file_text_readln(file);
					}
					file_text_close(file);
					//fileFound = jsonStr;
						
					// check load data into vars
					//if invlaid mod data, remove the item
					configDataMap = json_decode(jsonStr);
					if (configDataMap == -1) {
						show_debug_message("Invalid mod data "+jsonStr);
						ds_list_delete(global.steamUGCItemsList, i);
						i--;
						continue;
					}
					
					//check if spritesheet is included
					var spritesheetFilename = "spritesheet.png";
					if (os_type == os_linux) {
						var sprite_filename = working_directory + configFolder + "//" + spritesheetFilename;
					}
					else {
						var sprite_filename = configFolder + "\\" + spritesheetFilename;
					}						
					if (!file_exists(sprite_filename)) {
						show_debug_message("Missing mod spritesheet "+spritesheetFilename);
						ds_list_delete(global.steamUGCItemsList, i);
						i--;
						continue;
					}
					
					// todo: create a global for each type of mod
					// eg: gunsList, charactersList
					// so you can tell how many of each type exists, for endless shop and chests
					if (configDataMap != -1) {					
						//add folder and id to data
						ds_map_add(configDataMap, "folder", configFolder);
						ds_map_add(configDataMap, "id", value);						
						ds_map_add(global.steamUGCItemsDataMap, value, configDataMap);
						ds_map_replace(global.hasModType, configDataMap[? "type"], true);
						//show_debug_message(global.steamUGCItemsListFolder[| i]);
					}
				}
			} else {
				show_debug_message("itemInfoLoaded false");
				ds_list_delete(global.steamUGCItemsList, i);
				i--;
				continue;
			}
			//steam_details = steam_ugc_request_item_details(value, 60);
		}
		show_debug_message("steamUGCLoaded true");
		
		//testing ugc data map
		//var a = global.steamUGCItemsDataMap[? 1114107893];
		//show_debug_message(a[? "name"]);
		//show_debug_message(a[? "folder"]);
		//show_debug_message(a[? "id"]);		
	} else {
		show_debug_message("steamUGCChecked false");

	}
}
