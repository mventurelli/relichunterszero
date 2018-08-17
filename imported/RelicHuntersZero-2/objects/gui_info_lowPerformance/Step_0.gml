///Keep game paused until input is pressed

if (allowInput) && (display)
{
    if keyboard_check_pressed(vk_anykey) || (mouse_check_button_pressed(mb_left)) display = false;
    
    if (global.input[1] != K_INPUT_KEYBOARD)
    {
        if (joy_check_any(global.input[1])) display = false;
    }
    
    if (global.playerCount == 2)
    {
        if (global.input[2] != K_INPUT_KEYBOARD)  if (joy_check_any(global.input[2])) display = false;
    }
}

if (display)
{
    global.pause = 500000;
}
else 
{
    show_debug_message("ERROR");
    global.pause = 50000;
    instance_destroy();
}

