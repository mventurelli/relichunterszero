///Main Attributes
event_inherited();

name = "BLITZ";
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

object = obj_blitz;
shake_amount = 9;
projectile_speed = 48;
projectile_speed_decay = 0.16;
projectile_damage = 32;
projectile_range = 410;
projectile_power = 2;
accuracy = 10;
accuracy_aiming = 2;
ammo = 21;
ammo_cost = 1;
ammo_type = type_medium;
reload_time = 2500000;//room_speed*2.5;
fire_rate = 400000;//room_speed*0.4;
fire_automatic = true;
fire_burst = 3;
fire_burst_rate = 100000;//room_speed*0.1;
crosshair_recoil = 0.5;

criticalAimMax = 16;
criticalAimThreshold = 5;
criticalAimShot = 3;
criticalAimSpeed = 0.2;

sound = "rifle";
weaponClass = "heavy";

joypadRumbleFactor = 0.42;

