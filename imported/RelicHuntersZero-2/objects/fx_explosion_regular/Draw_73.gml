/// @description draw explosion radius
// You can write your code in this editor

if (image_index >= trigger_frame)
{
    depth = layer_get_depth("Interactive_Over");
    draw_set_colour(K_BETU_RED);
    draw_set_alpha(radiusAlpha);
    draw_rectangle(x-radius-1,y-radius-1,x+radius+1,y+radius+1,true);
    draw_rectangle(x-radius,y-radius,x+radius,y+radius,true);
    draw_rectangle(x-radius+1,y-radius+1,x+radius-1,y+radius-1,true);
}