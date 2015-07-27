///iso_reflectArea_refresh_ext(alpha);
/*Refreshes the reflections for the reflect area. This function
 *should be put in the step event of a defined reflection area object.
 *@clearImage:  The image index of the object's sprite that will
 *              be used to clear non-reflected areas of the object.
 *              Use -1 for no clearing.
 */
var aa,bb,data,count;
//Check if reflection object exists and is active
if(!rflExists)
    return false;
if(!rflActive)
    return false;
//Check if surface does not exist
if(!surface_exists(rflSurface))
{
    //Try to make a new surface
    rflSurface = surface_create(rflX2-rflX1, rflY2-rflY1);
    if(!surface_exists(rflSurface))
    {
        //Could not make a new surface
        rflError = true;
        rflActive = false;
        return false;
    }
    else
    {
        //Remove any errors
        rflError = false;
    }
}
//Set drawing target and clear reflections
surface_set_target(rflSurface);
draw_clear_alpha(c_black, 0);
//Get data and count
data = global.isoReflectList;
count = ds_list_size(data);
//Go through all reflection instances and draw reflections
for(aa = 0;  aa < count;  aa += 1)
{
    //Get id of instance
    bb = ds_list_find_value(data, aa);
    //Check if instance collides with reflection area
    if (bb.x >= rflX1 && bb.x <= rflX2 && bb.y >= rflY1 && bb.y <= rflY2)
    {
        draw_sprite_ext(bb.sprite_index,bb.image_index,bb.x-rflX1,bb.y-rflY1,bb.image_xscale,bb.image_yscale,bb.image_angle,bb.image_blend,bb.image_alpha*argument0);
    }
    
    /*
    with(bb)
    {
        if(place_meeting(x, y+sprite_yoffset, other))
        {
            //Draw reflection
            draw_sprite_ext(sprite_index, image_index, x-other.rflX1, y-other.rflY1,
                            image_xscale, -image_yscale,
                            image_angle, image_blend, image_alpha);
        }
    }*/
    
}
//Clear reflection area that is NOT affected by reflections.
/*
{
    draw_set_blend_mode_ext(bm_zero, bm_src_alpha);
    //draw_sprite(sprite_index, argument0, x-rflX1, y-rflY1);
    oldAlpha = draw_get_alpha();
    draw_set_alpha(argument0);
    draw_rectangle_colour(rflX1,rflY1,rflX2,rflY2,c_white,c_white,c_white,c_white,false);
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(oldAlpha);
}*/
surface_reset_target();
return true;


