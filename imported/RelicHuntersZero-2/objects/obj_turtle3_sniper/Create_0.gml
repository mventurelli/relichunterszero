event_inherited();

audio_emitter_falloff(audio_emitter, 1000, 2200, 1);

elite = false;
energy_max = 0;
hp_max = 120;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));

ai_activation_range = 1000;
ai_supression = true;
aggro_distance = 1000;
aggro_add_patrol = 0.2;
aggro_add_close = 2;
aggro_add_hit = aggro_max;
aggro_cost_attack = 150;
aggro_cost_chase = 0.5;

fire_range = 850;

speed_walk = 2.5;
speed_sprint = 3.2;

sprite_hit = spr_turtle3_hit;
sprite_walk = spr_turtle3_walk;
sprite_idle = spr_turtle3_idle;
sprite_dash = spr_turtle3_walk;
sprite_death = spr_turtle3_death;
sprite_death2 = spr_turtle3_death2;
sprite_death3 = spr_turtle3_death3;
sprite_death_precision = spr_turtle3_precision;

if my_gun == noone
{
    my_gun = instance_create_layer(x,y,"Interactive",obj_sniperrifle_enemy);
	owner_add_owned_instance(my_gun);
}
drop_gun = obj_pickup_sniper_rifle;

grenade_count_max = 0;

coins = global.coins_turtle3;


