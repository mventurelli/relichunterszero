///input_key_fire()

var toReturn = false;

var fireButton1 = global.inputFire1;
var fireButton2 = global.inputFire2;

if (fireButton1 != mb_left) && (fireButton1 != mb_middle) && (fireButton1 != mb_right)
{
    if ( keyboard_check(fireButton1) ) toReturn = true;
}
else
{
    if ( mouse_check_button(fireButton1) ) toReturn = true;
}

if (fireButton2 != mb_left) && (fireButton2 != mb_middle) && (fireButton2 != mb_right)
{
    if ( keyboard_check(fireButton2) ) toReturn = true;
}
else
{
    if ( mouse_check_button(fireButton2) ) toReturn = true;
}


return toReturn;

/*

if ( keyboard_check(global.inputFire1) || keyboard_check(global.inputFire2) || mouse_check_button(global.inputFire1) || mouse_check_button(global.inputFire2)  )
{
    toReturn = true;
}

return toReturn;
