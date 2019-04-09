///Main Attributes
event_inherited();

name = loc_key("WPNAME_FLAKCANNON");
rarity = K_RARITY_FLAKCANNON;
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

object = obj_flakCannon;
projectile_obj = obj_projectile_flak;

shake_amount = 22;
projectile_speed = 20;
projectile_speed_decay = 0.3;
projectile_damage = 18;
projectile_range = 500;
projectile_power = 0.5;
accuracy = 10;
accuracy_aiming = 3;
ammo = 4;
ammo_type = type_medium;
ammo_cost = 5;
reload_time = 3000000;//room_speed*3;
fire_rate = 500000;//room_speed*0.5;
fire_automatic = false;
fire_amount = 1;
crosshair_recoil = 0.1;
sound = "shotgun";
weaponClass = "rocket";

joypadRumbleFactor = 1;

