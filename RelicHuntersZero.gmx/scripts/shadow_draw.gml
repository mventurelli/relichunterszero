///shadow_draw(color,alpha);
if(surface_exists(global.shadow_surface)) && (global.shadows)
{
    draw_surface_ext(global.shadow_surface,view_xview[0]-global.surface_view_offset_shadows/2,view_yview[0]-global.surface_view_offset_shadows/2,1,1,0,argument0,argument1);
}
