///Main Attributes
event_inherited();

name = loc_key("WPNAME_SMG_BLAST");
rarity = K_RARITY_SMG_BLAST;
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

sound = "plasma";
object = obj_smg_blast;
projectile_obj = obj_projectile_blast;
shake_amount = 8;
projectile_speed = 45;
projectile_speed_decay = 0.4;
projectile_damage = 7;
projectile_range = 500;
projectile_power = 2;
projectile_recoil = 4;
accuracy = 9;
accuracy_aiming = 2;
ammo = 24;
ammo_type = type_heavy;
reload_time = 1300000;
fire_rate = 150000;
fire_automatic = true;
crosshair_recoil = 0.2;

weaponClass = "smg";
joypadRumbleFactor = 0.35;

