///shadow_update();
if (global.shadows)
{
	global.offset_viewX = camera_get_view_x(view_camera[0]) - global.surface_view_offset_shadows/2;
	global.offset_viewY = camera_get_view_y(view_camera[0]) - global.surface_view_offset_shadows/2;
	global.offset_viewWidth = camera_get_view_width(view_camera[0]) + global.surface_view_offset_shadows;
    global.offset_viewHeight = camera_get_view_height(view_camera[0]) + global.surface_view_offset_shadows;
   
   //global.offset_viewX = __view_get( e__VW.XView, 0 )-global.surface_view_offset_shadows/2;
    //global.offset_viewY = __view_get( e__VW.YView, 0 )-global.surface_view_offset_shadows/2; 
    //global.offset_viewWidth = __view_get( e__VW.WView, 0 )+global.surface_view_offset_shadows/2;
   // global.offset_viewHeight = __view_get( e__VW.HView, 0 )+global.surface_view_offset_shadows/2;
	
    
    //Regular Shadows
    if (!surface_exists(global.shadow_surface))
    {
        global.shadow_surface = surface_create(global.offset_viewWidth, global.offset_viewHeight);   
    }
    
    
    surface_set_target(global.shadow_surface);
    draw_clear_alpha(c_black, 0);
        
    shadow_list = global.shadowList;
    shadow_list_size = ds_list_size(global.shadowList);
        
    for (i=0; i<shadow_list_size; i++)
    {
        target = ds_list_find_value(shadow_list, i);
        if instance_exists(target)
        {
            with (target)
            {
                if (x-global.offset_viewX > 0) && (y-global.offset_viewY > 0)
                {
                    lightsource = instance_nearest(x,y,class_lightsource);
                    if (lightsource != noone)
                    {
                        my_shadow_sprite = sprite_index;
                        my_shadow_subimage = image_index;
                        my_shadow_yscale = sprite_shadow_yscale;
                    }
                    else
                    {
                        my_shadow_sprite = sprite_index;
                        my_shadow_subimage = image_index;
                        my_shadow_yscale = sprite_shadow_yscale;
                    }
                    
                    darkBlue = make_color_rgb(2,56,163);
                    if (sprite_exists(my_shadow_sprite)) draw_sprite_ext(my_shadow_sprite, my_shadow_subimage, x-global.offset_viewX , (y+shadow_height*my_shadow_yscale)-global.offset_viewY, image_xscale, -image_yscale*my_shadow_yscale, image_angle, darkBlue, 1);
                }
            }
        }
    }           
    surface_reset_target();
    
    
    //Tall Shadows
    if (!surface_exists(global.shadow_surface_tall))
    {
        global.shadow_surface_tall = surface_create(global.offset_viewWidth, global.offset_viewHeight);   
    }
    
    
    surface_set_target(global.shadow_surface_tall);
    draw_clear_alpha(c_black, 0);
        
    shadow_list = global.shadowListTall;
    shadow_list_size = ds_list_size(global.shadowListTall);
        
    for (i=0; i<shadow_list_size; i++)
    {
        target = ds_list_find_value(shadow_list, i);
        if instance_exists(target)
        {
            with (target)
            {
                if (x-global.offset_viewX > 0) && (y-global.offset_viewY > 0)
                {
                    lightsource = instance_nearest(x,y,class_lightsource);
                    if (lightsource != noone)
                    {
                        my_shadow_sprite = sprite_index;
                        my_shadow_subimage = image_index;
                        my_shadow_yscale = sprite_shadow_yscale;
                    }
                    else
                    {
                        my_shadow_sprite = sprite_index;
                        my_shadow_subimage = image_index;
                        my_shadow_yscale = sprite_shadow_yscale;
                    }
                    
                    darkBlue = make_color_rgb(2,56,163);
                    if (sprite_exists(my_shadow_sprite))
                    {
                        draw_sprite_ext(my_shadow_sprite, my_shadow_subimage, x-global.offset_viewX , (y+shadow_height*my_shadow_yscale)-global.offset_viewY, image_xscale, -image_yscale*my_shadow_yscale, image_angle, darkBlue, 1);
                        
                        surface_set_target(global.shadow_surface);
                        draw_set_blend_mode(bm_subtract);
                        draw_sprite_ext(my_shadow_sprite, my_shadow_subimage, x-global.offset_viewX , (y+shadow_height*my_shadow_yscale)-global.offset_viewY, image_xscale, -image_yscale*my_shadow_yscale, image_angle, darkBlue, 1);
                        draw_set_blend_mode(bm_normal);
                        surface_reset_target();
                    }
                }
            }
        }
    }
    
    
    
    //Make Everything Colored
                draw_set_blend_mode_ext(bm_dest_alpha, bm_src_colour);
                draw_rectangle_colour(0,0,global.offset_viewWidth,global.offset_viewHeight,c_white,c_white,c_white,c_white,false);
                draw_rectangle_colour(0,0,global.offset_viewWidth,global.offset_viewHeight,c_white,c_white,c_white,c_white,false);
                draw_set_blend_mode(bm_normal);
                
    surface_reset_target();
    
    surface_set_target(global.shadow_surface);
                draw_set_blend_mode_ext(bm_dest_alpha, bm_src_colour);
                draw_rectangle_colour(0,0,global.offset_viewWidth,global.offset_viewHeight,c_white,c_white,c_white,c_white,false);
                draw_rectangle_colour(0,0,global.offset_viewWidth,global.offset_viewHeight,c_white,c_white,c_white,c_white,false);
                draw_set_blend_mode(bm_normal);
    surface_reset_target();
}

