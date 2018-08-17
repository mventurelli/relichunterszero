///Draw

if (sprite_index = spr_resetButton) {
    if (in_range) image_index = 1;
    else image_index = 0;
}

draw_self();

draw_set_font(global.font_shopPrice);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_colour(c_white);
var infoString = loc_key("TERMINAL_GUN_MODS");
draw_text(x,y+30,string_hash_to_newline(infoString));

