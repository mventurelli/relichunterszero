///Owner joystick check (for vibration)
if (owner != noone) 
{
	if (global.input[owner.myPlayerId] != K_INPUT_KEYBOARD)
	{
	    hasJoy = true;
	    joy = global.input[owner.myPlayerId];
	}
}