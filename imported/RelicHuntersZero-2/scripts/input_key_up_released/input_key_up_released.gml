///input_key_up_released()

var toReturn = false;

if ( keyboard_check_released(global.inputUp1) || keyboard_check_released(global.inputUp2) || mouse_check_button_released(global.inputUp1) || mouse_check_button_released(global.inputUp2)  )
{
    toReturn = true;
}

return toReturn;
