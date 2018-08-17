///input_key_use()

var toReturn = false;

if ( keyboard_check(global.inputUse1) || keyboard_check(global.inputUse2) || mouse_check_button(global.inputUse1) || mouse_check_button(global.inputUse2)  )
{
    toReturn = true;
}

return toReturn;
