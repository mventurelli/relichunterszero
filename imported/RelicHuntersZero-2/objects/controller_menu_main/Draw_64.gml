///Version Number
if (room == room_menu) 
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_center);
    draw_set_color(c_white);
    draw_set_font(global.font_numberSmall);
    
    draw_text_dropshadow_ext_transformed(window_get_width()*0.01, window_get_height()*0.97, global.currentVersionNumber, c_white, K_BETU_MAGENTA,0.8,1,1,1,0,1);
}

