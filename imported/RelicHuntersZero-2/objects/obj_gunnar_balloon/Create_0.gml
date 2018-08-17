///Gunnar Text Initialization

event_inherited();

upgradeTalk = false;

//Audio
audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, 9999, 9999, 1);
audio_emitter_gain(audio_emitter,global.soundVolume);

audio_play(audio_emitter,false,5,sfx_reload_end);

myTextTarget = "I AM ERROR";

if (global.stage_current == 1) && (!global.currentLoop) {
    myTextTarget = loc_key("GUNNAR_GREETING");
}
else{
    var randomText = irandom(4);
    
    switch (randomText){
        case 0 : myTextTarget = loc_key("GUNNAR_RANDOM1"); break;
        case 1 : myTextTarget = loc_key("GUNNAR_RANDOM2"); break;
        case 2 : myTextTarget = loc_key("GUNNAR_RANDOM3"); break;
        case 3 : myTextTarget = loc_key("GUNNAR_RANDOM4"); break;
        case 4 : myTextTarget = loc_key("GUNNAR_RANDOM5"); break;
    }
}

