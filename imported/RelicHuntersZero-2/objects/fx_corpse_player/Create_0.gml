///Creation

image_speed = 0.2;

if (global.playerCount < 2) 
{
    global.cutscene = true;
    audio_stop_all();
}

audio_emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_linear_distance);
audio_emitter_falloff(audio_emitter, global.falloffMainDist, global.falloffMainMax, global.falloffMainFactor);
audio_emitter_gain(audio_emitter,global.soundVolume);
audio_emitter_position(audio_emitter, x, y, 0);
audio_play(audio_emitter,false,1,sfx_player_death);

//Stats
global.statTotalDeaths++;
if (room == room_boss) global.statKilledByBoss++;

