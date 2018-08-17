if sprite_exists(sprite_index)
{
    draw_self();
    
    if (speed == 0) && (image_speed == 0) && (!global.pause)
    {
        draw_persistent(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
        instance_destroy();
    }
}

