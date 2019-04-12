///Setup
event_inherited();

isMeleeWeapon = false;

owner = noone;
name = "I AM ERROR";
object = obj_pistol;
isActive = true;
lineX = x;
lineY = y;

weaponLevel = 0;
storeOriginalDamage = -1;
storeOriginalName = "";

allowPrecision = true;

shake_amount = 0;

ammo_type = type_light;
ammo_cost = 1;
ammo = 999;
ammo_current = ammo;
ammoCostDebuff = false;

ammo_regen_time = global.devPotionRegenTime;
ammo_regen_time_current = 0;
ammo_regen_amount = 1;

reloading = false;
reload_time = 2500000;//room_speed*2.5;
reload_time_current = 0;


fire_automatic = false;
fire_amount = 1;
fire_burst = 1;
fire_burst_current = 0;
fire_burst_rate = 100000;//room_speed*0.1;
fire_burst_rate_current = 0;
fire_rate = 100000;//room_speed*0.1;
fire_rate_current = 0;
can_fire = true;

fireRateDecay = 0;
fireRateDecayRecovery = 0;
fireRateDecayMin = 0;
fireRateDecayMax = 0;
fireRateDecayCurrent = 0;

accuracy = 5;
accuracy_aiming = 0.5;

projectile_obj = obj_projectile_player;
projectile_speed = 0;
projectile_speed_decay = 0;
projectile_damage = 0;
projectile_range = 0;
projectile_power = 5;
projectile_recoil = 4;
projectile_piercing = 0;

projectileBounce = false;
projectileBouceMax = 1;

crosshair_recoil = 0.25;

spawn_distance_from_barrel = 24;

recoil_speed = 0;
recoil_return = 1.25;
recoil_current = 0;
recoil_max = 7;
drawX = x;
drawY = y;
draw_range = 0;

sound = "pistol";

reflection_object_setup(30,-1,image_index);
image_speed = 0;

trigger_pressed = false;
dropCasing = true;

input_held = false;
input_pressed = false;

isPrecisionAiming = false;

weaponClass = "undefined";

goesThroughWalls = false;
beamColor = c_purple;
beamThickness = 2;

joypadRumbleFactor = 0;

grenadeSpriteOverride = spr_grenadeNew;

