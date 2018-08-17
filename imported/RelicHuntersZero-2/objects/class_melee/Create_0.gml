///Setup
event_inherited();

isMeleeWeapon = true;

damage = 0;
meleeDamage = 160;
meleeStepSpeed = 25;
maxHits = 5;
pushPower = 15;

name = loc_key("WPNAME_GLOVES");
owner = noone;
isActive = true;
object = obj_gloves;

weaponLevel = 0;
storeOriginalDamage = -1;
storeOriginalName = "";

ammo_type = type_light;
ammo_cost = 1;
ammo = 0;
ammo_current = ammo;

animationIdle = spr_gloves_idle;
animationWalk = spr_gloves_walk;
animationSprint = spr_gloves_sprint;
animationDash = spr_gloves_dash;
animationHit = spr_gloves_hit;
animationMelee = spr_gloves_melee;

meleeArcSprite = spr_melee_gloves;



drawX = x;
drawY = y;

reflection_object_setup(0,-1,image_index);

//Sound
//(Modders, these are just variations. You can repeat the same sound in all variables if you want to)
swingSound1 = sfx_gloves1;
swingSound2 = sfx_gloves2;
swingSound3 = sfx_gloves3;
swingSound4 = sfx_gloves4;
swingSound5 = sfx_gloves5;
swingSound6 = sfx_gloves6;
swingSound7 = sfx_gloves7;


//Keep these variables in just for consistency within weapons
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

projectile_speed = 0;
projectile_speed_decay = 0;
projectile_recoil = 4;
projectile_damage = meleeDamage;
projectile_range = 0;
projectile_power = 5;
projectile_piercing = 0;
crosshair_recoil = 0.25;

recoil_speed = 0;
recoil_return = 1.25;
recoil_current = 0;
recoil_max = 7;


