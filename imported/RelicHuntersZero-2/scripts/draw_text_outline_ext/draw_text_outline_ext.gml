///draw_text_outline_ext(x,y,text,text color,outline color)
// Draws colored text with a colored outline
var oldColor;
oldColor = draw_get_color();
draw_set_color(argument4);
draw_text(argument0+1,argument1+1,string_hash_to_newline(argument2));
draw_text(argument0-1,argument1-1,string_hash_to_newline(argument2));
draw_text(argument0,argument1+1,string_hash_to_newline(argument2));
draw_text(argument0+1,argument1,string_hash_to_newline(argument2));
draw_text(argument0,argument1-1,string_hash_to_newline(argument2));
draw_text(argument0-1,argument1,string_hash_to_newline(argument2));
draw_text(argument0-1,argument1+1,string_hash_to_newline(argument2));
draw_text(argument0+1,argument1-1,string_hash_to_newline(argument2));
draw_set_color(argument3);
draw_text(argument0,argument1,string_hash_to_newline(argument2));
draw_set_color(oldColor);
