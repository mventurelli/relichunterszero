///Draw Event Override

image_speed = 0;

if (!isAvailable) draw_set_alpha(0.5);
if (isSelected) image_index = 0;
else image_index = 1;

draw_sprite(spr_badgeDaily,badgeRank,x+64,bbox_top+(sprite_height/2)-12);

draw_set_font(myFont);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

if (!isSelected) draw_set_colour(c_white);
else draw_set_colour(make_colour_rgb(239,4,68));

if (labelString != "") draw_text(bbox_left+textXOffset,y+textYOffset,string_hash_to_newline(labelString));

draw_set_alpha(1);