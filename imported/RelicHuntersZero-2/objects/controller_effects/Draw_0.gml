
///Draw Persistent Objects

if (global.persistent_objects)
{
    if surface_exists(global.persistent_draw) && (global.persistent_draw != -1)
    {
        draw_surface_part(global.persistent_draw,__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ));
    }
}

///Draw Reflective Area

if (global.reflections)
{
    reflection_update();
    reflection_draw(0.2);
}

///Draw Shadows

if (global.shadows)
{
    shadowColor = make_color_rgb(2,56,163);
    if (room == levelHalloween_1) || (room == levelHalloween_2) ||(room == levelHalloween_3 ){
        shadowColor = make_color_rgb(10,10,10);
    }
    
    shadow_update();
    shadow_draw(shadowColor,0.5);
}

