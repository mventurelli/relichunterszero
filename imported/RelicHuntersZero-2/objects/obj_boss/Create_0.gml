///Main Shit
//Owner variables
owned = [];
activated = [];

//Boss variables
var bossBar = 666;
draw_healthbar_delayed_init(bossBar);
isBoss = false; //Yup, I know. Figures.
isVulnerable = true;

//Shooter Class Derivative
elite = false;
shield = false;

coins = 1;

energy_max = 999999;
energy = 0;
hp_max = 6000;
hp = hp_max;

hpMilestoneCurrent = 0;
hpMilestone1 = 4500;
hpMilestone2 = 3000;
hpMilestone3 = 1500;

critical_death = false;

speed_walk = 2.5;
speed_sprint = 3.2;
move_speed = speed_walk;

dash_speed = 20;
dodging = false;
moving = false;

//AI
ai_active = true;
want_to_activate = false;
ai_activation_range = 2000;

aggro = random_range(0,50);
aggro_max = 200;
aggro_distance = 1200;
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

ai_supression = true;

ai_grenade_chance = 0;
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
push_friction = 0.5;
push_duration = 300000;//room_speed*0.3;
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

fire_range = 1200;

grenade_count = 99999;
grenade_count_max = 99999;
my_gun = noone;
drop_gun = noone;
drop_gun_chance = 0.25;

//Sprites
sprite_hit = spr_boss_hit;
sprite_walk = spr_boss_walk;
sprite_idle = spr_boss_idle;
sprite_dash = spr_boss_walk;
sprite_death = spr_boss_death;
sprite_death2 = spr_boss_death;
sprite_death3 = spr_boss_death;
myDash = noone;
myDash2 = noone;

reflection_object_setup(0,-1,image_index);
shadow_object_setup(0,-1,-1,global.default_shadow_yscale);

//Audio
audio_emitter = audio_emitter_create();
audio_emitter_falloff(audio_emitter, global.falloffMainDist, global.falloffMainMax, global.falloffMainFactor);
audio_emitter_gain(audio_emitter,global.soundVolume);


//Boss Hack Stuff
isMoveable = false;

if my_gun == noone
{
    my_gun = instance_create_layer(x,y,"Interactive",obj_assaultrifle_boss);
    //my_gun.owner = id;
	owner_add_owned_instance(my_gun);
}

rocketFireBurstMax = 3;
rocketFireBurst = rocketFireBurstMax;
rocketFireBurstRate = 650000;//room_speed*0.65;
rocketFireBurstRateCurrent = rocketFireBurstRate;
rocketTime = 22000000;//room_speed*22;
rocketTimeCurrent = rocketTime-100;

/*
my_gun2 = instance_create_layer(x,y,"Interactive",obj_rocketlauncher_boss);
//my_gun2.owner = id;
owner_add_owned_instance(my_gun2);


/* */
/*  */
