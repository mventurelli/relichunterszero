event_inherited();
elite = true;
energy_max = 100;
energy_max += global.challengeHighTech*(min( round(energy_max*global.challengeHighTechMultiplier), global.challengeHighTechMax) );
hp_max = 100;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));

hp_max = round(hp_max * global.healthMultiplier);

aggro_distance = 400;
aggro_add_patrol = 0.5;
aggro_add_close = 2;
aggro_add_hit = aggro_max;
aggro_cost_attack = 10;
aggro_cost_chase = 2;

fire_range = 550;
speed_walk = 2.5;
speed_sprint = 3.2;

ai_dash_chance = 2.5;
ai_dash_cooldown = 5000000;//room_speed*5;

ai_cover_hp_threshold = hp_max*0.35;

sprite_hit = spr_duck_hit;
sprite_walk = spr_duck_walk;
sprite_idle = spr_duck_idle;
sprite_dash = spr_duck_dash;
sprite_death = spr_duck_death;
sprite_death2 = spr_duck_death2;
sprite_death3 = spr_duck_death3;
sprite_death_precision = spr_duck_death_precision;

if my_gun == noone
{
    my_gun = instance_create_layer(x,y,"Interactive",obj_submachinegun_enemy);
    //my_gun.owner = id;
	owner_add_owned_instance(my_gun);
}

grenade_count_max = 1;
drop_gun = obj_pickup_submachinegun;

coins = global.coins_duck1;

