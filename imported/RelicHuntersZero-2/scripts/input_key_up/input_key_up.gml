///input_key_up()

var toReturn = false;

if ( keyboard_check(global.inputUp1) || keyboard_check(global.inputUp2) || mouse_check_button(global.inputUp1) || mouse_check_button(global.inputUp2)  )
{
    toReturn = true;
}

return toReturn;
