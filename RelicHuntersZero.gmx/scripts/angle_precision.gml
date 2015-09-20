///angle_precision(x,y,targetX,targetY,currentAngle);
//Find the correct angle to use for Precision Shot comparison
//Requires the global.precisionDistance variable

var myX = argument0;
var myY = argument1;
var tX = argument2;
var tY = argument3;
var angle = argument4;

var toReturn = -1;

var c = global.precisionDistance;
var senC = dsin(180 - angle_difference(point_direction(myX,myY,tX,tY),angle));
var b = point_distance(myX,myY,tX,tY);

var senB = (senC*b)/c;

if (senB <= 1) && (senB >= -1) toReturn = abs(darcsin(senB));
//else show_debug_message('sen of B out of bounds');

//show_debug_message('Input direction was '+string(angle));
//show_debug_message('Precision angle returned '+string(toReturn));
return toReturn;
