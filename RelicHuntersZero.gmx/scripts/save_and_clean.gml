///save_and_clean()
//Saves all game information and cleans up dynamic resources

if surface_exists(global.shadow_surface) surface_free(global.shadow_surface);
if surface_exists(global.shadow_surface_tall) surface_free(global.shadow_surface_tall);
if surface_exists(global.reflection_surface) surface_free(global.reflection_surface);
if surface_exists(global.persistent_draw) surface_free(global.persistent_draw);

save_all();