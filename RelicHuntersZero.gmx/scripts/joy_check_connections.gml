///joy_check_connections()

var gamepadCount = gamepad_get_device_count();

for (var i = 0; i < gamepadCount; i++;)
{
    if (gamepad_is_connected(i)) global.joy[i] = true 
    else global.joy[i] = false;
}
