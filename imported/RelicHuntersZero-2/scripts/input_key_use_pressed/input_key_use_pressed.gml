///input_key_use_pressed()

var toReturn = false;

if ( keyboard_check_pressed(global.inputUse1) || keyboard_check_pressed(global.inputUse2) || mouse_check_button_pressed(global.inputUse1) || mouse_check_button_pressed(global.inputUse2)  )
{
    toReturn = true;
}

return toReturn;
