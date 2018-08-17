///Main Attributes
event_inherited();

name = loc_key("WPNAME_KAMILAUNCHER");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

object = obj_kamilauncher;
projectile_obj = obj_kamiRocket;

dropCasing = false;

shake_amount = 10;
projectile_speed = 4;
projectile_speed_decay = -0.5;
projectile_damage = 350;
projectile_range = 1000;
projectile_power = 10;
accuracy = 7;
accuracy_aiming = 2;
ammo = 4;
ammo_cost = 8;
ammo_type = type_heavy;
reload_time = 2500000;//room_speed*2.5;
fire_rate = 350000;//room_speed*0.35;
fire_automatic = false;
fire_burst = 1;
fire_burst_rate = 50000;//room_speed*0.05;
crosshair_recoil = 0.4;

sound = "rocket";
weaponClass = "rocket";

joypadRumbleFactor = 0.4;

