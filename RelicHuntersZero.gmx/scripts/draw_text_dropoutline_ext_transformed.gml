///draw_text_dropshadow_ext_transformed(x, y, text, textColor, outlineColor, shadowColor, shadowIntensity, shadowDistance, xScale, yScale, rotation, alpha)
// Draws colored text with a colored outline and a colored drop shadow

var oldColor = draw_get_color();
var oldAlpha = draw_get_alpha();


var tX = argument0;
var tY = argument1;
var text = argument2;
var textColor = argument3;
var outlineColor = argument4;
var shadowColor = argument5;
var shadowIntensity = argument6;
var shadowDistance = argument7;
var xScale = argument8;
var yScale = argument9;
var myRotation = argument10;
var myAlpha = argument11;


//Shadow
draw_set_color(shadowColor);
draw_set_alpha(shadowIntensity * myAlpha);
draw_text_transformed(tX+shadowDistance,tY+shadowDistance,text,xScale,yScale,myRotation);

// Outline
draw_set_color(outlineColor);
draw_text_transformed(tX+1,tY+1,text,xScale,yScale,myRotation);
draw_text_transformed(tX-1,tY-1,text,xScale,yScale,myRotation);
draw_text_transformed(tX,tY+1,text,xScale,yScale,myRotation);
draw_text_transformed(tX+1,tY,text,xScale,yScale,myRotation);
draw_text_transformed(tX,tY-1,text,xScale,yScale,myRotation);
draw_text_transformed(tX-1,tY,text,xScale,yScale,myRotation);
draw_text_transformed(tX-1,tY+1,text,xScale,yScale,myRotation);
draw_text_transformed(tX+1,tY-1,text,xScale,yScale,myRotation);

// Actual Text
draw_set_color(textColor);
draw_set_alpha(myAlpha);
draw_text_transformed(tX,tY,text,xScale,yScale,myRotation);

//Revert to previous values
draw_set_color(oldColor);
draw_set_alpha(oldAlpha);
