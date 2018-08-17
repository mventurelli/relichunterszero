///Main Draw
if (active)
{
    myColor = c_white;
    myAlpha = 1;
}
else
{
    myColor = c_white;
    myAlpha = 0.42;
}

if (!((full_relic)&&(!active))) draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,myColor,myAlpha);

if (full_relic) && (active)
{
    betu_magenta = make_colour_rgb(204,10,68);
    draw_set_valign(fa_center);
    draw_set_halign(fa_center);
    draw_set_font(global.font_balloonText);
    
    draw_set_color(c_white);
    if (!equipped) 
    {
        draw_text(x,y+58,string_hash_to_newline(relicName));
        image_index = 0;
        image_speed = 0;
    }
    else
    {
        draw_text_outline_ext(x,y+58,relicName,c_white,betu_magenta);
        image_speed = 0.2;
    }
    draw_set_color(c_black);
    draw_text(x,y+70,string_hash_to_newline(relicDescription));
}

