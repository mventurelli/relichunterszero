///get_random_gun_mod(failIfAlreadyEquiped)
var type = "gun";
var failIfAlreadyEquiped = argument0;
var toReturn = 0;

var tmpList = ds_list_create();
for (var i = 0; i < ds_list_size(global.steamUGCItemsList); i++) {
	var modData = global.steamUGCItemsDataMap[? global.steamUGCItemsList[| i]];	
	//filter by data
	if (modData[? "type"] != type) continue;	
	//filter if already equiped and should fail
	if (failIfAlreadyEquiped) {
		if (check_weapon_mod_owned(modData[? "id"],1)) continue;
		if (global.playerCount == 2 && check_weapon_mod_owned(modData[? "id"],2)) continue;
	}
	ds_list_add(tmpList, modData[? "id"]);	
}

toReturn = (ds_list_size(tmpList) == 0 ? 0 : tmpList[| irandom(ds_list_size(tmpList)-1)]);

return toReturn;
	