///Main Attributes
event_inherited();

name = loc_key("WPNAME_RIFLE_BLAST");
rarity = K_RARITY_RIFLE_BLAST;
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

sound = "plasma";
object = obj_rifle_blast;
projectile_obj = obj_projectile_blast;
shake_amount = 6;
projectile_speed = 60;
projectile_speed_decay = 0.12;
projectile_damage = 24;
projectile_range = 600;
projectile_power = 1;
accuracy = 5;
accuracy_aiming = 1.1;
ammo = 21;
ammo_cost = 1;
ammo_type = type_heavy;
reload_time = 2500000;
fire_rate = 350000;
fire_automatic = false;
fire_burst = 3;
fire_burst_rate = 80000;
crosshair_recoil = 0.4;

fire_automatic = false;
crosshair_recoil = 0.4;

weaponClass = "rifle";
joypadRumbleFactor = 0.42;

