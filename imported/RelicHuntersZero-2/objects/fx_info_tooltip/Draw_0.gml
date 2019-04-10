///@description Main Draw
if (owner != noone) if instance_exists_fast(owner)
{
    myString = owner.name;
	myString2 = owner.description;
	rarity = owner.rarity;
	rarityColor = rarity_get_color(rarity);
	
	x = owner.bbox_right + 8;
    y = owner.y;
    myStringLength = string_length(myString);
	myString2Length = string_length(myString2);
	
	if (owner.in_range) allowDraw = true;
	else {
        drawCompleted = false;
        bgAlpha = 0;
        textAlpha = 0;
        allowDraw = false;
        allowDrawTimeCurrent = 0;
    }
}
else instance_destroy();

if (allowDraw) {
			var whiteBarWidth = 16;
	        var whiteBarHeight = 16;
	        var whiteBarWidthPerString = 5;
	        var alphaSpeed = 0.002;
        
	        var whiteBarWidth1 = whiteBarWidth + (whiteBarWidthPerString * (myStringLength+2) );
			var whiteBarWidth2 = whiteBarWidth + (whiteBarWidthPerString * (myString2Length+2) );
			
			whiteBarWidth = max(whiteBarWidth1,whiteBarWidth2);
			
	        if (!drawCompleted){
	                bgAlpha += alphaSpeed;
	                textAlpha += alphaSpeed;
	                if (bgAlpha) && (textAlpha) drawCompleted = true;
			}
            
	        draw_set_font(global.font_shopPrice);
	        draw_set_valign(fa_center);
	        draw_set_halign(fa_center);
			draw_set_alpha(1);
	        draw_rectangle_colour(x, y-(whiteBarHeight/2), x+whiteBarWidth, y+(whiteBarHeight/2), rarityColor, rarityColor, rarityColor, rarityColor, false );
			draw_rectangle_colour(x, y-(whiteBarHeight/2)-whiteBarHeight, x+whiteBarWidth, y+(whiteBarHeight/2)-whiteBarHeight, rarityColor, rarityColor, rarityColor, rarityColor, false );
	        if (rarity == 0) draw_set_color(c_black) else draw_set_color(c_white);
	        draw_text(x+(whiteBarWidth/2),y-whiteBarHeight,string_hash_to_newline(myString));
			draw_text(x+(whiteBarWidth/2),y,string_hash_to_newline(myString2));
}