///Override Text On Upgrade
event_inherited();

if (upgradeTalk)
{
    upgradeTalk = false;
    
    var randomTalk = irandom(4);
    switch (randomTalk){
        case 0 : myTextTarget = loc_key("SAE_UPGRADED1"); break;
        case 1 : myTextTarget = loc_key("SAE_UPGRADED2"); break;
        case 2 : myTextTarget = loc_key("SAE_UPGRADED3"); break;
        case 3 : myTextTarget = loc_key("SAE_UPGRADED4"); break;
        case 4 : myTextTarget = loc_key("SAE_UPGRADED5"); break;
    }
    
    myText = "";
    text_count=0;
}

