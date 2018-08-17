///Draw
if (drawSelf)
{
    ///Alpha Animation
    if (hideForPlayer) targetAlpha = 0.2;
    else targetAlpha = 1;
    
    if (myAlpha != targetAlpha)
    {
        if (targetAlpha > myAlpha) alphaOrientation = 1;
        else alphaOrientation = -1;
        
        myAlpha += alphaOrientation * min(alphaSpeed, abs(targetAlpha-myAlpha));
    }
     
    //Draw Self
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,myAlpha);
    
    if (draw_stuff)
    {
        target_lenght = string_length(myTextTarget);
     
        parser = "|";
        
        if text_count < target_lenght
        {
            text_count++;
            insert_char = string_char_at(myTextTarget, text_count);
            myText += insert_char;
        }
        else parser = "";
        
        draw_set_font(global.font_balloonText);
        draw_set_colour(c_black);
        draw_set_halign(fa_center);
        draw_set_valign(fa_center);
        draw_set_alpha(myAlpha);
        draw_text_ext(x+56, y-122, string_hash_to_newline(myText+parser), 14, 220);
        draw_set_alpha(1);
     }
}

