///Main Attributes
event_inherited();

name = loc_key("WPNAME_MACHINEGUN");
rarity = K_RARITY_MACHINEGUN;
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

object = obj_machinegun;
shake_amount = 6;
projectile_speed = 60;
projectile_speed_decay = 0.3;
projectile_damage = 18;
projectile_range = 500;
projectile_power = 2;
projectile_recoil = 4;
accuracy = 12;
accuracy_aiming = 4;
ammo = 60;
ammo_cost = 1;
ammo_type = type_heavy;
reload_time = 3000000;//room_speed*3;
fire_rate = 100000;//room_speed*0.1;
fire_automatic = true;
crosshair_recoil = 0.3;

sound = "machinegun";
weaponClass = "machinegun";

joypadRumbleFactor = 0.55;

