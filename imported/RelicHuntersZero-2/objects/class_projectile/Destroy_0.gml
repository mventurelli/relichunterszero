/// @description hit fx & cleanup

if ((hit == noone) && (global.count_particles < global.max_particles))
{
    hit = instance_create_layer(x,y,"Interactive",fx_hit);
    hit.type = ammo_type;
}

