///input_key_up_pressed()

var toReturn = false;

if ( keyboard_check_pressed(global.inputUp1) || keyboard_check_pressed(global.inputUp2) || mouse_check_button_pressed(global.inputUp1) || mouse_check_button_pressed(global.inputUp2)  )
{
    toReturn = true;
}

return toReturn;
