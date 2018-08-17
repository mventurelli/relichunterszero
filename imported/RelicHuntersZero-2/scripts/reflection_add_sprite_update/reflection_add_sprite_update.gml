///reflection_add_sprite_update(sprite_index,image_index,x,y,xscale,yscale,rotation,color,alpha);

if (global.reflections)
{
    ds_list_add(global.customReflectList, argument0);
    
    var i;
    i = ds_list_size(global.customReflectList)-1;
    
    global.custom_sprite_subimage[i] = argument1;
    global.custom_sprite_x[i] = argument2;
    global.custom_sprite_y[i] = argument3;
    global.custom_scale_x[i] = argument4;
    global.custom_scale_y[i] = argument5;
    global.custom_angle[i] = argument6;
    global.custom_color[i] = argument7;
    global.custom_alpha[i] = argument8;
}
