///Main Attributes
event_inherited();

name = loc_key("WPNAME_SHOTGUN");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

object = obj_shotgun;
shake_amount = 22;
projectile_speed = 45;
projectile_speed_decay = 1;
projectile_damage = 18;
projectile_range = 315;
projectile_power = 1;
accuracy = 20;
accuracy_aiming = 10;
ammo = 5;
ammo_type = type_medium;
ammo_cost = 4;
reload_time = 3000000;//room_speed*3;
fire_rate = 500000;//room_speed*0.5;
fire_automatic = false;
fire_amount = 9;
crosshair_recoil = 0.1;
sound = "shotgun";
weaponClass = "shotgun";

joypadRumbleFactor = 1;

