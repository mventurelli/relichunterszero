///Draw
if (isActive)
{
    var textColor;
    
    if (!isMouseSelected) 
    {
        textColor = make_colour_rgb(31,191,255);
        image_index = 0;
    }
    else
    {
        textColor = c_white;
        image_index = 1;
    }
    draw_self();
    
    draw_set_font(global.font_numberMedium);
    draw_set_valign(fa_center);
    draw_set_halign(fa_left);
    draw_set_colour(textColor);
    draw_text(x+42,y+(sprite_height/2),string_hash_to_newline(labelString));
    
    //Console Labels are drawn on the OK and CANCEL child objects
}

