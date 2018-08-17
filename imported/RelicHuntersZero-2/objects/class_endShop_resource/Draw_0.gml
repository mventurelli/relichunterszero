///Draw Sprite and Price

draw_sprite(sprite_index,image_index,x+12,y);

draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_font(global.font_shopPrice);

if (global.bountyEndless >= priceCurrent) color = c_white;
else color = c_red;
draw_text_outline(x+10,y-30,string(priceCurrent),color);

