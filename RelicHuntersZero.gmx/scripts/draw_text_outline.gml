///draw_text_outline(x,y,text,color)
// Draws colored text with a black outline
var oldColor;
oldColor = draw_get_color();
draw_set_color(c_black);
draw_text(argument0+1,argument1+1,argument2);
draw_text(argument0-1,argument1-1,argument2);
draw_text(argument0,argument1+1,argument2);
draw_text(argument0+1,argument1,argument2);
draw_text(argument0,argument1-1,argument2);
draw_text(argument0-1,argument1,argument2);
draw_text(argument0-1,argument1+1,argument2);
draw_text(argument0+1,argument1-1,argument2);
draw_set_color(argument3);
draw_text(argument0,argument1,argument2);
draw_set_color(oldColor);
