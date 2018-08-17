///input_key_recycle()

var toReturn = false;

if ( keyboard_check(global.inputRecycle1) || keyboard_check(global.inputRecycle2) || mouse_check_button(global.inputRecycle1) || mouse_check_button(global.inputRecycle2)  )
{
    toReturn = true;
}

return toReturn;
