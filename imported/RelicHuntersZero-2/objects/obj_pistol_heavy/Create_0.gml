///Main Attributes
event_inherited();

name = loc_key("WPNAME_PISTOLHEAVY");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

object = obj_pistol_heavy;
shake_amount = 12;

projectile_speed = 46;
projectile_speed_decay = 0.2;
projectile_damage = 45;
projectile_range = 550;
projectile_power = 5;
projectile_recoil = 3;
projectile_piercing = 1;

accuracy = 9;
accuracy_aiming = 1.1; //0.5
ammo = 8;
ammo_type = type_medium;
ammo_cost = 3;
reload_time = 3000000;//room_speed*3;
fire_rate = 300000;//room_speed*0.3;
fire_automatic = false;
crosshair_recoil = 0.5;

sound = "machinegun";
weaponClass = "pistol";
joypadRumbleFactor = 0.55;

