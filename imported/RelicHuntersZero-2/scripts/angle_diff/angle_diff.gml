///angle_diff(angle1,angle2);
//Returns the abs differece in degrees between two angles

var a1 = argument0;
var a2 = argument1;

var toReturn = abs(a1-a2);

if (toReturn > 180) toReturn -= 180;

return toReturn;
