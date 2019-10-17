///Main Variables

event_inherited();

energy_max = 0;
energy = 0;
hp_max = 1;
damage = 10;

speed_walk = 3;
speed_sprint = 3;

ai_dash_chance = 0;
ai_dash_cooldown = 2000000;//room_speed*2;

image_xscale = 1;
image_yscale = 1;

//Sprites & Death
myRegularScore = round(global.score_kill/2);
myPrecisionScore = round(global.score_headshot/2);
myCoinDropAmount = 0.2;
deathSfx = sfx_precision_kill3;

sprite_hit = spr_worm_idle;
sprite_walk = spr_worm_walk;
sprite_idle = spr_worm_idle;
sprite_dash = spr_worm_walk;
sprite_death = spr_worm_death1;
sprite_death2 = spr_worm_death2;

sprite_precision1 = spr_worm_death1;
sprite_precision2 = spr_worm_death2;
sprite_precision3 = spr_worm_death1;

sprite_dash_fx = spr_worm_walk;
myDash = noone;
myDash2 = noone;

