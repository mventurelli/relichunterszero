///Unlock and Draw Weapon

price = global.price_shotgun;
weaponName = loc_key("WPNAME_SHOTGUN");
name = weaponName;

if (unlock)
{
    global.unlock_shotgun = 1;
    gun = obj_shotgun;
    
    pickup_from_shop();
}
else event_inherited();

