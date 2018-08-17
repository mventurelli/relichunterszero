///Main Attributes
event_inherited();

name = loc_key("WPNAME_SNIPER_GHOST");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

goesThroughWalls = true;
projectile_obj = obj_projectile_skull;

object = obj_sniper_ghost;
shake_amount = 40;

projectile_speed = 55;
projectile_speed_decay = 0;
projectile_damage = 270;
projectile_range = 1200;
projectile_power = 12;
projectile_recoil = 5;
projectile_piercing = 3;

accuracy = 20;
accuracy_aiming = 1.1;
ammo = 1;
ammo_type = type_heavy;
ammo_cost = 14;
reload_time = 2000000;//room_speed*2;
fire_rate = 500000;//room_speed*0.5;
fire_automatic = false;
crosshair_recoil = 1.2;

sound = "sniper";
weaponClass = "sniper";

joypadRumbleFactor = 1;

