///Draw

draw_self();
//draw_sprite(spr_coin_ground,0,x,y-50);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_font(global.font_shopPrice);

if (global.score_total >= price) color = c_white;
else color = c_red;
draw_text_outline(x+10,y-30,string(price),color);

