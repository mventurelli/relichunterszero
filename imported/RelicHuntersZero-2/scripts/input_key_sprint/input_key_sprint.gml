///input_key_sprint()

var toReturn = false;

if ( keyboard_check(global.inputSprint1) || keyboard_check(global.inputSprint2) || mouse_check_button(global.inputSprint1) || mouse_check_button(global.inputSprint2)  )
{
    toReturn = true;
}

return toReturn;
