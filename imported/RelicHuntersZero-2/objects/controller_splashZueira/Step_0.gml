///Transition to Next Room
if (keyboard_check_pressed(vk_anykey)) || (mouse_check_button_pressed(mb_left))
{
    goToNextRoom = true;
}

if (gamepad_is_connected(K_INPUT_JOYSTICK1))
{
    if (joy_check(K_INPUT_JOYSTICK1,1)) goToNextRoom = true;
}

if (gamepad_is_connected(K_INPUT_JOYSTICK2))
{
    if (joy_check(K_INPUT_JOYSTICK2,1)) goToNextRoom = true;
}

if (goToNextRoom) {
    audio_stop_all();
    if (instance_exists(splash_fx_zueira)) with (splash_fx_zueira) instance_destroy();
    room_goto_next();
}

