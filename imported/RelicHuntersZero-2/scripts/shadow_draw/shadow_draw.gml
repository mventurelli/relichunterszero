///shadow_draw(color,alpha);
if(surface_exists(global.shadow_surface)) && (global.shadows)
{
    draw_surface_ext(global.shadow_surface,__view_get( e__VW.XView, 0 )-global.surface_view_offset_shadows/2,__view_get( e__VW.YView, 0 )-global.surface_view_offset_shadows/2,1,1,0,argument0,argument1);
}
