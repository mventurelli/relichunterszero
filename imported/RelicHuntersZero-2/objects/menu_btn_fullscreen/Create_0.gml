///Button Config

event_inherited();
isAvailable = true;

labelString = loc_key("PERFORMANCE_FULLSCREEN");

if (global.fullscreen)
{
    myVariable = 1;
    myValueString = loc_key("PERFORMANCE_FULLSCREEN_FULL");
}
else 
{
    myVariable = 0;
    myValueString = loc_key("PERFORMANCE_FULLSCREEN_WINDOW");
}

myVariableMax = 1;

