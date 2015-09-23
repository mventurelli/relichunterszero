///reflection_draw(alpha);
var oldAlpha;

if(surface_exists(global.reflection_surface)) && (global.reflections)
{
    draw_surface_ext(global.reflection_surface,view_xview[0]-global.surface_view_offset_reflections/2,view_yview[0]-global.surface_view_offset_reflections/2,1,1,0,c_white,argument0);
}










/*
///reflection_draw(alpha);
var oldAlpha;

if(surface_exists(global.reflection_surface))
{
    draw_surface_ext(global.reflection_surface,view_xview[0],view_yview[0],1,1,0,c_white,argument0);
}
