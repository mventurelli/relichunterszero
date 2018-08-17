///input_key_right()

var toReturn = false;

if ( keyboard_check(global.inputRight1) || keyboard_check(global.inputRight2) || mouse_check_button(global.inputRight1) || mouse_check_button(global.inputRight2)  )
{
    toReturn = true;
}

return toReturn;
