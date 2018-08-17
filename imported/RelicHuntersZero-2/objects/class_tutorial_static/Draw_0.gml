///Draw Text

draw_set_font(myFont);
draw_set_color(myColor);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

if (global.input[1] == K_INPUT_KEYBOARD) draw_text_ext(x,y,string_hash_to_newline(myTextKeyboard),fontSep,fontWidth);
else draw_text_ext(x,y,string_hash_to_newline(myTextJoystick),fontSep,fontWidth);




