///Draw Pause Menu

if background_exists(global.pauseBackground) draw_background_stretched(global.pauseBackground,__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ),__view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ));

draw_set_alpha(0.7);
draw_set_colour(make_colour_rgb(8,228,170));
draw_rectangle(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ),false);
draw_set_alpha(1);

draw_sprite(spr_pausemenu_corner,0,__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ));

