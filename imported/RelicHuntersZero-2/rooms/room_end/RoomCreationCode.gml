show_debug_message(room_get_name(room));

controller = instance_create_layer(0,0,"Controllers",controller_end);

fade = instance_create_layer(x,y,"Fade",fx_fadeFromBlack);
with(fade) {
	durationInSeconds = 2;
}
