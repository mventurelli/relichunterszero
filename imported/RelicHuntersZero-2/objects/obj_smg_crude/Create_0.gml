///Main Attributes
event_inherited();

name = loc_key("WPNAME_SUBMACHINEGUN_CRUDE");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

object = obj_smg_crude;
shake_amount = 4;
projectile_speed = 42;
projectile_speed_decay = 0.3;
projectile_damage = 14;
projectile_range = 450;
projectile_power = 1;
projectile_recoil = 4;
accuracy = 10;
accuracy_aiming = 3;
ammo = 20;
ammo_type = type_light;
ammo_cost = 1;
reload_time = 1300000;//room_speed*1.3;
fire_rate = 150000;//room_speed*0.15;
fire_automatic = true;
crosshair_recoil = 0.2;

sound = "smg";
weaponClass = "smg";

joypadRumbleFactor = 0.35;

