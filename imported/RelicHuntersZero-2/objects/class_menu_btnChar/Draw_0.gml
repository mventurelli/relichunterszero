///Override Draw Event

//if (!isAvailable) //draw_set_alpha(0.5);

draw_self();

draw_set_font(myFont);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

if (!isSelected) draw_set_colour(c_white);
else draw_set_colour(c_white);

if (labelString != "") draw_text(x+230,y+66,string_hash_to_newline(labelString));

draw_set_alpha(1);

//if (isSelected) draw_sprite_ext(spr_menu_star,0,x+starPositionX,y+starPositionY,starScale,starScale,0,c_white,1);

//For now they are staying on top of each other, live with it
var inputIconX = x+65;
var inputIconY = y+56;

if (global.selectedButton[K_INPUT_KEYBOARD] == id) draw_sprite_ext(spr_char_inputKey,0,inputIconX,inputIconY,starScale,starScale,0,c_white,1);
if (global.selectedButton[K_INPUT_JOYSTICK1] == id) draw_sprite_ext(spr_char_inputJoy1,1,inputIconX,inputIconY,starScale,starScale,0,c_white,1);
if (global.selectedButton[K_INPUT_JOYSTICK2] == id) draw_sprite_ext(spr_char_inputJoy2,2,inputIconX,inputIconY,starScale,starScale,0,c_white,1);

