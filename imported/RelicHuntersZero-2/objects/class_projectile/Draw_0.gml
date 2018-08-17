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

//Draw
if (ammo_type == type_light) sprite_index = spr_bullet_small;
else if (ammo_type == type_medium) sprite_index = spr_bullet;
else if (ammo_type == type_heavy) sprite_index = spr_bullet_blue;

image_angle = direction;

if (myAlpha < 0.4) myAlpha = 0.4;
draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,myAlpha);

