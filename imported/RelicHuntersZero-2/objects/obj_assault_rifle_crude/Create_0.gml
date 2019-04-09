///Main Attributes
event_inherited();

name = loc_key("WPNAME_ASSAULT_RIFLE_CRUDE");
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

object = obj_assault_rifle_crude;
shake_amount = 6;
projectile_speed = 60;
projectile_speed_decay = 0.12;
projectile_damage = 22;
projectile_range = 580;
projectile_power = 1;
accuracy = 6;
accuracy_aiming = 1.4;
ammo = 18;
ammo_cost = 1;
ammo_type = type_heavy;
reload_time = 2500000;//room_speed*2.5;
fire_rate = 350000;//room_speed*0.35;
fire_automatic = false;
fire_burst = 2;
fire_burst_rate = 80000;//room_speed*0.08;
crosshair_recoil = 0.4;

criticalAimMax = 16;
criticalAimThreshold = 5;
criticalAimShot = 3;
criticalAimSpeed = 0.2;

sound = "rifle";
weaponClass = "rifle";

joypadRumbleFactor = 0.42;

