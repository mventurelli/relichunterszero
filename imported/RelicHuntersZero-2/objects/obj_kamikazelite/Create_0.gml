///Creation
event_inherited();

energy_max = 0;
hp_max = 100;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));
damage = 30;

hp_max = round(hp_max * global.healthMultiplier);

speed_walk = 3.25;
speed_sprint = 3.25;

aggro_add_patrol = 1;
ai_dash_chance = 9;
ai_dash_cooldown = 1000000;//room_speed*1;

push_friction = 1.2;
image_xscale = 1.25;
image_yscale = 1.25;



