show_debug_message(room_get_name(room));

fade = instance_create_layer(x,y,"Fade",fx_fadeFromBlack);
with(fade) {
	durationInSeconds = 0.5;
}
