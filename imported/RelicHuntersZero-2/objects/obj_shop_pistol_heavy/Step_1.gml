///Unlock and Draw Weapon

price = global.price_pistol_heavy;
weaponName = loc_key("WPNAME_PISTOLHEAVY");
name = weaponName;
if (unlock)
{
    global.unlock_pistol_heavy = 1;
    gun = obj_pistol_heavy;
    
    pickup_from_shop();
}
else event_inherited();

