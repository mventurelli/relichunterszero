///Override Text On Relic Found
event_inherited();

if (global.relicDetected) myTextTarget = loc_key("ASS_RELIC");
else if (myTextTarget == loc_key("ASS_RELIC")) {
    myTextTarget = loc_key("ASS_CONGRATS");
    myText = "";
    text_count=0;
}

