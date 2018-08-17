///joy_radial_deadzone(axis X, axis Y, deadzone from 0 to 1);
var to_return = -1;

var vx,vy,vector;

vx = (-argument0);
vy = (argument1);

vector = abs(sqr( vx*vx + vy*vy ));


if (vector > argument2) to_return = vector;

return to_return;
