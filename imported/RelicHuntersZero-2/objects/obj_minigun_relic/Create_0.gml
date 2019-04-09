///Main Attributes
event_inherited();

isRelicWeapon = true;
rarity = K_RARITY_MINIGUN_RELIC;
name = loc_key("WPNAME_MINIGUN_RELIC");
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

projectileBounce = true;
projectileBouceMax = 3;

object = obj_minigun_relic;
shake_amount = 5;
projectile_speed = 50;
projectile_speed_decay = 0.3;
projectile_damage = 19;
projectile_range = 450;
projectile_power = 0.7;
projectile_recoil = 3;
accuracy = 12;
accuracy_aiming = 8;
ammo = 200;
ammo_type = type_light;
ammo_cost = 0.5;
reload_time = 4200000;//room_speed*4.2;
fire_rate = 300000;//room_speed*0.3;
fire_automatic = true;

fireRateDecay = -20000;//-2;
fireRateDecayRecovery = 2000;//0.2;
fireRateDecayMin = -250000;//-room_speed*0.25;
fireRateDecayMax = 0;

crosshair_recoil = 0.1;

sound = "smg";
weaponClass = "rocket";

joypadRumbleFactor = 0.3;

