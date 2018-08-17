///input_key_sprint_pressed()

var toReturn = false;

if ( keyboard_check_pressed(global.inputSprint1) || keyboard_check_pressed(global.inputSprint2) || mouse_check_button_pressed(global.inputSprint1) || mouse_check_button_pressed(global.inputSprint2)  )
{
    toReturn = true;
}

return toReturn;
