///Conditional Detonation
event_inherited();
{
    var targetPlayer = instance_nearest(x,y,class_player);
    if (targetPlayer != noone){
        targetPlayer.superShield = true;
        targetPlayer.superShieldTime = 6000000;//room_speed*6;
        audio_play(targetPlayer.audio_emitter,false,9,sfx_shield_regen_start);
        
		gui_info_show_at(targetPlayer.id, targetPlayer.x, targetPlayer.y, "Interactive_Over", K_BETU_ORANGE, loc_key("INFO_SUPERSHIELD"));
		//guiInfo = instance_create_layer(targetPlayer.x,targetPlayer.y,"Interactive",gui_info);
        //guiInfo.colorMain = K_BETU_ORANGE;
        //guiInfo.myString = loc_key("INFO_SUPERSHIELD");
        //guiInfo.owner = targetPlayer;
    }
    instance_destroy();
}

