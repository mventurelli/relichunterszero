///Pick Up

if (instance_exists_fast(activationClient))
{
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;

    if (wantToActivate) && (in_range)
    {
        if (global.character[activationClient.myPlayerId] != char_biu) //Biu can't pick up Overshield
        {
            if (activationClient.overshield < activationClient.energy_max)
            {
                activationClient.overshield += min(overshield, (activationClient.energy_max - activationClient.overshield));
                activationClient.energy_regen_time_current = activationClient.energy_regen_time-1;
                
                audio_play(activationClient.audio_emitter,false,1,sfx_pickup_health);
                
				gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", K_BETU_BLUE, loc_key("INFO_SHIELDPLUS"));
                instance_destroy();
            }
            else{
				gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", c_black, loc_key("INFO_SHIELDMAX"));
                audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full);
            }
        }
        else{
			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", K_BETU_RED, loc_key("INFO_CANTUSESHIELD"));
            audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full);
        }
    }
}

//Check whether it is on top of a box
if (!on_top_of_object)
{
    myObject = collision_point(x,y,obj_wall,false,true);
    if (myObject != noone) on_top_of_object = true; 
}

if (on_top_of_object)
{
    if (!instance_exists_fast(myObject))
    {
        y+=32;
        on_top_of_object = false;
    }
}

///Animation
if (in_range) image_index = 1;
else image_index = 0;


