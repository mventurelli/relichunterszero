///joy_x2pos(index)

var to_return = 0;

if (global.version == os_windows) && (gamepad_get_description(0) == 'Xbox 360 Controller (XInput STANDARD GAMEPAD)')
{
    to_return = xin_get_state(argument0,xb_rightThumbX);
}
else
{
    to_return = gamepad_axis_value(argument0, gp_axisrh);
}
return to_return;
