///angle_rotate(angle, target, speed)
var diff;

diff = angle_cycle(argument1 - argument0, -180, 180);

if (diff < -argument2) return argument0 - argument2;
if (diff > argument2) return argument0 + argument2;

return argument1;

//Found this online by this great Russian gentleman: http://yal.cc/angular-rotations-explained/
