///Button Config

event_inherited();
isAvailable = true;

labelString = loc_key("GAMEPLAY_VIBRATION");

if (global.vibrationRatio >= 0.7)
{
    myVariable = 2;
    myValueString = loc_key("SETTINGS_FULL");
}

if (global.vibrationRatio > 0) && (global.vibrationRatio < 0.7)
{
    myVariable = 1;
    myValueString = loc_key("SETTINGS_LOW");
}

if (global.vibrationRatio <= 0)
{
    myVariable = 0;
    myValueString = loc_key("SETTINGS_OFF");
}

myVariableMax = 2;

