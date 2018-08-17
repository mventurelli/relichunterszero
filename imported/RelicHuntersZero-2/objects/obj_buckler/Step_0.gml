///Animation & Movement

if (owner != noone)
{
    x = owner.x;
    y = owner.y;
    
    if (owner.animation_current == "idle")      sprite_index = spr_buckler_idle;
    else if (owner.animation_current == "walk")      sprite_index = spr_buckler_walk;
    else if (owner.animation_current == "sprint")    sprite_index = spr_buckler_sprint;
    else if (owner.animation_current == "dash")      sprite_index = spr_buckler_dash;
    else if (owner.animation_current == "hit")       sprite_index = spr_buckler_hit;
    else if (owner.animation_current == "melee")     sprite_index = spr_buckler_melee;
    
    image_speed = owner.animation_speed;
    image_xscale = owner.image_xscale;
    depth = owner.depth-1;
}
//else instance_destroy();


///Weapon Level
if (instance_exists_fast(myShieldObject)){
    if (!storeOriginalDamage) || (storeOriginalName == "") {
        projectile_damage = myShieldObject.reflectDamageMultiplier;
        weaponLevelBonus[0] = 0;
        weaponLevelBonus[1] = 0.25*projectile_damage;
        weaponLevelBonus[2] = 0.5*projectile_damage;
        weaponLevelBonus[3] = 0.75*projectile_damage;
        weaponLevelBonus[4] = 1.0*projectile_damage;
        weaponLevelBonus[5] = 1.25*projectile_damage;
        weaponLevelBonus[6] = 1.5*projectile_damage;
        weaponLevelBonus[7] = 1.75*projectile_damage;
        weaponLevelBonus[8] = 2*projectile_damage;
        weaponLevelBonus[9] = 3*projectile_damage;
        
        storeOriginalDamage = projectile_damage;
        storeOriginalName = name;
    }
    else {
        projectile_damage = storeOriginalDamage + weaponLevelBonus[weaponLevel];
        if (weaponLevel) name = storeOriginalName + " +" + string(weaponLevel);
        myShieldObject.reflectDamageMultiplier = projectile_damage;
    }
}

///Set Camera Distance When Zoomed
if (isActive) && instance_exists(controller_camera)
{
    controller_camera.weaponRange = 500;
}

