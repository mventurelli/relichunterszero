/// @description cleanup, dispatch events
event_inherited();

if (audio_emitter > 0) {
	ds_list_add(global.audio_cleaner,audio_emitter);
}