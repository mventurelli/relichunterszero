event_inherited();

elite = false;
energy_max = 0;
energy = 0;
hp_max = 60;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));

hp_max = round(hp_max * global.healthMultiplier);

damage = 25;

speed_walk = 2;
speed_sprint = 3.5;

myCoinDropAmount = 1;

ai_sprint_distance = 240;

reviveChance = 0.5;

