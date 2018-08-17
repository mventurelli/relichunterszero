///input_key_fire_pressed()
var toReturn = false;

var fireButton1 = global.inputFire1;
var fireButton2 = global.inputFire2;

if (fireButton1 != mb_left) && (fireButton1 != mb_middle) && (fireButton1 != mb_right)
{
    if ( keyboard_check_pressed(fireButton1) ) toReturn = true;
}
else
{
    if ( mouse_check_button_pressed(fireButton1) ) toReturn = true;
}

if (fireButton2 != mb_left) && (fireButton2 != mb_middle) && (fireButton2 != mb_right)
{
    if ( keyboard_check_pressed(fireButton2) ) toReturn = true;
}
else
{
    if ( mouse_check_button_pressed(fireButton2) ) toReturn = true;
}


return toReturn;


/*
var toReturn = false;

if ( keyboard_check_pressed(global.inputFire1) || keyboard_check_pressed(global.inputFire2) || mouse_check_button_pressed(global.inputFire1) || mouse_check_button_pressed(global.inputFire2)  )
{
    toReturn = true;
}

return toReturn;
