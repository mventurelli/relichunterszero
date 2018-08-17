///Main Attributes
event_inherited();

name = loc_key("WPNAME_SNIPERRIFLE");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

object = obj_sniper_rifle;
shake_amount = 42;

projectile_speed = 52;
projectile_speed_decay = 0;
projectile_damage = 150;
projectile_range = 800;
projectile_power = 8;
projectile_recoil = 5;
projectile_piercing = 2;

accuracy = 20;
accuracy_aiming = 1.1; //0.25
ammo = 3;
ammo_type = type_heavy;
ammo_cost = 9;
reload_time = 3000000;//room_speed*3;
fire_rate = 500000;//room_speed*0.5;
fire_automatic = false;
crosshair_recoil = 1.2;

sound = "sniper";
weaponClass = "sniper";

joypadRumbleFactor = 1;

