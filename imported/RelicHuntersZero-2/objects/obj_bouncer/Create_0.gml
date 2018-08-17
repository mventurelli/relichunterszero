///Main Attributes
event_inherited();

name = loc_key("WPNAME_BOUNCER");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

projectileBounce = true;
projectileBouceMax = 2;

object = obj_bouncer;
shake_amount = 5;
projectile_speed = 25;
projectile_speed_decay = 0.2;
projectile_damage = 16;
projectile_range = 500;
projectile_power = 1;
projectile_recoil = 4;
accuracy = 10;
accuracy_aiming = 3;
ammo = 50;
ammo_type = type_light;
ammo_cost = 1;
reload_time = 3000000;//room_speed*3;
fire_rate = 70000;//room_speed*0.07;
fire_automatic = true;
crosshair_recoil = 0.22;

sound = "smg";
weaponClass = "smg";

joypadRumbleFactor = 0.35;

