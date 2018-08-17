///Draw Event

image_speed = 0;
image_index = 1;

draw_self();

draw_set_font(myFont);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_colour(c_white);

draw_text(bbox_left+textXOffset,y+textYOffset,string_hash_to_newline(myText));

draw_set_font(myFont2);
draw_set_colour(K_BETU_MAGENTA_PAUSE);

draw_text(bbox_left+textXOffset,y+textYOffset+38,string_hash_to_newline(myText2));

if (global.gameMode == gamemode_endless) draw_text(bbox_left+textXOffset,y+textYOffset+55,string_hash_to_newline(loopText));



