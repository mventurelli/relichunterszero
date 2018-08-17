///Button Config

event_inherited();
isAvailable = true;

labelString = loc_key("PERFORMANCE_SHADOWS");

if (global.shadows_toggle)
{
    myVariable = 1;
    myValueString = loc_key("SETTINGS_ON");
}
else 
{
    myVariable = 0;
    myValueString = loc_key("SETTINGS_OFF");
}

myVariableMax = 1;

