///Button Action
event_inherited();

if (executeAction)
{
    //
}

if (myVariable == 2)
{
    global.auto_aim = K_AUTOAIM_FULL;
    myValueString = loc_key("SETTINGS_FULL");
}

if (myVariable == 1)
{
    global.auto_aim = K_AUTOAIM_ASSIST;
    myValueString = loc_key("GAMEPLAY_TARGETING_ASSIST");
}

if (myVariable == 0)
{
    global.auto_aim = K_AUTOAIM_OFF;
    myValueString = loc_key("SETTINGS_OFF");
}

