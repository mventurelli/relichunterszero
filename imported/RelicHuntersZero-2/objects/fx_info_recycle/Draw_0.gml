///Main Draw
if myString == "" if instance_exists_fast(owner)
{
    if (global.input[1] == K_INPUT_KEYBOARD) myString = loc_key("INFO_PRESSTORECYCLE_KEYBOARD"); 
	else myString = loc_key("INFO_PRESSTORECYCLE_GAMEPAD"); 
    x = owner.x;
    y = owner.y+32;
    myStringLength = string_length(myString);
}
else instance_destroy();

if (allowDraw) {
			var whiteBarWidth = 16;
	        var whiteBarHeight = 16;
	        var whiteBarWidthPerString = 5;

	        whiteBarWidth += (whiteBarWidthPerString * (myStringLength+2) );

	        draw_set_font(global.font_shopPrice);
	        draw_set_valign(fa_center);
	        draw_set_halign(fa_center);
			draw_set_alpha(1);
	        draw_rectangle_colour(x-(whiteBarWidth/2), y-(whiteBarHeight/2), x+(whiteBarWidth/2), y+(whiteBarHeight/2), c_white, c_white, c_white, c_white, false );
	        draw_set_color(c_black);
	        draw_text(x,y,myString);
}