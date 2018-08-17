
///Toggle Effects ON and OFF

if (!global.shadows_toggle) global.shadows = false;
if (!global.reflections_toggle) global.reflections = false;
if (!global.persistent_toggle) global.persistent_objects = false;
else global.persistent_objects = true;

// SUPER DISGUSTING HACK GO!
if (room == room_start) || (room == room_shop) || (room == room_shop) || (room == room_tutorial) || (room == level3_1) || (room == level3_2) || (room == level3_3) || (room == room_endShop)
{
    global.shadows = false;
    if (global.reflections_toggle) global.reflections = true;
}
else
{
    if (global.shadows_toggle) global.shadows = true;
    global.reflections = false;
}



if (!global.persistent_objects)
{
    if surface_exists(global.persistent_draw) surface_free(global.persistent_draw);
}

if (!global.reflections)
{
    if surface_exists(global.reflection_surface) surface_free(global.reflection_surface);
}

if (!global.shadows)
{
    if surface_exists(global.shadow_surface) surface_free(global.shadow_surface);
    if surface_exists(global.shadow_surface_tall) surface_free(global.shadow_surface_tall);
}
