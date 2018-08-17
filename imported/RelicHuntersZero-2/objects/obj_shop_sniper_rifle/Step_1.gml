///Unlock and Draw Weapon

price = global.price_sniper_rifle;
weaponName = loc_key("WPNAME_SNIPERRIFLE");
name = weaponName;

if (unlock)
{
    global.unlock_sniper_rifle = 1;
    gun = obj_sniper_rifle;
    
    pickup_from_shop();
}
else event_inherited();

