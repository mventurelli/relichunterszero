///Weapon Level
if (owner != noone){
    if (!storeOriginalDamage) || (storeOriginalName == "") {

        weaponLevelBonus[0] = 0;
        weaponLevelBonus[1] = 0.25*meleeDamage;
        weaponLevelBonus[2] = 0.5*meleeDamage;
        weaponLevelBonus[3] = 0.75*meleeDamage;
        weaponLevelBonus[4] = 1.0*meleeDamage;
        weaponLevelBonus[5] = 1.25*meleeDamage;
        weaponLevelBonus[6] = 1.5*meleeDamage;
        weaponLevelBonus[7] = 1.75*meleeDamage;
        weaponLevelBonus[8] = 2*meleeDamage;
        weaponLevelBonus[9] = 3*meleeDamage;
        
        storeOriginalDamage = meleeDamage;
        storeOriginalName = name;
    }
    else {
        meleeDamage = round(storeOriginalDamage + weaponLevelBonus[weaponLevel]);
        if (weaponLevel) name = storeOriginalName + " +" + string(weaponLevel);
        
        damage = owner.melee_damage + meleeDamage;
        projectile_damage = damage;
    }


///Animation & Movement

    x = owner.x;
    y = owner.y;
    
    if (owner.animation_current == "idle")      sprite_index = animationIdle;
    else if (owner.animation_current == "walk")      sprite_index = animationWalk;
    else if (owner.animation_current == "sprint")    sprite_index = animationSprint;
    else if (owner.animation_current == "dash")      sprite_index = animationDash;
    else if (owner.animation_current == "hit")       sprite_index = animationHit;
    else if (owner.animation_current == "melee")     sprite_index = animationMelee;
    
    image_speed = owner.animation_speed;
    image_xscale = owner.image_xscale;
    depth = owner.depth-1;
}

///Set Camera Distance When Zoomed
if (isActive) && instance_exists(controller_camera)
{
    controller_camera.weaponRange = 500;
}

