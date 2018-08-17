///input_key_down_pressed()

var toReturn = false;

if ( keyboard_check_pressed(global.inputDown1) || keyboard_check_pressed(global.inputDown2) || mouse_check_button_pressed(global.inputDown1) || mouse_check_button_pressed(global.inputDown2)  )
{
    toReturn = true;
}

return toReturn;
