event_inherited();

elite = true;
energy_max = 100;
energy_max += global.challengeHighTech*(min( round(energy_max*global.challengeHighTechMultiplier), global.challengeHighTechMax) );
hp_max = 200;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));

aggro_distance = 400;
aggro_add_patrol = 0.5;
aggro_add_close = 2;
aggro_add_hit = aggro_max;
aggro_cost_attack = 10;
aggro_cost_chase = 2;

fire_range = 800;
speed_walk = 2.5;
speed_sprint = 3.2;

ai_dash_chance = 5;
ai_dash_cooldown = 2000000;//room_speed*2;

sprite_hit = spr_duck3_hit;
sprite_walk = spr_duck3_walk;
sprite_idle = spr_duck3_idle;
sprite_dash = spr_duck3_dash;
sprite_death = spr_duck3_death;
sprite_death2 = spr_duck3_death2;
sprite_death3 = spr_duck3_death3;
sprite_death_precision = spr_duck_death_precision;

ai_cover_hp_threshold = hp_max*0.05;
ai_cover_shield_threshold = energy_max*0.6;

if my_gun == noone
{
    my_gun = instance_create_layer(x,y,"Interactive",obj_assaultrifle_enemy);
    //my_gun.owner = id;
	owner_add_owned_instance(my_gun);
}

grenade_count_max = 3;
drop_gun = obj_pickup_assault_rifle;

coins = global.coins_duck3;

