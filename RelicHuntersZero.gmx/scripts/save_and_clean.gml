///save_and_clean()
//Saves all game information and cleans up dynamic resources

if surface_exists(global.shadow_surface) surface_free(global.shadow_surface);
if surface_exists(global.shadow_surface_tall) surface_free(global.shadow_surface_tall);
if surface_exists(global.reflection_surface) surface_free(global.reflection_surface);
if surface_exists(global.persistent_draw) surface_free(global.persistent_draw);

//Particle Systems cleanup
while (!ds_list_empty(global.particle_type_list))
{
    particle_type = ds_list_find_value(global.particle_type_list,0);
    part_type_destroy(particle_type);
    ds_list_delete(global.particle_type_list,0);
}

while (!ds_list_empty(global.particle_list))
{
    particle_system = ds_list_find_value(global.particle_list,0);
    part_system_destroy(particle_system);
    ds_list_delete(global.particle_list,0);
}

save_all();
