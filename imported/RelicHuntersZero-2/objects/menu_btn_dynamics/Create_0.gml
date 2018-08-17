///Button Config

event_inherited();
isAvailable = true;

labelString = loc_key("PERFORMANCE_DYNAMICS");

if (global.max_casings == 2000)
{
    myVariable = 4;
    myValueString = "2000";
}

else if (global.max_casings == 1000)
{
    myVariable = 3;
    myValueString = "1000";
}

else if (global.max_casings == 500)
{
    myVariable = 2;
    myValueString = "500";
}

else if (global.max_casings == 200)
{
    myVariable = 1;
    myValueString = "200";
}

else if (global.max_casings == 0)
{
    myVariable = 0;
    myValueString = "0";
}

else 
{
    myVariable = 1;
    myValueString = "200";
}

myVariableMax = 4;

