///input_key_switch_pressed()

var toReturn = false;

if ( keyboard_check_pressed(global.inputSwitch1) || keyboard_check_pressed(global.inputSwitch2) || mouse_check_button_pressed(global.inputSwitch1) || mouse_check_button_pressed(global.inputSwitch2)  )
{
    toReturn = true;
}

return toReturn;
