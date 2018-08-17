///Draw Event

draw_self();

draw_set_font(myFont);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_colour(c_white);

if (labelString != "") draw_text(x+textOffsetX,y+textOffsetY,string_hash_to_newline(labelString));

