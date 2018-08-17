///input_key_right_released(playerId)

var toReturn = false;

if ( keyboard_check_released(global.inputRight1) || keyboard_check_released(global.inputRight2) || mouse_check_button_released(global.inputRight1) || mouse_check_button_released(global.inputRight2)  )
{
    toReturn = true;
}

return toReturn;
