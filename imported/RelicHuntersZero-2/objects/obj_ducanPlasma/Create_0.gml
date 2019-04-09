///Main Attributes
event_inherited();

name = loc_key("WPNAME_DUCAN_PLASMA");
rarity = K_RARITY_DUCAN_PLASMA;
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

object = obj_ducanPlasma;
projectile_obj = obj_projectile_plasma;
shake_amount = 6;

projectile_speed = 0.03;
projectile_speed_decay = -0.15;
projectile_damage = 80;
projectile_range = 600;
projectile_power = 2;
projectile_recoil = 4;
accuracy = 6;
accuracy_aiming = 2;
ammo = 21;
ammo_type = type_heavy;
ammo_cost = 3;
reload_time = 2000000;//room_speed*2;
fire_rate = 250000;//room_speed*0.25;
fire_automatic = false;
fire_burst = 3;
fire_burst_rate = 80000;//room_speed*0.08;
crosshair_recoil = 0.2;

sound = "plasma";
weaponClass = "smg";

joypadRumbleFactor = 0.35;

