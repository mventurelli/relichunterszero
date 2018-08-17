///Draw Event

if (isSelected) draw_self();

draw_set_font(myFont);
draw_set_halign(fa_right);
draw_set_valign(fa_center);
draw_set_colour(make_colour_rgb(239,4,68));

if (labelString != "") draw_text(x+textOffsetX,y+textOffsetY,string_hash_to_newline(labelString));

if (isSelected) draw_sprite_ext(spr_menu_star,0,x+starPositionX,y+starPositionY,starScale,starScale,0,c_white,1);

draw_sprite(myBoxSprite,0,bbox_right,y);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_colour(c_white);

draw_text(bbox_right,y,string_hash_to_newline(myValueString));

