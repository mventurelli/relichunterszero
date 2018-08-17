///Main Attributes
event_inherited();

name = loc_key("WPNAME_SPOOKY_REAPER");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

sound = "reaper";
object = obj_spookyReaper;
projectile_obj = obj_projectile_skull;

goesThroughWalls = true;

shake_amount = 0.1;
projectile_speed = 1;
projectile_speed_decay = -0.5;
projectile_damage = 16;
projectile_range = 500;
projectile_piercing = 3;
projectile_power = 2;
projectile_recoil = 4;
accuracy = 20;
accuracy_aiming = 12;
ammo = 32;
ammo_cost = 0.5;
ammo_type = type_medium;
reload_time = 1000000;//room_speed*1;
fire_rate = 500000;//room_speed*0.5;

fire_amount = 1;

fire_burst = 20;
fire_burst_rate = 15000;//room_speed*0.015;
fire_automatic = false;
crosshair_recoil = 0.02;

joypadRumbleFactor = 0.1;

weaponClass = "shotgun";

