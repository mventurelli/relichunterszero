///Draw Event

image_speed = 0;
image_index = 1;

draw_self();

draw_set_font(myFont);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_colour(c_white);

draw_text(x+textXOffset,y+textYOffset,string_hash_to_newline(myText));

