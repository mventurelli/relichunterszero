event_inherited();

isWormZombie = true;

elite = false;
energy_max = 0;
hp_max = 100;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));

hp_max = round(hp_max * global.healthMultiplier);

damage = 35;

speed_walk = 3;
speed_sprint = 4.5;

myCoinDropAmount = 3;

ai_sprint_distance = 200;

sprite_hit = spr_wormTurtle_hit;
sprite_walk = spr_wormTurtle_walk;
sprite_idle = spr_wormTurtle_idle;
sprite_dash = spr_wormTurtle_walk;
sprite_death = spr_wormTurtle_death;
sprite_death2 = spr_wormTurtle_death;

sprite_precision1 = spr_wormTurtle_death
sprite_precision2 = spr_wormTurtle_death;
sprite_precision3 = spr_wormTurtle_death;

sprite_dash_fx = spr_wormTurtle_walk;
myDash = noone;
myDash2 = noone;

