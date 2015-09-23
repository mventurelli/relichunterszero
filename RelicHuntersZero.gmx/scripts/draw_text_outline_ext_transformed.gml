///draw_text_outline_ext_transformed(x,y,text,text color,outline color,xscale,yscale,rotation)
// Draws colored text with a colored outline
var oldColor;
oldColor = draw_get_color();
draw_set_color(argument4);


draw_text_transformed(argument0+1,argument1+1,argument2,argument5,argument6,argument7);
draw_text_transformed(argument0-1,argument1-1,argument2,argument5,argument6,argument7);
draw_text_transformed(argument0,argument1+1,argument2,argument5,argument6,argument7);
draw_text_transformed(argument0+1,argument1,argument2,argument5,argument6,argument7);
draw_text_transformed(argument0,argument1-1,argument2,argument5,argument6,argument7);
draw_text_transformed(argument0-1,argument1,argument2,argument5,argument6,argument7);
draw_text_transformed(argument0-1,argument1+1,argument2,argument5,argument6,argument7);
draw_text_transformed(argument0+1,argument1-1,argument2,argument5,argument6,argument7);
draw_set_color(argument3);
draw_text_transformed(argument0,argument1,argument2,argument5,argument6,argument7);
draw_set_color(oldColor);
