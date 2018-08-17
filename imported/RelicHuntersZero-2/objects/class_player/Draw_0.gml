///Draw Event + Digging + bDay Hat

if (!isDigging) 
{
    draw_self();
    if (animation_current == "dig") draw_sprite_ext(spr_shovel_dig,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}
else{
    draw_sprite_part( sprite_index,image_index,0,0,sprite_width,sprite_height-digDepth,x-sprite_xoffset,(y-sprite_yoffset)+digDepth );
   
    if (animation_current != "dig") draw_sprite(spr_shovel_idle,image_index,x,y);
    else draw_sprite_part( spr_shovel_dig,image_index,0,0,sprite_width,sprite_height-digDepth,x-sprite_xoffset,(y-sprite_yoffset)+digDepth );
    
    var digProgress = digDepthMax/3;
    var digImage = 0;
    
    if (digDepth < digProgress) digImage = 0;
    if (digDepth >= digProgress) && (digDepth < (digProgress*2)) digImage = 1;
    if (digDepth >= (digProgress*2)) digImage = 2;
 
    draw_sprite_ext(spr_digPile,digImage,x,y,1,1,0,myDirtColor,1);
}


if (global.bdayMode)							// Birthday Hat!!!
{
	var hatX = x;
	var hatY = y;
	
	switch (animation_current)
	{
	    case ("idle"):  
	        switch (round(image_index))
			{
				case 3: case 4: case 5: case 9: case 10: case 11:
					hatY -= 2;
					break;
			}
			break;
			
	    case ("walk"):
	        switch (round(image_index))
			{
				case 1: case 4:
					hatY -= 2;
					break;
			}
	        break;
			
	    case ("sprint"):
	        switch (round(image_index))
			{
				case 1: case 4:
					hatY -= 6;
					break;
					
				case 2: case 5:
					hatY -= 2;
			}
	        break;
	}
	
	if (isDigging) hatY += digDepth;
	draw_sprite_ext(spr_bday_hat,0,hatX+2,hatY+12,1.25*image_xscale,1.25*image_yscale,0,c_white,1);
}
