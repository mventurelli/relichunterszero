///Main Attributes
event_inherited();

name = loc_key("WPNAME_ASSAULT_RIFLE");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

object = obj_assault_rifle;
shake_amount = 6;
projectile_speed = 60;
projectile_speed_decay = 0.12;
projectile_damage = 24;
projectile_range = 600;
projectile_power = 1;
accuracy = 5;
accuracy_aiming = 1.1;
ammo = 30;
ammo_cost = 1;
ammo_type = type_heavy;
reload_time = 2500000;//room_speed*2.5;
fire_rate = 350000;//room_speed*0.35;
fire_automatic = false;
fire_burst = 3;
fire_burst_rate = 80000;//room_speed*0.08;
crosshair_recoil = 0.4;

criticalAimMax = 16;
criticalAimThreshold = 5;
criticalAimShot = 3;
criticalAimSpeed = 0.2;

sound = "rifle";
weaponClass = "rifle";

joypadRumbleFactor = 0.42;

