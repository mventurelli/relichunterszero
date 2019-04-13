///joy_rumble(index,left,right)

var rumbleL = argument1*global.joy_rumbleIntensity;
var rumbleR = argument2*global.joy_rumbleIntensity;

global.joy_rumbleLeft[argument0] += rumbleL;
global.joy_rumbleRight[argument0] += rumbleR;
