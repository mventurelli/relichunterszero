///joy_init();

global.joy[0] = false;
global.joy[1] = false;
global.joy[2] = false;
global.joy[3] = false;
global.joy[4] = false;

global.joy_rumbleLeft[0] = 0;
global.joy_rumbleRight[0] = 0;
global.joy_rumbleLeft[1] = 0;
global.joy_rumbleRight[1] = 0;
global.joy_rumbleLeft[2] = 0;
global.joy_rumbleRight[2] = 0;
global.joy_rumbleLeft[3] = 0;
global.joy_rumbleRight[3] = 0;
global.joy_rumbleLeft[4] = 0;
global.joy_rumbleRight[4] = 0;

global.joy_rumbleRecoverSpeed = 0.09; //Was 0.045

if gamepad_is_connected(0) gamepad_set_axis_deadzone(0, 0);
if gamepad_is_connected(1) gamepad_set_axis_deadzone(1, 0);
if gamepad_is_connected(2) gamepad_set_axis_deadzone(2, 0);
if gamepad_is_connected(3) gamepad_set_axis_deadzone(3, 0);
if gamepad_is_connected(4) gamepad_set_axis_deadzone(4, 0);
