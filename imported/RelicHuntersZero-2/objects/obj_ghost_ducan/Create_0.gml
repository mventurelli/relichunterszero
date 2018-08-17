///Main Shit
event_inherited();
speed_walk = 3.8;
moving = false;
shy = false;
shyTrigger = false;
activationFX = noone;
shyMaxDistance = 650;

teleportTime = 4000000;//room_speed*4;
teleportTimeCurrent = 0;

//Attack
look_direction = 1;
damage = 100;
damage_timer = 1500000;//room_speed*1.5;
damage_timer_current = damage_timer;

//Sprites
sprite_walk = spr_ghost_walking;
sprite_idle = spr_ghost_idle;
sprite_shy = spr_ghost_facing;

//AI
ai_active = false;
want_to_activate = false;
ai_activation_range = 600;

ai_target = noone;
ai_shutdown_range = 1200;
ai_state = "CHASE";

reflection_object_setup(0,-1,image_index);
//shadow_object_setup(0,-1,-1,global.default_shadow_yscale); <-- ghosts cast no shadow, dummy!

//Audio
audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, global.falloffMinorDist, global.falloffMinorMax , global.falloffMinorFactor);
audio_emitter_gain(audio_emitter,global.soundVolume);




