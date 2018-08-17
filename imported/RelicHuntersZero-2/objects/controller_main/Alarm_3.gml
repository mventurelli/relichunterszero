///Cleans unused emitters every X seconds

while (!ds_list_empty(global.audio_cleaner))
{
    destroy_audio = ds_list_find_value(global.audio_cleaner, ds_list_size(global.audio_cleaner)-1);
    if (destroy_audio) audio_emitter_free(destroy_audio);
    ds_list_delete(global.audio_cleaner, ds_list_size(global.audio_cleaner)-1);
}

alarm[3] = room_speed*3;

