///Main Draw

if (image_angle > 90) && (image_angle < 270) image_yscale = -1;
else image_yscale = 1;

//Pause Animation
old_image_speed = image_speed;
if (global.pause)
{
    image_speed = 0;
}
else 
{
    image_speed = old_image_speed;
}

//Draw
draw_sprite_ext(sprite_index,image_index,x,y,1,image_yscale,image_angle,c_white,myAlpha);

