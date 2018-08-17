///Button Config

event_inherited();
isAvailable = true;

labelString = loc_key("PERFORMANCE_PERSISTENT");

if (global.persistent_toggle)
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

