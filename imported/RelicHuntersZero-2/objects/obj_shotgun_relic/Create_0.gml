///Main Attributes
event_inherited();

isRelicWeapon = true;

name = loc_key("WPNAME_SHOTGUN_RELIC");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

projectileBounce = true;
projectileBouceMax = 3;

object = obj_shotgun_relic;
shake_amount = 20;
projectile_speed = 22;
projectile_speed_decay = 0.1;
projectile_damage = 18;
projectile_range = 400;
projectile_power = 0.5;
accuracy = 30;
accuracy_aiming = 8;
ammo = 9;
ammo_type = type_medium;
ammo_cost = 3;
reload_time = 3000000;//room_speed*3;
fire_rate = 300000;//room_speed*0.3;
fire_automatic = false;
fire_amount = 12;
crosshair_recoil = 0.1;

sound = "shotgun";
weaponClass = "shotgun";

joypadRumbleFactor = 0.5;

