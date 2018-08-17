///Button Action
event_inherited();

if (executeAction)
{
    if (!waitForKey)
    {
        waitForKey = true;
        
        labelString = loc_key("MAPPING_PRESSANYKEY");
    }
    
    executeAction = false;
}


