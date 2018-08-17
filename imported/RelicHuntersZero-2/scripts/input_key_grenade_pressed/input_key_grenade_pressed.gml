///input_key_grenade_pressed()

var toReturn = false;

if ( keyboard_check_pressed(global.inputGrenade1) || keyboard_check_pressed(global.inputGrenade2) || mouse_check_button_pressed(global.inputGrenade1) || mouse_check_button_pressed(global.inputGrenade2)  )
{
    toReturn = true;
}

return toReturn;
