///Relic Buffs, Weapon Level & Challenges

//Dev Potion
if (global.relic_dev_potion == 2)
{
    if ammo_current < ammo
    {
        ammo_regen_time_current += delta_time*2;
        if ammo_regen_time_current >= (ammo_regen_time*ammo_cost)
        {
            ammo_current += ammo_regen_amount;
            ammo_regen_time_current = 0;
        }
    }
    else ammo_regen_time_current = 0;
}

//Weapon Level
if (!storeOriginalDamage) || (storeOriginalName == "") {
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
    projectile_damage = ceil(storeOriginalDamage + weaponLevelBonus[weaponLevel]);
    if (weaponLevel) name = storeOriginalName + " +" + string(weaponLevel);
}

//Challenges

if global.challengeThirst && (!ammoCostDebuff){
    ammo_cost += ammo_cost*global.challengeThirstMultiplier;
    ammoCostDebuff = true;
}

///Owner Accuracy Update

if instance_exists(owner)
{
    if (isActive)
    {
        if (weaponClass == "undefined") owner.base_accuracy = 1;
        else if (weaponClass == "pistol") owner.base_accuracy = owner.accPistol;
        else if (weaponClass == "machinegun") owner.base_accuracy = owner.accMachinegun;
        else if (weaponClass == "shotgun") owner.base_accuracy = owner.accShotgun;
        else if (weaponClass == "sniper") owner.base_accuracy = owner.accSniper;
        else if (weaponClass == "smg") owner.base_accuracy = owner.accSmg;
        else if (weaponClass == "rocket") owner.base_accuracy = owner.accRocket;
        else if (weaponClass == "rifle") owner.base_accuracy = owner.accRifle;
        
        //show_debug_message('I am a '+sound+' and my owner acc is '+string(owner.base_accuracy));
    }
}

