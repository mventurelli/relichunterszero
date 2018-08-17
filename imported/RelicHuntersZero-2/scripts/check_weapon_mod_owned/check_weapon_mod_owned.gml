///check_weapon_mod_owned(modID, playerID);
//Returns true if a specific player has the weapon equipped

var ugcItemId = argument0;
var player = argument1;
var toReturn = false;

if (global.weapon2[player] != noone && 
	global.weapon1_isMod[player] == 1 && 
	global.weapon1_modId[player] == ugcItemId) {
	toReturn = true;
} else if (global.weapon1[player] != noone && 
	global.weapon2_isMod[player] == 1 && 
	global.weapon2_modId[player] == ugcItemId) {
	toReturn = true;
}

return toReturn;
