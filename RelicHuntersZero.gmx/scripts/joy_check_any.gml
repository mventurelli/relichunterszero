///joy_check_any(controller index)

var toReturn = false;

for (i=1; i<=18; i++)
{
    if (joy_check(argument0,i)) toReturn = true;
}

return toReturn;
