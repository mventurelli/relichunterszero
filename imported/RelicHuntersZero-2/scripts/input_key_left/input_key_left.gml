///input_key_left()

var toReturn = false;

if ( keyboard_check(global.inputLeft1) || keyboard_check(global.inputLeft2) || mouse_check_button(global.inputLeft1) || mouse_check_button(global.inputLeft2)  )
{
    toReturn = true;
}

return toReturn;
