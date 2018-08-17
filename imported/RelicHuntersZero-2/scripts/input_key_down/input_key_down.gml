///input_key_down()

var toReturn = false;

if ( keyboard_check(global.inputDown1) || keyboard_check(global.inputDown2) || mouse_check_button(global.inputDown1) || mouse_check_button(global.inputDown2)  )
{
    toReturn = true;
}

return toReturn;
