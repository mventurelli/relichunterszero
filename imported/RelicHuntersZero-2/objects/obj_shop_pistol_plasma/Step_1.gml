///Unlock and Draw Weapon

price = global.price_pistol_plasma;
weaponName = loc_key("WPNAME_PISTOLPLASMA");
name = weaponName;

if (unlock)
{
    global.unlock_pistol_plasma = 1;
    gun = obj_pistol_plasma;
    
    pickup_from_shop();
}
else event_inherited();

