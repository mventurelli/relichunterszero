///Button Config

event_inherited();
isAvailable = true;

labelString = loc_key("PERFORMANCE_PARTICLES");

if (global.max_particles == 5)
{
    myVariable = 2;
    myValueString = loc_key("SETTINGS_FULL");
}

if (global.max_particles == 1)
{
    myVariable = 1;
    myValueString = loc_key("SETTINGS_LOW");
}

if (global.max_particles == 0)
{
    myVariable = 0;
    myValueString = loc_key("SETTINGS_OFF");
}

myVariableMax = 2;


