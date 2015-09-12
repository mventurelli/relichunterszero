///input_key_aim()
var toReturn = false;

var aimButton1 = global.inputAim1;
var aimButton2 = global.inputAim2;


if (aimButton1 == mb_left) || (aimButton1 == mb_middle) || (aimButton1 == mb_right)
{
    if ( mouse_check_button_pressed(aimButton1) ) toReturn = true;
}
else
{
    if ( keyboard_check_pressed(aimButton1) ) toReturn = true;
}

if (aimButton2 == mb_left) || (aimButton2 == mb_middle) || (aimButton2 == mb_right)
{
    if ( mouse_check_button_pressed(aimButton2) ) toReturn = true;
}
else
{
    if ( keyboard_check_pressed(aimButton2) ) toReturn = true;
}

return toReturn;




/*
var toReturn = false;

if ( keyboard_check(global.inputAim1) || keyboard_check(global.inputAim2) || mouse_check_button(global.inputAim1) || mouse_check_button(global.inputAim2)  )
{
    toReturn = true;
}

return toReturn;