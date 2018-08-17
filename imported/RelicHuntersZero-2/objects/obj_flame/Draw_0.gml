///Main Draw

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
/*
//Draw
draw_sprite_ext(sprite_index,image_index,x,y,myScale,myScale,image_angle,c_white,myAlpha);

/* */
/*  */
