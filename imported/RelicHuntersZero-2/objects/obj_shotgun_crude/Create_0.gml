///Main Attributes
event_inherited();

name = loc_key("WPNAME_SHOTGUN_CRUDE");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

object = obj_shotgun_crude;
shake_amount = 22;
projectile_speed = 40;
projectile_speed_decay = 1.1;
projectile_damage = 14;
projectile_range = 300;
projectile_power = 0.7;
accuracy = 24;
accuracy_aiming = 17;
ammo = 3;
ammo_type = type_medium;
ammo_cost = 4;
reload_time = 3000000;//room_speed*3;
fire_rate = 700000;//room_speed*0.7;
fire_automatic = false;
fire_amount = 9;
crosshair_recoil = 0.1;
sound = "shotgun";
weaponClass = "shotgun";

joypadRumbleFactor = 1;

