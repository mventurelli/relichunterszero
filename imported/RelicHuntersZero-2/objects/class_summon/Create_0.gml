///Main Shit
event_inherited();

shield = false;
energy_max = 99999;
energy = energy_max;
superShield = false;
hp_max = 99999;
hp = hp_max;
critical_death = false;

isVulnerable = false;
alarm[0] = room_speed*1;

speed_walk = 3.2;
speed_sprint = 3.2;

dash_speed = 20;
dodging = false;
moving = false;

//AI
ai_active = false;
want_to_activate = false;
ai_activation_range = 600;

ai_followTarget = noone;

aggro = random_range(0,50);
aggro_max = 200;
aggro_distance = 400;
aggro_add_patrol = 0.5;
aggro_add_close = 2;
aggro_add_hit = aggro_max;
aggro_cost_attack = 20;
aggro_cost_chase = 1;
aggro_min_chase = 120;

ai_target = noone;
ai_target_change = 2000000;//room_speed*2;
ai_target_change_current = ai_target_change;
ai_shutdown_range = 600;

ai_state = "PATROL";
ai_patrol_range = 400;
ai_patrol_x = -1;
ai_patrol_y = -1;

ai_cover_x = -1;
ai_cover_y = -1;
ai_cover_priority = ds_priority_create();
ai_cover_check_range = 400;
ai_cover_hp_threshold = hp_max*0.5;

ai_dash_chance = 0;
ai_dash_cooldown = 1000000;//room_speed*1;
ai_dash_cooldown_current = ai_dash_cooldown;

ai_path = path_add();
path_point_current = 0;
collision_mass = 1+random(1);


//VFX
hit_taken = false;
hit_taken_max = 100000;//room_speed*0.1;
hit_taken_count = 0;
hit_direction = 0;

pushed = false;
push_direction = 0;
push_speed = 0;
push_friction = 0.75;
push_duration = 200000;//room_speed*0.2;
push_duration_current = 0;

no_score = false;


//Attack
look_direction = 1;
damage = 20;
damage_timer = 1000000;//room_speed*1;
damage_timer_current = damage_timer;

//Sprites
sprite_hit = spr_kamired_hit;
sprite_walk = spr_kamired_walk;
sprite_idle = spr_kamired_idle;
sprite_dash = spr_kamired_attack;
sprite_death = spr_kamired_death;
sprite_death2 = spr_kamired_death2;

sprite_precision1 = spr_kamired_precision;
sprite_precision2 = spr_kamired_precision2;
sprite_precision3 = spr_kamired_precision3;

sprite_dash_fx = spr_kamikaze_dash_fx;
myDash = noone;
myDash2 = noone;

reflection_object_setup(0,-1,image_index);
shadow_object_setup(0,-1,-1,global.default_shadow_yscale);

//Audio
audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, global.falloffMinorDist, global.falloffMinorMax , global.falloffMinorFactor);
audio_emitter_gain(audio_emitter,global.soundVolume);




