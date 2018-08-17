event_inherited();

///Main Shit
elite = false;
shield = true;
overshield = 0;

coins = 1;

isVulnerable = true;

energy_max = 99999;
energy = energy_max;
hp_max = 99999;
hp = hp_max;
critical_death = false;

speed_walk = 3.5;
speed_sprint = 3.2;
move_speed = speed_walk;

dash_speed = 10;
dodging = false;
moving = false;

//AI
ai_active = false;
want_to_activate = false;
ai_activation_range = 600;
aiActivationTime = 3500000;//room_speed*3.5;
aiActivationTimeCurrent = 0;

aggro = random_range(0,50);
aggro_max = 200;
aggro_distance = 600;
aggro_add_patrol = 0.25;
aggro_add_close = 2;
aggro_add_hit = aggro_max;
aggro_cost_attack = 20;
aggro_cost_chase = 1;
aggro_cost_sight_forbidden = 5;
aggro_min_chase = 120;

ai_target = noone;
ai_target_change = 2000000;//room_speed*2;
ai_target_change_current = ai_target_change;
ai_shutdown_range = 1000;

ai_state = "PATROL";
ai_patrol_range = 400;
ai_patrol_max = 600;
ai_patrol_x = -1;
ai_patrol_y = -1;

ai_cover_x = -1;
ai_cover_y = -1;
ai_cover_priority = ds_priority_create();
ai_cover_check_range = 400;
ai_cover_hp_threshold = 100;
ai_cover_shield_threshold = 1;

randomize_supression = irandom_range(-1,1);
ai_supression = randomize_supression;

ai_grenade_chance = 0.12;
ai_grenade_cover_multiplier = 5;
ai_myGrenade = noone;
ai_dash_chance = 0;
ai_dash_cooldown = 1000000;//room_speed*1;
ai_dash_cooldown_current = ai_dash_cooldown;

ai_path = path_add();
path_point_current = 0;
collision_mass = 1+random(1);


//VFX
no_score = false;

hit_taken = false;
hit_taken_max = 100000;//room_speed*0.1;
hit_taken_count = 0;
hit_direction = 0;

pushed = false;
push_direction = 0;
push_speed = 0;
push_friction = 0.3;
push_duration = 1500000;//room_speed*1.5;
push_duration_current = 0;

//Shield
shield = true;
energy_regen_time = 5000000;//room_speed*5;
energy_regen_time_current = 0;
energy_regen_speed = 1;

shield_fading = false;
shield_alpha = 0;
shield_alpha_speed = 0;
shield_alpha_accel = 0.2;
shield_alpha_speed_max = 2;

//Weapons
look_direction = 1;
firing = false;

fire_range = 350;

catapultApplied = false;
grenade_count = 99999;
grenade_count_max = 99999;
my_gun = noone;
drop_gun = noone;
drop_gun_chance = 0.25;

//Sprites
sprite_hit = spr_turtle_idle;
sprite_walk = spr_turtle_idle;
sprite_idle = spr_turtle_idle;
sprite_dash = spr_turtle_idle;
sprite_death = spr_turtle_idle;
sprite_death2 = spr_turtle_idle;
sprite_death3 = spr_turtle_idle;
myDash = noone;
myDash2 = noone;

reflection_object_setup(0,-1,image_index);
shadow_object_setup(0,-1,-1,global.default_shadow_yscale);

//Audio
audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, global.falloffMinorDist, global.falloffMinorMax, global.falloffMinorFactor );
audio_emitter_gain(audio_emitter,global.soundVolume);

//
dispatch_event("created", id);
