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
switch (ammo_type)
{
	case type_light : sprite_index = spr_bullet_small; break;
	case type_medium : sprite_index = spr_bullet; break;
	case type_heavy : sprite_index = spr_bullet_blue; break;
	case type_enemy : sprite_index = spr_bulletEnemy;
}

image_angle = direction;

if (myAlpha < 0.4) myAlpha = 0.4;
draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,myAlpha);

