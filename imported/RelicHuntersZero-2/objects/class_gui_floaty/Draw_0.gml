///Main Draw
draw_set_font(myFont);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

if (drawOutline) 
{
    draw_set_alpha(myAlpha);
    draw_text_outline_ext(x+offsetX,y+offsetY,myString,colorMain,colorOutline);
    draw_set_alpha(1);
}
else draw_text_dropshadow_ext_transformed(x+offsetX,y+offsetY,myString,colorMain,c_black,0.4,1,myScale,myScale,image_angle,myAlpha);
