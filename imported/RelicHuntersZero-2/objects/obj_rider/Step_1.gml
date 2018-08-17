///Character Swap
if global.character[myPlayerId] != char_rider
{
    audio_emitter_free(audio_emitter);
    instance_destroy();
}

