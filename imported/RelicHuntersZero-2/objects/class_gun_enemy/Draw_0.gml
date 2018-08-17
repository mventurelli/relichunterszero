
if (sprite_exists(sprite_index)) 
	draw_sprite_ext(sprite_index,image_index,drawX,drawY,image_xscale,image_yscale,image_angle,c_white,1);

if (drawLaserSight)
{
	draw_line_width_colour(x,y,laserLineX,laserLineY,2,c_green,c_green);
	if (laserDrawRange < projectile_range) draw_circle_colour(laserLineX, laserLineY, 4, c_green, c_green, false);
}



