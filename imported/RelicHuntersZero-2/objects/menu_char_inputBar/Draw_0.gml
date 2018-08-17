///Draw Override

//draw_self();

var inputIconX = x-100+40;
var inputIconY = y+56;


if (global.selectedButton[K_INPUT_KEYBOARD] == id) draw_sprite_ext(spr_char_inputKey,0,inputIconX,y+96,1,1,0,c_white,1);
if (global.selectedButton[K_INPUT_JOYSTICK1] == id) draw_sprite_ext(spr_char_inputJoy1,1,inputIconX,y+148,1,1,0,c_white,1);
if (global.selectedButton[K_INPUT_JOYSTICK2] == id) draw_sprite_ext(spr_char_inputJoy2,2,inputIconX,y+200,1,1,0,c_white,1);

