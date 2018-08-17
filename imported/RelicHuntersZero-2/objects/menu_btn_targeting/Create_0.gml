///Button Config

event_inherited();
isAvailable = true;

labelString = loc_key("GAMEPLAY_TARGETING");

if (global.auto_aim == K_AUTOAIM_FULL)
{
    myVariable = 2;
    myValueString = loc_key("SETTINGS_FULL");
}

if (global.auto_aim == K_AUTOAIM_ASSIST) 
{
    myVariable = 1;
    myValueString = loc_key("GAMEPLAY_TARGETING_ASSIST");
}

if (global.auto_aim == K_AUTOAIM_OFF)
{
    myVariable = 0;
    myValueString = loc_key("SETTINGS_OFF");
}

myVariableMax = 2;

