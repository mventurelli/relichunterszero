///Button Action
event_inherited();

if (executeAction)
{
    //
}

if (myVariable)
{
    global.allowKillFreeze = true;
    myValueString = loc_key("SETTINGS_ON");
}
else 
{
    
    global.allowKillFreeze = false;
    myValueString = loc_key("SETTINGS_OFF");
}

