///input_key_reload_pressed()

var toReturn = false;

if ( keyboard_check_pressed(global.inputReload1) || keyboard_check_pressed(global.inputReload2) || mouse_check_button_pressed(global.inputReload1) || mouse_check_button_pressed(global.inputReload2)  )
{
    toReturn = true;
}

return toReturn;
