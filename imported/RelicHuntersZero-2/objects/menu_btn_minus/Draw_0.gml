/// Draw vs. Selection

if (!isSelected) sprite_index = regularSprite;
else sprite_index = selectedSprite;

if (isAvailable) myAlpha = 1;
else myAlpha = 0.25;

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,myAlpha);



