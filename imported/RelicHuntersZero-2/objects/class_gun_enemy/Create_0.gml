///Main Shit
event_inherited();

owner = noone;
sound = "pistol";
ammo_type = type_light;
is_sniper = false;
drawLaserSight = false;
laserLineX = 0;
laserLineY = 0;
laserDrawRange = 0;

fire_amount = 1;
fire_burst = 1;
fire_burst_current = 0;
fire_burst_rate = 100000;//room_speed*0.1;
fire_burst_rate_current = 0;
fire_rate = 100000;//room_speed*0.1;
fire_rate_current = 0;
can_fire = false;

accuracy = 5;

is_rocket = false;

projectile_obj = obj_projectile_enemy;
projectile_speed = 0;
projectile_speed_decay = 0;
projectile_damage = 0;
projectile_range = 0;
projectile_power = 5;

spawn_distance_from_barrel = 24;

recoil_speed = 0;
recoil_return = 1.25;
recoil_current = 0;
recoil_max = 7;
drawX = x;
drawY = y;

reflection_object_setup(30,-1,image_index);
image_speed = 0;

shoot_direction = 0;

