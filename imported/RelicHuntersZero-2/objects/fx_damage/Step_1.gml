///Set Damage, Check for Critical
event_inherited();

if (damage) myString = round(damage);
else myString = loc_key("GENERAL_DODGE");

if (critical)
{
    colorMain = K_BETU_YELLOW;
    colorOutline = c_black;
    myFont = global.font_numberMedium;
}

