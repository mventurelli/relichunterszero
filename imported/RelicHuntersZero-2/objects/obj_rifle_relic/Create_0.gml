///Main Attributes
event_inherited();

isRelicWeapon = true;

name = loc_key("WPNAME_RIFLE_RELIC");
rarity = K_RARITY_RIFLE_RELIC;
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

object = obj_rifle_relic;
shake_amount = 10;
projectile_speed = 60;
projectile_speed_decay = 0.12;
projectile_damage = 40;
projectile_range = 800;
projectile_power = 1.2;
accuracy = 5;
accuracy_aiming = 1.1;
ammo = 28;
ammo_cost = 1;
ammo_type = type_heavy;
reload_time = 2500000;//room_speed*2.5;
fire_rate = 150000;//room_speed*0.15;
fire_automatic = false;
fire_burst = 1;
crosshair_recoil = 0.3;

criticalAimMax = 16;
criticalAimThreshold = 5;
criticalAimShot = 3;
criticalAimSpeed = 0.2;

sound = "rifle";
weaponClass = "rifle";

joypadRumbleFactor = 0.42;

