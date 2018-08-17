///Override Text On Upgrade
event_inherited();

if (upgradeTalk)
{
    upgradeTalk = false;
    
    var randomTalk = irandom(4);
    switch (randomTalk){
        case 0 : myTextTarget = loc_key("GUNNAR_UPGRADED1"); break;
        case 1 : myTextTarget = loc_key("GUNNAR_UPGRADED2"); break;
        case 2 : myTextTarget = loc_key("GUNNAR_UPGRADED3"); break;
        case 3 : myTextTarget = loc_key("GUNNAR_UPGRADED4"); break;
        case 4 : myTextTarget = loc_key("GUNNAR_UPGRADED5"); break;
    }
    
    myText = "";
    text_count=0;
}

