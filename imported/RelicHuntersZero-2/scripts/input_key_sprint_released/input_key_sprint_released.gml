///input_key_sprint_released()

var toReturn = false;

if ( keyboard_check_released(global.inputSprint1) || keyboard_check_released(global.inputSprint2) || mouse_check_button_released(global.inputSprint1) || mouse_check_button_released(global.inputSprint2)  )
{
    toReturn = true;
}

return toReturn;
