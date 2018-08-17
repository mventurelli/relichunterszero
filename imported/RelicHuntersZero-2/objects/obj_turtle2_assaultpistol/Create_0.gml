event_inherited();

elite = false;
energy_max = 0;
hp_max = 120;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));

aggro_distance = 400;
aggro_add_patrol = 0.5;
aggro_add_close = 2;
aggro_add_hit = aggro_max;
aggro_cost_attack = 20;
aggro_cost_chase = 1;

fire_range = 550;

speed_walk = 2.5;
speed_sprint = 3.2;

sprite_hit = spr_turtle2_hit;
sprite_walk = spr_turtle2_walk;
sprite_idle = spr_turtle2_idle;
sprite_dash = spr_turtle2_walk;
sprite_death = spr_turtle2_death1;
sprite_death2 = spr_turtle2_death2;
sprite_death3 = spr_turtle2_death3;
sprite_death_precision = spr_turtle2_precision;

if my_gun == noone
{
    my_gun = instance_create_layer(x,y,"Interactive",obj_assaultpistol_enemy);
    //my_gun.owner = id;
	owner_add_owned_instance(my_gun);
}
drop_gun = obj_pickup_pistol_assault;

grenade_count_max = 0;

coins = global.coins_turtle2;


