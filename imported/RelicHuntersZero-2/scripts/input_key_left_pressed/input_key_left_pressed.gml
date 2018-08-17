///input_key_left_pressed()

var toReturn = false;

if ( keyboard_check_pressed(global.inputLeft1) || keyboard_check_pressed(global.inputLeft2) || mouse_check_button_pressed(global.inputLeft1) || mouse_check_button_pressed(global.inputLeft2)  )
{
    toReturn = true;
}

return toReturn;
