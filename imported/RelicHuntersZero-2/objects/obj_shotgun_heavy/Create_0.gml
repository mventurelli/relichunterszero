///Main Attributes
event_inherited();

name = loc_key("WPNAME_SHOTGUN_HEAVY");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

object = obj_shotgun_heavy;
shake_amount = 22;
projectile_speed = 50;
projectile_speed_decay = 1;
projectile_damage = 20;
projectile_range = 315;
projectile_power = 1;
accuracy = 20;
accuracy_aiming = 10;
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

joypadRumbleFactor = 1;

