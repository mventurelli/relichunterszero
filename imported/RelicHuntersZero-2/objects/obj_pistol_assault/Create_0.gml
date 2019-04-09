///Main Attributes
event_inherited();

name = loc_key("WPNAME_PISTOLASSAULT");
rarity = K_RARITY_PISTOL_ASSAULT;
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

sound = "pistol";
object = obj_pistol_assault;
shake_amount = 5;
projectile_speed = 45;
projectile_speed_decay = 0.4;
projectile_damage = 16;
projectile_range = 450;
projectile_power = 1.5;
projectile_recoil = 4;
accuracy = 7;
accuracy_aiming = 2;
ammo = 21;
ammo_type = type_light;
ammo_cost = 1;
reload_time = 1500000;//room_speed*1.5;
fire_rate = 250000;//room_speed*0.25;
fire_automatic = false;
fire_burst = 3;
fire_burst_rate = 80000;//room_speed*0.08;
crosshair_recoil = 0.2;

weaponClass = "pistol";

joypadRumbleFactor = 0.6;

