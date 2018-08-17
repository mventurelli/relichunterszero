///Gun Attributes

event_inherited();

name = loc_key("WPNAME_SAWEDOFF");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

object = obj_sawedoff;
shake_amount = 22;
projectile_speed = 45;
projectile_speed_decay = 1;
projectile_damage = 24;
projectile_range = 200;
projectile_power = 0.5;
accuracy = 20;
accuracy_aiming = 20;
ammo = 2;
ammo_type = type_medium;
ammo_cost = 4;
reload_time = 2000000;//room_speed*2;
fire_rate = 100000;//room_speed*0.1;
fire_automatic = false;
fire_amount = 9;
crosshair_recoil = 0.1;
sound = "shotgun";
weaponClass = "shotgun";
joypadRumbleFactor = 1;


