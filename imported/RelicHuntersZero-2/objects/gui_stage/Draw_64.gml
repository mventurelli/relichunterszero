///Draw Self
if (!global.pauseMenu && visible)
{
    myX = window_get_width()/2;
    myY = window_get_height()/2;
    
    if (sprite_exists(sprite_index)) draw_sprite_ext(sprite_index,image_index,myX,myY,1.25,1.25,image_angle,image_blend,image_alpha);
}

