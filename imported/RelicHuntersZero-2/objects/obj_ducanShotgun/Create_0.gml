///Main Attributes
event_inherited();

name = loc_key("WPNAME_DUCAN_SHOTGUN");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

projectileBounce = true;
projectileBouceMax = 3;

object = obj_ducanShotgun;
shake_amount = 22;
projectile_speed = 50;
projectile_speed_decay = 1;
projectile_damage = 24;
projectile_range = 400;
projectile_power = 2;
accuracy = 18;
accuracy_aiming = 5;
ammo = 12;
ammo_type = type_medium;
ammo_cost = 4;
reload_time = 2000000;//room_speed*2;
fire_rate = 200000;//room_speed*0.2;
fire_automatic = true;
fire_amount = 8;
crosshair_recoil = 0.1;
sound = "shotgun";
weaponClass = "shotgun";

criticalAimMax = 16;
criticalAimThreshold = 5;
criticalAimShot = 3;
criticalAimSpeed = 0.2;

joypadRumbleFactor = 0.42;

