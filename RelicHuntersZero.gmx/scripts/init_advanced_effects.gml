///init_advanced_effects();

//Init Shadows
if (global.shadows_toggle){
    shadow_init(0.4);
    if (!surface_exists(global.shadow_surface)) {
        var offsetShadows = global.surface_view_offset_shadows/2;
        global.shadow_surface = surface_create(1280+offsetShadows, 720+offsetShadows);
    }
}

//Init Reflections
if (global.reflections_toggle){
    reflection_init();
    if (!surface_exists(global.reflection_surface)) {
        global.reflection_surface = surface_create(1280+offsetReflections, 720+offsetReflections); 
    }
}

//Init Persistent Objects
if (global.persistent_toggle){
    if !(surface_exists(global.persistent_draw)) {
            global.persistent_draw = surface_create(room_width,room_height);
            surface_set_target(global.persistent_draw);
            draw_clear_alpha(c_white,0);
            surface_reset_target();
    }
}
