///Button Config

event_inherited();
isAvailable = true;

labelString = loc_key("GAMEPLAY_SCREENSHAKE");

if (global.screenShakeRatio >= 0.7)
{
    myVariable = 2;
    myValueString = loc_key("SETTINGS_FULL");
}

if (global.screenShakeRatio > 0) && (global.screenShakeRatio < 0.7)
{
    myVariable = 1;
    myValueString = loc_key("SETTINGS_LOW");
}

if (global.screenShakeRatio <= 0)
{
    myVariable = 0;
    myValueString = loc_key("SETTINGS_OFF");
}

myVariableMax = 2;

