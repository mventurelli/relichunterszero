///shadow_draw_tall(color,alpha);

if(surface_exists(global.shadow_surface_tall)) && (global.shadows)
{
	draw_surface_ext(global.shadow_surface_tall,camera_get_view_x(view_camera[0]) - global.surface_view_offset_shadows/2,camera_get_view_y(view_camera[0]) - global.surface_view_offset_shadows/2,1,1,0,argument0,argument1);
}
