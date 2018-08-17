///Unlock and Draw Weapon

price = global.price_shotgun_heavy;
weaponName = loc_key("WPNAME_SHOTGUN_HEAVY");
name = weaponName;

if (unlock)
{
    global.unlock_shotgun_heavy = 1;
    gun = obj_shotgun_heavy;
    
    pickup_from_shop();
}
else event_inherited();

