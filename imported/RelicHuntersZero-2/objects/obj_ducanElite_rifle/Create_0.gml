event_inherited();

elite = true;
energy_max = 400;
energy_max += global.challengeHighTech*(min( round(energy_max*global.challengeHighTechMultiplier), global.challengeHighTechMax) );
hp_max = 1100;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));

hp_max = round(hp_max * global.healthMultiplier);

ai_cover_hp_threshold = 1;
ai_cover_shield_threshold = 200;

aggro_distance = 400;
aggro_add_patrol = 0.5;
aggro_add_close = 2;
aggro_add_hit = aggro_max;
aggro_cost_attack = 10;
aggro_cost_chase = 2;

fire_range = 720;
ai_activation_range = 720;
speed_walk = 2.5;
speed_sprint = 3.2;

ai_dash_chance = 6;
ai_dash_cooldown = 1000000;//room_speed*1;

sprite_hit = spr_ducanElite_hit;
sprite_walk = spr_ducanElite_walk;
sprite_idle = spr_ducanElite_idle;
sprite_dash = spr_ducanElite_dash;
sprite_death = spr_ducanElite_death;
sprite_death2 = spr_ducanElite_death2;
sprite_death3 = spr_ducanElite_death3;
sprite_death_precision = spr_duck_death_precision;


if my_gun == noone
{
    my_gun = instance_create_layer(x,y,"Interactive",obj_ducanRifle_enemy);
    //my_gun.owner = id;
	owner_add_owned_instance(my_gun);
}

grenade_count_max = 6;
drop_gun = obj_pickup_assault_rifle;

coins = global.coins_duck3;

