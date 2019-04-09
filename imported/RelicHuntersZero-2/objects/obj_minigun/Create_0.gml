///Main Attributes
event_inherited();

name = loc_key("WPNAME_MINIGUN");
rarity = K_RARITY_MINIGUN;
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

object = obj_minigun;
shake_amount = 5;
projectile_speed = 50;
projectile_speed_decay = 0.3;
projectile_damage = 14;
projectile_range = 450;
projectile_power = 0.7;
projectile_recoil = 3;
accuracy = 10;
accuracy_aiming = 6;
ammo = 200;
ammo_type = type_light;
ammo_cost = 0.5;
reload_time = 4200000;

fire_rate = 300000;
fire_automatic = true;

fireRateDecay = -20000;
fireRateDecayRecovery = 2000;
fireRateDecayMin = -250000;
fireRateDecayMax = 0;

crosshair_recoil = 0.1;

sound = "smg";
weaponClass = "rocket";

joypadRumbleFactor = 0.3;

