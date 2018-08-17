///Bounce Stuff

event_inherited();
sprite = spr_grenadeNew;

angular_min = -10;
angular_max = 10;
angular_speed = random_range(angular_min,angular_max);

vertical_speed_start = 8;
vertical_speed = -vertical_speed_start;

speed_per_second = 4;

//Bounce min/max is reduced from vertical speed at each bounce, higher = bounces less
bounce_min = 2;
bounce_max = 2.5;

dynamicHeight = -60;

canRicochet = true;

allowBounce = false;
allowBounceTime = 400000;//room_speed*0.4;
allowBounceTimeCurrent = 0;

///Particle Trail

smoke_system = noone;
smoke_emitter = noone;
smoke_particle = noone;

smoke_system = part_system_create_layer(layer_get_id("Interactive_Over"), false);
ds_map_add(global.particle_list, smoke_system, smoke_system);
//part_system_depth(global.smokeSystem[id], depth+1 );
part_system_automatic_update(smoke_system, false);

smoke_particle = part_type_create();
ds_map_add(global.particle_type_list, smoke_particle, smoke_particle);
part_type_shape(smoke_particle, pt_shape_square);
part_type_size(smoke_particle, 0.5, 2, 0, 0);
part_type_scale(smoke_particle,0.15,0.15);
part_type_colour1(smoke_particle, c_white);
part_type_alpha2(smoke_particle, 0.5, 0);
part_type_speed(smoke_particle, 0.1, 0.25, 0, 0);
part_type_direction(smoke_particle, 90, 90, 0, 0);
part_type_gravity(smoke_particle, 0, 270);
part_type_orientation(smoke_particle, 0, 0, 0, 0, 1);
part_type_blend(smoke_particle, true);
part_type_life(smoke_particle, room_speed*0.3, room_speed*0.5);

smoke_emitter = part_emitter_create(smoke_system);
ds_map_add(global.particle_emitter_list,smoke_emitter,smoke_system);
part_emitter_region(smoke_system, smoke_emitter, x-5, x+5, y-5, y+5, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(smoke_system, smoke_emitter, smoke_particle, 1);

///Grenade Stuff

goBoom = false;

damage = 200;

myTarget = instance_create_layer(x,y,"Interactive",fx_grenadeTarget);
myTarget.parent = id;
targetSetup = false;

playerTrigger = noone;
enemyTrigger = noone;

triggerRadiusForPlayers = 16;
triggerRadiusForEnemies = 32;

detonationTime = 100000;//room_speed*1;
detonationTimeCurrent = 0;
detonationRadius = 75;

audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, global.falloffMinorDist, global.falloffMinorMax, global.falloffMinorFactor );
audio_emitter_gain(audio_emitter,global.soundVolume);
audio_play(audio_emitter,false,1,sfx_grenade_loop);

speedReset = false;
oldSpeed = 0;

reflection_object_setup(draw_height,spr_grenadeNew,image_index);
