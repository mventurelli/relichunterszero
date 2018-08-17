///joy_radial_deadzone(axis X, axis Y, deadzone from 0 to 1);
var toReturn = false;

var vx, vy, deadzone, vector;

vx = argument0;
vy = argument1;
deadzone = argument2;

vector = point_distance(0,0,vx,vy);

if (vector >= deadzone) toReturn = true;

return toReturn;
