///Main Attributes
event_inherited();

isRelicWeapon = true;

name = loc_key("WPNAME_RELIC_CANNON");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

object = obj_relicCannon;
projectile_obj = obj_projectile_flakRelic;

shake_amount = 22;
projectile_speed = 20;
projectile_speed_decay = 0.12;
projectile_damage = 24;
projectile_range = 500;
projectile_power = 0.5;
accuracy = 10;
accuracy_aiming = 3;
ammo = 5;
ammo_type = type_medium;
ammo_cost = 5;
reload_time = 3200000;//room_speed*3.2;
fire_rate = 500000;//room_speed*0.5;
fire_automatic = false;
fire_amount = 1;
crosshair_recoil = 0.1;
sound = "shotgun";
weaponClass = "rocket";

joypadRumbleFactor = 1;

