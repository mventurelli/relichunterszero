///volume_update()
//Updates the Master and Music volume of the game

audio_master_gain(global.masterVolume);
audio_group_set_gain(ag_music, global.musicVolume, 0);
