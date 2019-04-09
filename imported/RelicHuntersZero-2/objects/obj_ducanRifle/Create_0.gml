///Main Attributes
event_inherited();

name = loc_key("WPNAME_DUCAN_RIFLE");
rarity = K_RARITY_DUCAN_RIFLE;
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

object = obj_ducanRifle;
shake_amount = 6;
projectile_speed = 60;
projectile_speed_decay = 0.12;
projectile_damage = 42;
projectile_range = 550;
projectile_power = 1;
accuracy = 4;
accuracy_aiming = 1.6;
ammo = 28;
ammo_cost = 1;
ammo_type = type_heavy;
reload_time = 2500000;//room_speed*2.5;
fire_rate = 150000;//room_speed*0.15;
fire_automatic = true;
crosshair_recoil = 0.4;

criticalAimMax = 16;
criticalAimThreshold = 5;
criticalAimShot = 3;
criticalAimSpeed = 0.2;

sound = "rifle";
weaponClass = "rifle";

joypadRumbleFactor = 0.42;

