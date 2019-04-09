///Main Attributes
event_inherited();

name = loc_key("WPNAME_PISTOLPLASMA");
rarity = K_RARITY_PISTOL_PLASMA;
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

object = obj_pistol_plasma;
projectile_obj = obj_projectile_plasma;
shake_amount = 15;

projectile_speed = 0.02;
projectile_speed_decay = -0.1;
projectile_damage = 80;
projectile_range = 1000;
projectile_power = 5;
projectile_recoil = 4;
projectile_piercing = 0;

accuracy = 4;
accuracy_aiming = 2;
ammo = 9;
ammo_type = type_heavy;
ammo_cost = 4;
reload_time = 3000000;//room_speed*3;
fire_rate = 220000;//room_speed*0.22;
fire_automatic = false;
crosshair_recoil = 0.7;

sound = "plasma";
weaponClass = "pistol";

joypadRumbleFactor = 0.6;

