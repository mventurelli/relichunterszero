///Override Text on Upgrade Talk
if (upgradeTalk)
{
    if (instance_exists(owner))
    {
        upgradeTalk = false;
        myText = "";
        text_count=0;
        
        if (!owner.allowBuy) myTextTarget = loc_key("GUNNAR_ENDLESS_GREETING");
        else if (!owner.unlock) myTextTarget = loc_key("GUNNAR_ENDLESS_UNLOCK");
        
        if (owner.unlock) myTextTarget = loc_key("GUNNAR_ENDLESS_UNLOCKED");
    }
}

