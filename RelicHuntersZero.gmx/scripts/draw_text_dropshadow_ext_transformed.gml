///draw_text_dropshadow_ext_transformed(x, y, text, textColor, shadowColor, shadowIntensity, shadowDistance, xScale, yScale, rotation, alpha)
// Draws colored text with a colored outline

var oldColor = draw_get_color();
var oldAlpha = draw_get_alpha();

var tX = argument0;
var tY = argument1;
var text = argument2;
var textColor = argument3;
var shadowColor = argument4;
var shadowIntensity = argument5;
var shadowDistance = argument6;
var xScale = argument7;
var yScale = argument8;
var myRotation = argument9;
var myAlpha = argument10;

draw_set_color(shadowColor);
draw_set_alpha(shadowIntensity * myAlpha);

draw_text_transformed(tX+shadowDistance,tY+shadowDistance,text,xScale,yScale,myRotation);

draw_set_color(textColor);
draw_set_alpha(myAlpha);
draw_text_transformed(tX,tY,text,xScale,yScale,myRotation);

draw_set_color(oldColor);
draw_set_alpha(oldAlpha);
