///Button Config

event_inherited();
isAvailable = true;

labelString = loc_key("PERFORMANCE_RESOLUTION");

if (global.screenResolution == 1.5)
{
    myVariable = 3;
    myValueString = "1920";
}

if (global.screenResolution == 1.25)
{
    myVariable = 2;
    myValueString = "1600";
}

if (global.screenResolution == 1.0)
{
    myVariable = 1;
    myValueString = "1280";
}

if (global.screenResolution == 0.625)
{
    myVariable = 0;
    myValueString = "800";
}

myVariableMax = 3;

