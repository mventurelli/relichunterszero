event_inherited();

elite = false;
energy_max = 0;
hp_max = 120;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));

hp_max = round(hp_max * global.healthMultiplier);

aggro_distance = 300;
aggro_add_patrol = 0.5;
aggro_add_close = 2;
aggro_add_hit = aggro_max;
aggro_cost_attack = 100;
aggro_cost_chase = 0.5;

fire_range = 250;

speed_walk = 3;
speed_sprint = 3.2;

sprite_hit = spr_turtle_hit;
sprite_walk = spr_turtle_walk;
sprite_idle = spr_turtle_idle;
sprite_dash = spr_turtle_walk;
sprite_death = spr_turtle_death;
sprite_death2 = spr_turtle_death2;
sprite_death3 = spr_turtle_death3;
sprite_death_precision = spr_turtle_precision;

if my_gun == noone
{
    my_gun = instance_create_layer(x,y,"Interactive",obj_shotgun_enemy);
    //my_gun.owner = id;
	owner_add_owned_instance(my_gun);
}
drop_gun = obj_pickup_shotgun;

grenade_count_max = 0;

coins = global.coins_turtle1;

