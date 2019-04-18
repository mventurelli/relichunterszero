event_inherited(); 

elite = false;
energy_max = 0;
hp_max = 150;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));

hp_max = round(hp_max * global.healthMultiplier);

ai_supression = 1;

aggro_distance = 400;
aggro_add_patrol = 0.25;
aggro_add_close = 2;
aggro_add_hit = aggro_max;
aggro_cost_attack = 20;
aggro_cost_chase = 1;

fire_range = 800;
if (room == levelHalloween_3) fire_range = 400;

speed_walk = 2.5;
speed_sprint = 3.2;

sprite_hit = spr_zombieTurtle_hit;
sprite_walk = spr_zombieTurtle_walk;
sprite_idle = spr_zombieTurtle_idle;
sprite_dash = spr_zombieTurtle_walk;
sprite_death = spr_zombieTurtle_death;
sprite_death2 = spr_zombieTurtle_death;
sprite_death3 = spr_zombieTurtle_death;
sprite_death_precision = spr_zombieTurtle_precision;

if my_gun == noone
{
    my_gun = instance_create_layer(x,y,"Interactive",obj_reaper_enemy);
    //my_gun.owner = id;
	owner_add_owned_instance(my_gun);
}
drop_gun = obj_pickup_spookyReaper;

grenade_count_max = 0;

coins = global.coins_turtle1;

