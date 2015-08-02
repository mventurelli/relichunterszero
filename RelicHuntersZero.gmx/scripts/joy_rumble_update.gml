///joy_rumble_update(index);

if (global.joy_rumbleLeft[argument0] > 1) global.joy_rumbleLeft[argument0] = 1;
if (global.joy_rumbleRight[argument0] > 1) global.joy_rumbleRight[argument0] = 1;


//if (global.input = 'joystick') && (global.vibrationRatio)
if (global.vibrationRatio)
{
    if (global.version == os_windows) && (gamepad_get_description(0) == 'Xbox 360 Controller (XInput STANDARD GAMEPAD)')
    {
        xin_set_rumble(argument0,global.joy_rumbleLeft[argument0]*global.vibrationRatio,global.joy_rumbleRight[argument0]*global.vibrationRatio);
    }
    else
    {
        gamepad_set_vibration(argument0, global.joy_rumbleLeft[argument0]*global.vibrationRatio, global.joy_rumbleRight[argument0]*global.vibrationRatio);
    }
}


if (global.joy_rumbleLeft[argument0] > 0) global.joy_rumbleLeft[argument0] -= global.joy_rumbleRecoverSpeed;
if (global.joy_rumbleRight[argument0] > 0) global.joy_rumbleRight[argument0] -= global.joy_rumbleRecoverSpeed;

if (global.joy_rumbleLeft[argument0] < 0) global.joy_rumbleLeft[argument0] = 0;
if (global.joy_rumbleRight[argument0] < 0) global.joy_rumbleRight[argument0] = 0;
