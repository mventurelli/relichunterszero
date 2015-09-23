///joy_ypos(index)
var to_return = -1;

if (global.version == os_windows) && (gamepad_get_description(0) == 'Xbox 360 Controller (XInput STANDARD GAMEPAD)')
{
    to_return = xin_get_state(argument0,xb_leftThumbY);
}
else
{
    to_return = gamepad_axis_value(argument0, gp_axislv);
}
return to_return;
