///Main Attributes
event_inherited();

isRelicWeapon = true;

name = loc_key("WPNAME_SUBMACHINEGUN_RELIC");
rarity = K_RARITY_SMG_RELIC;
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

object = obj_smg_relic;
shake_amount = 4;
projectile_speed = 50;
projectile_speed_decay = 0.4;
projectile_damage = 22;
projectile_range = 500;
projectile_power = 1;
projectile_recoil = 4;
accuracy = 11;
accuracy_aiming = 5;
ammo = 50;
ammo_type = type_light;
ammo_cost = 0.5;
//reload_time = 1300000;//room_speed*1.3;
//fire_rate = 150000;//room_speed*0.15;
reload_time = 1300000;//room_speed*1.3;
fire_rate = 60000;//room_speed*0.06;
fire_automatic = true;
crosshair_recoil = 0.2;

sound = "smg";
weaponClass = "smg";

joypadRumbleFactor = 0.35;

