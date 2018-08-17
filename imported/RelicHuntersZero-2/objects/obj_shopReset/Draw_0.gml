///Draw

if (sprite_index = spr_resetButton) {
    if (in_range) image_index = 1;
    else image_index = 0;
}

draw_self();

draw_set_font(global.font_shopPrice);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
        
var myColor = c_white;
if (global.bountyEndless < price) myColor = K_BETU_RED;
        
draw_sprite(spr_priceTag,0,x,y+50);
draw_text_outline(x-4,y+62,string(price),myColor);

draw_set_font(global.font_shopPrice);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_colour(c_white);
var infoString = loc_key("TERMINAL_RESET");
draw_text(x,y+30,string_hash_to_newline(infoString));

