///Main Variables

event_inherited();

energy_max = 0;

if (instance_exists(obj_rider)){
    hp_max = ceil(obj_rider.hp_max * obj_rider.kamiAllyHp);   
    damage = ceil(obj_rider.melee_damage *  obj_rider.kamiAllyDmg);
}
else {
    hp_max = 42;
hp_max += global.challengeSteroids*(min(hp_max*global.challengeSteroidsMultiplier,global.challengeSteroidsMax));    damage = 18;
}

hp_max = round(hp_max * global.healthMultiplier);

speed_walk = 3.25;
speed_sprint = 3.25;

ai_dash_chance = 5;
ai_dash_cooldown = 2000000;//room_speed*2;

image_xscale = 1.25;
image_yscale = 1.25;

