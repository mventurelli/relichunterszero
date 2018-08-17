///Draw

var terminalImage = 0;
if (in_range) terminalImage = 1;
draw_sprite(spr_terminal,terminalImage,x,y);

if (sprite_exists(sprite_index)) draw_self();

draw_sprite(spr_priceTag,0,x,y+50);

if (price){
    draw_set_font(global.font_shopPrice);
    draw_set_halign(fa_left);
    draw_set_valign(fa_center);
        
    var myColor = c_white;
    if (global.bountyEndless < price) myColor = K_BETU_RED;
        
    draw_text_outline(x-4,y+62,string(price),myColor);
}

