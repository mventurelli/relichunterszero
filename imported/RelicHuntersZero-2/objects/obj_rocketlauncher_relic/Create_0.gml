///Main Attributes
event_inherited();

isRelicWeapon = true;

name = loc_key("WPNAME_ROCKETLAUNCHER_RELIC");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

object = obj_rocketlauncher_relic;
projectile_obj = obj_rocket_relic;

dropCasing = false;

shake_amount = 12;
projectile_speed = 4;
projectile_speed_decay = -0.5;
projectile_damage = 350;
projectile_range = 1000;
projectile_power = 10;
accuracy = 7;
accuracy_aiming = 2;
ammo = 1;
ammo_cost = 30;
ammo_type = type_heavy;
reload_time = 3000000;//room_speed*3;
fire_rate = 1000000;//room_speed*1;
fire_automatic = false;
fire_burst = 1;
fire_burst_rate = 50000;//room_speed*0.05;
crosshair_recoil = 0.8;

sound = "rocket";
weaponClass = "rocket";

joypadRumbleFactor = 0.8;

