///Draw Shadows

if (room != room_start) && (global.shadows)
{
    shadowColor = make_color_rgb(2,56,163);
    if (room == levelHalloween_1) || (room == levelHalloween_2) ||(room == levelHalloween_3 ) || (room == level_storm_1)
	{
        shadowColor = make_color_rgb(10,10,10);
    }
    shadow_update();
    shadow_draw_tall(shadowColor,0.5);
}
