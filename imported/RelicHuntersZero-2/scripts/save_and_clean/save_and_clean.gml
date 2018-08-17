///save_and_clean()
//Saves all game information and cleans up dynamic resources

if surface_exists(global.shadow_surface) surface_free(global.shadow_surface);
if surface_exists(global.shadow_surface_tall) surface_free(global.shadow_surface_tall);
if surface_exists(global.reflection_surface) surface_free(global.reflection_surface);
if surface_exists(global.persistent_draw) surface_free(global.persistent_draw);

if instance_exists(global.gui_stage) instance_destroy(global.gui_stage);

//Particle Systems cleanup
while (!ds_map_empty(global.particle_emitter_list))
{
    particle_emitter = ds_map_find_first(global.particle_emitter_list);
	particle_system = ds_map_find_value(global.particle_emitter_list, particle_emitter);
    part_emitter_destroy(particle_system, particle_emitter);
    ds_map_delete(global.particle_emitter_list, particle_emitter);
}

while (!ds_map_empty(global.particle_type_list))
{
    particle_type = ds_map_find_first(global.particle_type_list);
    part_type_destroy(particle_type);
    ds_map_delete(global.particle_type_list,particle_type);
}

while (!ds_map_empty(global.particle_list))
{
    particle_system = ds_map_find_first(global.particle_list);
    part_system_destroy(particle_system);
    ds_map_delete(global.particle_list,particle_system);
}

save_all();
