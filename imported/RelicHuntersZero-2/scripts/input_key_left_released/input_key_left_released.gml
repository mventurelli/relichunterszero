///input_key_left_released()

var toReturn = false;

if ( keyboard_check_released(global.inputLeft1) || keyboard_check_released(global.inputLeft2) || mouse_check_button_released(global.inputLeft1) || mouse_check_button_released(global.inputLeft2)  )
{
    toReturn = true;
}

return toReturn;
