///Draw Persistent

draw_self();

if (image_speed == 0)
{
    draw_persistent(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
    instance_destroy();
}

