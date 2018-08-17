///Main Attributes
event_inherited();

name = loc_key("WPNAME_FLAMETHROWER");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

allowPrecision = false;
dropCasing = false;
object = obj_flamethrower;
shake_amount = 2;
projectile_obj = obj_flame;
projectile_speed = 20;
projectile_speed_decay = 1;
projectile_damage = 6;
projectile_range = 315;
projectile_power = 0;
projectile_recoil = 3;
projectile_piercing = 3;
accuracy = 10;
accuracy_aiming = 10;
ammo = 200;
ammo_type = type_heavy;
ammo_cost = 0.25;
reload_time = 300000;//room_speed*3;
fire_rate = 20000;//room_speed*0.02;
fire_amount = 2;
fire_automatic = true;
crosshair_recoil = 0;

sound = "flamethrower";

joypadRumbleFactor = 0.22;

