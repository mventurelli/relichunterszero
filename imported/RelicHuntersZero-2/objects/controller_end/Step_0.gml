///Take Screenshot
//steam_screenshot_check();

///Transition to Next Room

if (allowInput)
{
    //show_debug_message("ALLOWINPUT IS TRUE AND I STILL DIDNT CRASH");
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
    
    if (goToNextRoom) room_goto(room_splash);
    //show_debug_message("FINISHED ALLOWINPUT");
}



