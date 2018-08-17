///Main Draw
if (owner != noone)
{
    if (owner.in_range)
    {
        draw_self();
        if (player != noone)
        {   
            if (global.input[player.myPlayerId] == K_INPUT_KEYBOARD) sprite_index = spr_prompt_e;
            else  sprite_index = spr_prompt_x;
    
            if (!haveIPlayedMySound)
            {
                audio_play(player.audio_emitter, false, 1, sfx_pickup_available);
                haveIPlayedMySound = true;
            }
                
            if (allowPickup)
            {
                if (player.pickupTimeCurrent) && (player.pickupTimeCurrent < player.pickupTimeWindow)
                {
                    var barAngle = range_convert(0,player.pickupTimeWindow,0,360,player.pickupTimeCurrent);
                    draw_circlebar(x,y-12,18,4,barAngle,20,circleSurface,c_white,0.8);
                } 
            }
        }
    }  
    else haveIPlayedMySound = false;
}

