///Main Attributes
event_inherited();

name = loc_key("WPNAME_PISTOL_BLAST");
rarity = K_RARITY_PISTOL_BLAST;
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

sound = "plasma";
object = obj_pistol_blast;
projectile_obj = obj_projectile_blast;
shake_amount = 8;
projectile_speed = 45;
projectile_speed_decay = 0.4;
projectile_damage = 8;
projectile_range = 500;
projectile_power = 2;
projectile_recoil = 4;
accuracy = 5;
accuracy_aiming = 1;
ammo = 10;
ammo_type = type_heavy;
reload_time = 1900000;//room_speed*1.9;
fire_rate = 220000;//room_speed*0.22;

fire_automatic = false;
crosshair_recoil = 0.4;

weaponClass = "pistol";
joypadRumbleFactor = 0.6;

