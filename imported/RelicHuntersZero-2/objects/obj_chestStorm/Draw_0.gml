/// @description Draw price

event_inherited();
draw_self();

draw_sprite(spr_priceTag,0,x,y+44);

draw_set_font(global.font_shopPrice);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
var myColor = c_white;
if (global.bountyEndless < priceCurrent) myColor = K_BETU_RED;
draw_text_outline(x-4,y+56,string(priceCurrent),myColor);
