///input_key_right_pressed()

var toReturn = false;

if ( keyboard_check_pressed(global.inputRight1) || keyboard_check_pressed(global.inputRight2) || mouse_check_button_pressed(global.inputRight1) || mouse_check_button_pressed(global.inputRight2)  )
{
    toReturn = true;
}

return toReturn;
