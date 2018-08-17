///Draw Event

image_speed = 0;
image_index = 0;

draw_self();

draw_set_font(myFont);
draw_set_halign(fa_right);
draw_set_valign(fa_center);
draw_set_colour(make_colour_rgb(239,4,68));

draw_text(x+textXOffset,y+textYOffset,string_hash_to_newline(myText));

draw_set_alpha(1);

draw_sprite(spr_menu_star,0,x+starPositionX,y+starPositionY);

