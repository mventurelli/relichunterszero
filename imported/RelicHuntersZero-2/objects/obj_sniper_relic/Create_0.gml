///Main Attributes
event_inherited();

isRelicWeapon = true;

name = loc_key("WPNAME_SNIPER_RELIC");
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

goesThroughWalls = false;

object = obj_sniper_relic;
shake_amount = 40;

projectile_speed = 55;
projectile_speed_decay = 0;
projectile_damage = 230;
projectile_range = 1200;
projectile_power = 12;
projectile_recoil = 5;
projectile_piercing = 5;

accuracy = 20;
accuracy_aiming = 1.1; //0.25
ammo = 2;
ammo_type = type_heavy;
ammo_cost = 8;
reload_time = 1500000;//room_speed*1.5;
fire_rate = 500000;//room_speed*0.5;
fire_automatic = false;
crosshair_recoil = 1.2;

sound = "sniper";
weaponClass = "sniper";

joypadRumbleFactor = 1;

