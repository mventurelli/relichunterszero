///Ass Text Initialization
event_inherited();

//Audio
audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, 9999, 9999, 1);
audio_emitter_gain(audio_emitter,global.soundVolume);

audio_play(audio_emitter,false,5,sfx_ass);


myTextTarget = loc_key("ASS_RANDOM99");

if (room == room_start)
{
    if (!global.tutorial_done) myTextTarget = loc_key("ASS_TUTORIAL");
    else myTextTarget = loc_key("ASS_GREETING");
    
    if (global.first_stage_done) myTextTarget = loc_key("ASS_FIRSTSTAGEDONE");
    if (global.checkpoint1 = 1) myTextTarget = loc_key("ASS_CHECKPOINTREACHED");
    
    if (global.checkpoint1 >= 2) && (global.relic_pineapple_pudding) 
    {
        randomText = irandom(42);
        if (randomText == 0) myTextTarget = loc_key("ASS_RANDOM00");
        if (randomText == 1) myTextTarget = loc_key("ASS_RANDOM01");
        if (randomText == 2) myTextTarget = loc_key("ASS_RANDOM02");
        if (randomText == 3) myTextTarget = loc_key("ASS_RANDOM03");
        if (randomText == 4) myTextTarget = loc_key("ASS_RANDOM04");
        if (randomText == 5) myTextTarget = loc_key("ASS_RANDOM05");
        if (randomText == 6) myTextTarget = loc_key("ASS_RANDOM06");
        if (randomText == 7) myTextTarget = loc_key("ASS_RANDOM07");
        if (randomText == 8) myTextTarget = loc_key("ASS_RANDOM08");
        if (randomText == 9) myTextTarget = loc_key("ASS_RANDOM09");
        if (randomText == 10) myTextTarget = loc_key("ASS_RANDOM10");
        if (randomText == 11) myTextTarget = loc_key("ASS_RANDOM11");
        if (randomText == 12) myTextTarget = loc_key("ASS_RANDOM12");
        if (randomText == 13) myTextTarget = loc_key("ASS_RANDOM13");
        if (randomText == 14) myTextTarget = loc_key("ASS_RANDOM14");
        if (randomText == 15) myTextTarget = loc_key("ASS_RANDOM15");
        if (randomText == 16) myTextTarget = loc_key("ASS_RANDOM16");
        if (randomText == 17) myTextTarget = loc_key("ASS_RANDOM17");
        if (randomText == 18) myTextTarget = loc_key("ASS_RANDOM18");
        if (randomText == 19) myTextTarget = loc_key("ASS_RANDOM19");
        if (randomText == 20) myTextTarget = loc_key("ASS_RANDOM20");
        if (randomText == 21) myTextTarget = loc_key("ASS_RANDOM21");
        if (randomText == 22) myTextTarget = loc_key("ASS_RANDOM22");
        if (randomText == 23) myTextTarget = loc_key("ASS_RANDOM23");
        if (randomText == 24) myTextTarget = loc_key("ASS_RANDOM24");
        if (randomText == 25) myTextTarget = loc_key("ASS_RANDOM25");
        if (randomText == 26) myTextTarget = loc_key("ASS_RANDOM26");
        if (randomText == 27) myTextTarget = loc_key("ASS_RANDOM27");
        if (randomText == 28) myTextTarget = loc_key("ASS_RANDOM28");
        if (randomText == 29) myTextTarget = loc_key("ASS_RANDOM29");
        if (randomText == 30) myTextTarget = loc_key("ASS_RANDOM30");
        if (randomText == 31) myTextTarget = loc_key("ASS_RANDOM31");
        if (randomText == 32) myTextTarget = loc_key("ASS_RANDOM32");
        if (randomText == 33) myTextTarget = loc_key("ASS_RANDOM33");
        if (randomText == 34) myTextTarget = loc_key("ASS_RANDOM34");
        if (randomText == 35) myTextTarget = loc_key("ASS_RANDOM35");
        if (randomText == 36) myTextTarget = loc_key("ASS_RANDOM36");
        if (randomText == 37) myTextTarget = loc_key("ASS_RANDOM37");
        if (randomText == 38) myTextTarget = loc_key("ASS_RANDOM38");
        if (randomText == 39) myTextTarget = loc_key("ASS_RANDOM39");
        if (randomText == 40) myTextTarget = loc_key("ASS_RANDOM40");
        if (randomText == 41) myTextTarget = loc_key("ASS_RANDOM41");
        if (randomText == 42) myTextTarget = loc_key("ASS_RANDOM42");
    }
    
    if (!global.relic_pineapple_pudding) && (global.checkpoint1 = 1) myTextTarget = loc_key("ASS_FIRSTRELIC");
    
}

if (room == room_shop) || (room == room_endShop) 
{
    if (global.shop_visits <= 1) myTextTarget = loc_key("ASS_SHOP1");
    if (global.shop_visits == 2) myTextTarget = loc_key("ASS_SHOP2");
    if (global.shop_visits == 3) myTextTarget = loc_key("ASS_SHOP3");
    if (global.shop_visits >= 4) myTextTarget = loc_key("ASS_SHOP4");
    if (global.shop_visits >= 10) myTextTarget = loc_key("ASS_SHOP5");
    if (global.shop_visits >= 25) myTextTarget = loc_key("ASS_SHOP6");
    
    if (global.character[1] == char_ass) || (global.playerCount > 1 && global.character[2] == char_ass) myTextTarget = loc_key("ASS_SHOP_PLAYER");
}

if (global.gameMode == gamemode_adventure) || (global.currentLoop == 0)
{
    if (room == level1_1) myTextTarget = loc_key("ASS_LEVEL1_1");
    if (room == level1_2) myTextTarget = loc_key("ASS_LEVEL1_2");
    if (room == level1_3) myTextTarget = loc_key("ASS_LEVEL1_3");
    if (room == level2_1) myTextTarget = loc_key("ASS_LEVEL2_1");
    if (room == level2_2) myTextTarget = loc_key("ASS_LEVEL2_2");
    if (room == level2_3) myTextTarget = loc_key("ASS_LEVEL2_3");
    if (room == level3_1) myTextTarget = loc_key("ASS_LEVEL3_1");
    if (room == level3_2) myTextTarget = loc_key("ASS_LEVEL3_2");
    if (room == level3_3) myTextTarget = loc_key("ASS_LEVEL3_3");
    if (room == level4_1) myTextTarget = loc_key("ASS_LEVEL4_1");
    if (room == level4_2) myTextTarget = loc_key("ASS_LEVEL4_2");
    if (room == level4_3) myTextTarget = loc_key("ASS_LEVEL4_3");
    if (room == levelHalloween_1) myTextTarget = loc_key("ASS_SPOOKY1");
    if (room == levelHalloween_2) myTextTarget = loc_key("ASS_SPOOKY2");
    if (room == levelHalloween_3) myTextTarget = loc_key("ASS_SPOOKY3");
}
else if (global.currentLoop == 1)
{
    if (room == level1_1) myTextTarget = loc_key("ASS_LOOP1_GREETING");
    else{
        var randomAss = irandom(6);
        switch (randomAss){
            case 0 : myTextTarget = loc_key("ASS_LOOP1_1"); break;
            case 1 : myTextTarget = loc_key("ASS_LOOP1_2"); break;
            case 2 : myTextTarget = loc_key("ASS_LOOP1_3"); break;
            case 3 : myTextTarget = loc_key("ASS_LOOP1_4"); break;
            case 4 : myTextTarget = loc_key("ASS_LOOP1_5"); break;
            case 5 : myTextTarget = loc_key("ASS_LOOP1_6"); break;
            case 6 : myTextTarget = loc_key("ASS_LOOP1_7"); break;
        }
    }
}
else if (global.currentLoop == 2)
{
    if (room == level1_1) myTextTarget = loc_key("ASS_LOOP2_GREETING");
    else{
        var randomAss = irandom(6);
        switch (randomAss){
            case 0 : myTextTarget = loc_key("ASS_LOOP2_1"); break;
            case 1 : myTextTarget = loc_key("ASS_LOOP2_2"); break;
            case 2 : myTextTarget = loc_key("ASS_LOOP2_3"); break;
            case 3 : myTextTarget = loc_key("ASS_LOOP2_4"); break;
            case 4 : myTextTarget = loc_key("ASS_LOOP2_5"); break;
            case 5 : myTextTarget = loc_key("ASS_LOOP2_6"); break;
            case 6 : myTextTarget = loc_key("ASS_LOOP2_7"); break;
        }
    }
}



