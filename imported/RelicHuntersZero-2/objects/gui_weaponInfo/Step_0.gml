///Update Attributes
if (myWeapon) && instance_exists(myWeapon)
{
    myName = myWeapon.name;
    mySprite = myWeapon.sprite_index;
    myDamage = myWeapon.projectile_damage;
    myRange = myWeapon.projectile_range;
    myCapacity = myWeapon.ammo;
    myAmmoType = myWeapon.ammo_type;
    myAmmoCost = myWeapon.ammo_cost;
    myImpact = myWeapon.projectile_power;
    myRate = myWeapon.fire_rate;
    myReload = (myWeapon.reload_time/room_speed);
    myBurst = myWeapon.fire_burst;
    myPiercing = myWeapon.projectile_piercing;
}



