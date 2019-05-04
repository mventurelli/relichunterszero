/// @description cleanup, dispatch events

if (audio_emitter > 0) {
	ds_list_add(global.audio_cleaner,audio_emitter);
}

dispatch_event(EVENT_INSTANCE_REMOVED, id);