///Button Action
event_inherited();

if (executeAction)
{
    //
}

if (myVariable)
{
    global.persistent_toggle = true;
    myValueString = loc_key("SETTINGS_ON");
}
else 
{
    
    global.persistent_toggle = false;
    myValueString = loc_key("SETTINGS_OFF");
}

