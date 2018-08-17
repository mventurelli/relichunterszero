///draw_persistent(sprite,subimg,x,y,xscale,yscale,rot,colour,alpha);

if (global.persistent_objects)
{
    if !(surface_exists(global.persistent_draw))
    {
        global.persistent_draw = surface_create(room_width,room_height);
        surface_set_target(global.persistent_draw);
        draw_clear_alpha(c_white,0);
        surface_reset_target();
    }
    
    surface_set_target(global.persistent_draw)
    draw_sprite_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
    surface_reset_target();
}
