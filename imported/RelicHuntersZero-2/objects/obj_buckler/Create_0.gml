///Setup + Special Shield Object
event_inherited();

name = loc_key("WPNAME_BUCKLER");
owner = noone;
isActive = true;
object = obj_buckler;

isMeleeWeapon = false;

weaponLevel = 0;
storeOriginalDamage = -1;
storeOriginalName = "";

myShieldObject = instance_create_layer(x,y,"Interactive",obj_shield_biu);
owner_add_owned_instance(myShieldObject);

shake_amount = 0;

ammo_type = type_light;
ammo_cost = 1;
ammo = 0;
ammo_current = ammo;
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

accuracy = 5;
accuracy_aiming = 0.5;

projectile_speed = 0;
projectile_speed_decay = 0;
projectile_damage = 0;
projectile_range = 0;
projectile_power = 5;
projectile_recoil = 4;
projectile_piercing = 0;

crosshair_recoil = 0.25;

spawn_distance_from_barrel = 24;

recoil_speed = 0;
recoil_return = 1.25;
recoil_current = 0;
recoil_max = 7;
drawX = x;
drawY = y;

reflection_object_setup(0,-1,image_index);

