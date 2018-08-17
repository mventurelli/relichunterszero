//Static shadows
draw_self();

if (!global.shadows_toggle)
{
    sprite_index = staticShadow ;
}

/*


{
draw_set_blend_mode_ext(bm_dest_alpha, bm_src_colour);
    var darkBlue = make_color_rgb(2,56,163);
    var shadowAlpha = 0.5;
    
    draw_sprite_ext(sprite_index,0,x,y+sprite_height-4,image_xscale,-image_yscale-(image_yscale*global.default_shadow_yscale),0,darkBlue,shadowAlpha);

    draw_set_blend_mode(bm_normal);
}

shadow_object_setup(0,-1,-1,global.default_shadow_yscale);

-image_yscale*global.default_shadow_yscale


///shadow_object_setup(shadow height,sprite shadow, sprite shadow subimage,shadow yscale);

/* */
/*  */
