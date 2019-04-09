///Main Attributes
event_inherited();

name = loc_key("WPNAME_BOSSGUN");
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

object = obj_bossGun;
shake_amount = 3;
projectile_speed = 36;
projectile_speed_decay = 0;
projectile_damage = 42;
projectile_range = 1200;
projectile_power = 3;
accuracy = 12;
accuracy_aiming = 8;
ammo = 120;
ammo_cost = 1;
ammo_type = type_heavy;
reload_time = 5000000;//room_speed*5;
fire_rate = 1500000;//room_speed*1.5;
fire_automatic = false;
fire_burst = 30;
fire_burst_rate = 20000;//room_speed*0.02;
crosshair_recoil = 0.02;

criticalAimMax = 16;
criticalAimThreshold = 5;
criticalAimShot = 3;
criticalAimSpeed = 0.2;

sound = "rifle";
//weaponClass = 'rifle';

joypadRumbleFactor = 0.42;

