///Main Attributes
event_inherited();

name = loc_key("WPNAME_SPOOKY_BEAMER");
rarityColor = rarity_get_color(rarity);
gui_info_weapon_create(instance_nearest(x,y,class_player),rarityColor,name);

sound = "no projectile sound";
object = obj_spookyBeamer;
projectile_obj = obj_projectile_beam;
beamColor = c_purple;
beamThickness = 4;
dropCasing = false;

goesThroughWalls = false;

shake_amount = 0.5;
projectile_speed = 64;
projectile_speed_decay = 0;
projectile_damage = 18;
projectile_range = 500;
projectile_piercing = 0;
projectile_power = 0.5;
projectile_recoil = 1;
accuracy = 1;
accuracy_aiming = 1;
ammo = 200;
ammo_cost = 0.5;
ammo_type = type_heavy;
reload_time = 2500000;//room_speed*2.5;
fire_rate = 100000;//room_speed*0.1;

fire_amount = 1;

fire_automatic = true;
crosshair_recoil = 0.001;

joypadRumbleFactor = 0.1;

weaponClass = "rocket";

//Mega Beam Charge
megaBeam = false;
megaBeamTime = 1600000;//room_speed*1.6;
megaBeamTimeCurrent = 0;
megaBeamThickness = 20;
megaBeamDamageMultiplier = 2;
oldThickness = beamThickness;
oldDamage = projectile_damage;

