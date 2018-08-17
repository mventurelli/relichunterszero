///Button Action
event_inherited();

if (executeAction)
{
    //
}

if (myVariable == 2)
{
    global.max_particles = 5;
    myValueString = loc_key("SETTINGS_FULL");
}

if (myVariable == 1)
{
    global.max_particles = 1;
    myValueString = loc_key("SETTINGS_LOW");
}

if (myVariable == 0)
{
    global.max_particles = 0;
    myValueString = loc_key("SETTINGS_OFF");
}


