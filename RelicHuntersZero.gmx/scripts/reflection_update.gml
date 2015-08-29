///reflection_update();
if (global.reflections)
{
    global.offset_viewX = view_xview[0]-global.surface_view_offset_reflections/2;
    global.offset_viewY = view_yview[0]-global.surface_view_offset_reflections/2; 
    global.offset_viewWidth = view_wview[0]+global.surface_view_offset_reflections/2;
    global.offset_viewHeight = view_hview[0]+global.surface_view_offset_reflections/2;
    
    if (!surface_exists(global.reflection_surface))
    {
        global.reflection_surface = surface_create(global.offset_viewWidth, global.offset_viewHeight);   
    }
    
    surface_set_target(global.reflection_surface);
    draw_clear_alpha(c_black, 0);
    
    // Object Reflections
    reflection_list = global.isoReflectList;
    reflection_list_size = ds_list_size(reflection_list);
    
    for (i=0;  i<reflection_list_size;  i++)
    {
        target = ds_list_find_value(reflection_list, i);
        if instance_exists(target)
        {
            with (target)
            {
                if (x-global.offset_viewX > 0) && (y-global.offset_viewY > 0)
                {
                    if (sprite_reflection)
                    {
                        my_reflection_sprite = sprite_reflection;
                        my_reflection_subimage = sprite_reflection_subimage;
                    }
                    else
                    {
                        my_reflection_sprite = sprite_index;
                        my_reflection_subimage = image_index;
                    }
                    
                    if (sprite_exists(my_reflection_sprite)) draw_sprite_ext(my_reflection_sprite, my_reflection_subimage, x-global.offset_viewX , (y+reflection_height)-global.offset_viewY,image_xscale, -image_yscale,image_angle, image_blend, image_alpha);
                }
            }
        }
    }
    
    // Custom Sprite Reflections
    
    while (!ds_list_empty(global.customReflectList))
    {
        sprite_id = ds_list_size(global.customReflectList)-1
        
        custom_sprite = ds_list_find_value(global.customReflectList, sprite_id);
        custom_sprite_subimage = global.custom_sprite_subimage[sprite_id];
        custom_sprite_x = global.custom_sprite_x[sprite_id];
        custom_sprite_y = global.custom_sprite_y[sprite_id];
        custom_scale_x = global.custom_scale_x[sprite_id];
        custom_scale_y = global.custom_scale_y[sprite_id];
        custom_angle = global.custom_angle[sprite_id];
        custom_color = global.custom_color[sprite_id];
        custom_alpha = global.custom_alpha[sprite_id];
        
        if (sprite_exists(custom_sprite)) &&  (custom_sprite_x-global.offset_viewX > 0) && (custom_sprite_y-global.offset_viewY > 0)
        {
            draw_sprite_ext(custom_sprite, custom_sprite_subimage, custom_sprite_x-global.offset_viewX, custom_sprite_y-global.offset_viewY, custom_scale_x, -custom_scale_y, custom_angle, custom_color, custom_alpha);
        }
        ds_list_delete(global.customReflectList, sprite_id);
    }
    
    surface_reset_target();
    return true;
}
else return false;
