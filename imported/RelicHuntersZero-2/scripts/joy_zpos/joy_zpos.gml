///joy_zpos(index)
var to_return = -1;
/*
if (global.version == os_windows) && (gamepad_get_description(0) == "Xbox 360 Controller (XInput STANDARD GAMEPAD)")
{
    to_return = xin_get_state(argument0,xb_leftTrigger);
}
else*/
{
    to_return = gamepad_button_check(argument0, gp_shoulderlb); //gamepad_axis_value(argument0, gp_shoulderlb);
	show_debug_message("Im reading the left trigger and it says "+string(to_return));
}

return to_return;
