/// @description cleanup

ds_list_destroy(damage_list);
ds_list_destroy(hit_list);
ds_list_add(global.audio_cleaner,audio_emitter);
