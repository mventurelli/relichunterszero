///input_key_down_released()

var toReturn = false;

if ( keyboard_check_released(global.inputDown1) || keyboard_check_released(global.inputDown2) || mouse_check_button_released(global.inputDown1) || mouse_check_button_released(global.inputDown2)  )
{
    toReturn = true;
}

return toReturn;
