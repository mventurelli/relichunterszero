///Unlock and Draw Weapon

price = global.price_assault_rifle;
weaponName = loc_key("WPNAME_ASSAULT_RIFLE");
name = weaponName;

if (unlock)
{
    global.unlock_assault_rifle = 1;
    gun = obj_assault_rifle;
    
    pickup_from_shop();
}
else event_inherited();

