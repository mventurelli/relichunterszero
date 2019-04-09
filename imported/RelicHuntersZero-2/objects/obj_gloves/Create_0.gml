///Setup
event_inherited();

name = loc_key("WPNAME_GLOVES");
object = obj_gloves;

meleeDamage = 60;
meleeStepSpeed = 25;
maxHits = 5;
pushPower = 15;

animationIdle = spr_gloves_idle;
animationWalk = spr_gloves_walk;
animationSprint = spr_gloves_sprint;
animationDash = spr_gloves_dash;
animationHit = spr_gloves_hit;
animationMelee = spr_gloves_melee;

meleeArcSprite = spr_melee_gloves;

ammo_type = type_light;
ammo_cost = 1;
ammo = 0;
ammo_current = ammo;

rarity = K_RARITY_GLOVES;
