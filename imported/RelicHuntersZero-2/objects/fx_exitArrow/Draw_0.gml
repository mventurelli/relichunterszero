///Draw EXIT label

if (drawX != -1) && (drawY != -1) && (isVisible)
{
    draw_sprite_ext(sprite_index,image_index,drawX,drawY,image_xscale*drawOrientation,image_yscale,image_angle,image_blend,0.7);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    draw_set_colour(K_BETU_MAGENTA);
    draw_set_font(global.font_menuSmall);
    
    draw_text(drawX,drawY,string_hash_to_newline(loc_key("INFO_EXIT")));
}
