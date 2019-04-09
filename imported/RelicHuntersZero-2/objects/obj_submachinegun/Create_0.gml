///Main Attributes
event_inherited();

name = loc_key("WPNAME_SUBMACHINEGUN");
rarity = K_RARITY_SUBMACHINEGUN;
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

object = obj_submachinegun;
shake_amount = 4;
projectile_speed = 42;
projectile_speed_decay = 0.3;
projectile_damage = 14;
projectile_range = 450;
projectile_power = 1;
projectile_recoil = 4;
accuracy = 10;
accuracy_aiming = 3;
ammo = 25;
ammo_type = type_light;
ammo_cost = 1;
reload_time = 1300000;//room_speed*1.3;
fire_rate = 60000;//room_speed*0.06;
fire_automatic = true;
crosshair_recoil = 0.2;

sound = "smg";
weaponClass = "smg";

joypadRumbleFactor = 0.35;

