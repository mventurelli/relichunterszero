///Init
event_inherited();
drop_gun_chance = 0;

fire_range = 500;

elite = false;
energy_max = 0;
hp_max = 50;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));

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
    my_gun = instance_create_layer(x,y,"Interactive",obj_pistol_enemy);
    //my_gun.owner = id;
	owner_add_owned_instance(my_gun);
}
drop_gun = obj_pickup_pistol;

grenade_count_max = 0;

coins = global.coins_turtle1;



