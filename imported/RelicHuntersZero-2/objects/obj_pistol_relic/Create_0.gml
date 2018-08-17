///Main Attributes
event_inherited();

isRelicWeapon = true;

name = loc_key("WPNAME_PISTOL_RELIC");
gui_info_weapon_create(instance_nearest(x,y,class_player),c_white,name);

sound = "pistol";
object = obj_pistol_relic;
shake_amount = 9;
projectile_speed = 60;
projectile_speed_decay = 0.5;
projectile_damage = 24;
projectile_range = 550;
projectile_power = 1;
projectile_recoil = 4;
accuracy = 8;
accuracy_aiming = 1.5;
ammo = 24;
ammo_type = type_light;
reload_time = 1500000;//room_speed*1.5;
fire_rate = 120000;//room_speed*0.12;

fire_automatic = false;

fire_burst = 2;
fire_burst_rate = 60000;//room_speed*0.06;

crosshair_recoil = 0.12;

joypadRumbleFactor = 0.6;

