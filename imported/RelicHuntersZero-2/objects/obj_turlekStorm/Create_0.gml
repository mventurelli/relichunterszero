event_inherited();

mySpawnX = x;
mySpawnY = y;

elite = true;
isBoss = true;

var baseHp = 4000;
var baseEnergy = 300;

if (room == level_storm_2)
{
	baseHp = 16000;
	baseEnergy = 400;
}
else if (room == level_storm_3)
{
	baseHp = 30000;
	baseEnergy = 600;
}
else if (room == level_storm_4)
{
	baseHp = 40000;
	baseEnergy = 700;
}

energy_max = baseEnergy;
energy_max += global.challengeHighTech*(min( round(energy_max*global.challengeHighTechMultiplier), global.challengeHighTechMax) );
hp_max = baseHp;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));

ai_cover_hp_threshold = 1;
ai_cover_shield_threshold = 200;

aggro_distance = 280;
aggro_add_patrol = 0.5;
aggro_add_close = 2;
aggro_add_hit = aggro_max;
aggro_cost_attack = 10;
aggro_cost_chase = 2;

fire_range = 720;
ai_activation_range = 720;
speed_walk = 2.5;
speed_sprint = 3.2;

ai_dash_chance = 0;
ai_dash_cooldown = 1000000;//room_speed*1;

sprite_hit = spr_turtle3Boss_hit;
sprite_walk = spr_turtle3Boss_walk;
sprite_idle = spr_turtle3Boss_idle;
sprite_dash = noone;
sprite_death = spr_turtle3Boss_death;
sprite_death2 = spr_turtle3Boss_death2;
sprite_death3 = spr_turtle3Boss_death3;
sprite_death_precision = spr_turtle3Boss_precision;


if my_gun == noone
{
    my_gun = instance_create_layer(x,y,"Interactive",obj_shotgun_boss);
	owner_add_owned_instance(my_gun);
}

grenade_count_max = 6;
drop_gun = obj_pickup_assault_rifle;

coins = global.coins_duck3;