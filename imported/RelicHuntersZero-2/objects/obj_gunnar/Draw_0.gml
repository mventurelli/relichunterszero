///Draw

draw_self();

draw_sprite(spr_priceTagScrap,0,x,y+8);

if (in_range) && (price) {
    draw_set_font(global.font_shopPrice);
    draw_set_halign(fa_left);
    draw_set_valign(fa_center);
    
    var myColor = c_white;
    if (global.scrapEndless < price) myColor = K_BETU_RED;
    
    draw_text_outline(x-4,y+20,string(price),myColor);
}

