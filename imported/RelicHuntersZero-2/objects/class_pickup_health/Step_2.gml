///Pick Up

if (instance_exists_fast(activationClient))
{
    if (point_distance(x,y,activationClient.x,activationClient.y) <= range) in_range = true;

    if (wantToActivate) && (in_range)
    {
        if (activationClient.hp < activationClient.hp_max)
        {
            activationClient.hp += hp;
            
            audio_play(activationClient.audio_emitter,false,1,sfx_pickup_health);

			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", c_white, loc_key("INFO_HEALTHPLUS"));
            instance_destroy();
        }
        else
        {
			gui_info_show_at(activationClient.id, activationClient.x, activationClient.y, "Interactive_Over", c_black, loc_key("INFO_HEALTHFULL"));
            audio_play(activationClient.audio_emitter, false, 1, sfx_pickup_full);
        }
    }
}

//Detects whether it is on top of a box
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


