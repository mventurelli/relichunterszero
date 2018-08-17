///Play Logo
if (instance_exists(zueiraLogo)) with (zueiraLogo) { image_speed = 0.5; }
audio_play_sound(sfx_zueira,1,false);
if (room == room_start) game_end();

