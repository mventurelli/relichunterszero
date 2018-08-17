///Draw Event Override

if (isSelected) image_index = 0;
else image_index = 1;

draw_self();

draw_set_font(myFont);
draw_set_halign(fa_left);
draw_set_valign(fa_center);

if (!isSelected) draw_set_colour(c_white);
else draw_set_colour(make_colour_rgb(239,4,68));

if (labelString != "") draw_text(x+textOffsetX,y+textOffsetY,string_hash_to_newline(labelString));

if (isSelected) draw_sprite_ext(spr_menu_star,0,bbox_right,y,starScale,starScale,0,c_white,1);

