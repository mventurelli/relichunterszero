///Button Action
event_inherited();

if (executeAction)
{
    //
}

if (myVariable == 2)
{
    global.screenShakeRatio = 1;
    myValueString = loc_key("SETTINGS_FULL");
}

if (myVariable == 1)
{
    global.screenShakeRatio = 0.5;
    myValueString = loc_key("SETTINGS_LOW");
}

if (myVariable == 0)
{
    global.screenShakeRatio = 0;
    myValueString = loc_key("SETTINGS_OFF");
}

