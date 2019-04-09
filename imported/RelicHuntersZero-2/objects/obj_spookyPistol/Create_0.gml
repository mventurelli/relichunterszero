///Main Attributes
event_inherited();

name = loc_key("WPNAME_SPOOKY_PISTOL");
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

sound = "plasma";
object = obj_spookyPistol;
projectile_obj = obj_projectile_skull;

goesThroughWalls = true;

shake_amount = 9;
projectile_speed = 4;
projectile_speed_decay = -0.6;
projectile_damage = 36;
projectile_range = 550;
projectile_piercing = 3;
projectile_power = 2;
projectile_recoil = 4;
accuracy = 4;
accuracy_aiming = 2;
ammo = 6;
ammo_cost = 2;
ammo_type = type_light;
reload_time = 1000000;//room_speed*1;
fire_rate = 100000;//room_speed*0.1;

fire_automatic = false;
crosshair_recoil = 0.45;

joypadRumbleFactor = 0.6;

