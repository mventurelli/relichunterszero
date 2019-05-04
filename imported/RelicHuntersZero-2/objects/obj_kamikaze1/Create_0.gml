///Main Variables

event_inherited();

energy_max = 0;
hp_max = 72;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));

hp_max = round(hp_max * global.healthMultiplier);

damage = 12;

speed_walk = 4.5;
speed_sprint = 4.5;

ai_dash_chance = 5;
ai_dash_cooldown = 2000000;//room_speed*2;

image_xscale = 1.25;
image_yscale = 1.25;

