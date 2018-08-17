///Gunnar Endless Text Initialization

event_inherited();

owner = noone;

if (global.unlockEndless) upgradeTalk = false;
else upgradeTalk = true;

//Audio
audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, 9999, 9999, 1);
audio_emitter_gain(audio_emitter,global.soundVolume);

audio_play(audio_emitter,false,5,sfx_reload_end);

myTextTarget = loc_key("GUNNAR_ENDLESS_UNLOCKED_GREETING");


