///Main Draw

draw_self();

draw_sprite_ext(sprite,sprite_subimage,x,y+draw_height,1,1,sprite_angle,image_blend,1);
reflection_add_sprite_update(sprite,sprite_subimage,x,y-draw_height,1,1,sprite_angle,image_blend,1);

if (!vertical_speed_start)
{
    draw_persistent(sprite,sprite_subimage,x,y+draw_height,1,1,sprite_angle,image_blend,1);
    instance_destroy();
}

