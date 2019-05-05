event_inherited();

if instance_exists(obj_flame)
{
    //draw_set_blend_mode(bm_add);
    with (obj_flame)
    {
        draw_sprite_ext(sprite_index,image_index,x,y,myScale,myScale,image_angle,c_white,myAlpha);
    }
    //draw_set_blend_mode(bm_normal);
}

