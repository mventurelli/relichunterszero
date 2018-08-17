///Cleanup
audio_emitter_free(audio_emitter);

if (smoke_emitter != noone) 
{
	part_emitter_destroy(smoke_system, smoke_emitter);
	ds_map_delete(global.particle_emitter_list, smoke_emitter);		
}

if (smoke_particle != noone) 
{
	part_type_destroy(smoke_particle);
	ds_map_delete(global.particle_type_list, smoke_particle);
}

if (smoke_system != noone) 
{
	part_system_destroy(smoke_system);
	ds_map_delete(global.particle_list, smoke_system);
}
