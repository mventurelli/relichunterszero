///input_key_use_released()

var toReturn = false;

if ( keyboard_check_released(global.inputUse1) || keyboard_check_released(global.inputUse2) || mouse_check_button_released(global.inputUse1) || mouse_check_button_released(global.inputUse2)  )
{
    toReturn = true;
}

return toReturn;
