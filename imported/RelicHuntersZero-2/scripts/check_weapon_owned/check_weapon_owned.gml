///check_weapon_owned(object,playerID);
//Returns true if a specific player has the weapon equipped

var weapon = argument0;
var p = argument1;
var toReturn = false;

if (global.weapon1[p] == weapon) toReturn = true;
else if (global.weapon2[p] == weapon) toReturn = true;

return toReturn;
