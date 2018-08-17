///input_key_melee_pressed()

var toReturn = false;

if ( keyboard_check_pressed(global.inputMelee1) || keyboard_check_pressed(global.inputMelee2) || mouse_check_button_pressed(global.inputMelee1) || mouse_check_button_pressed(global.inputMelee2)  )
{
    toReturn = true;
}

return toReturn;
