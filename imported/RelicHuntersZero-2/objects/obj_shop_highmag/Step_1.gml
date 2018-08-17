///Unlock and Draw Weapon

price = global.price_highmag;
weaponName = loc_key("WPNAME_HIGHMAG");
name = weaponName;

if (unlock)
{
    global.unlock_highmag = 1;
    gun = obj_highmag;
    
    pickup_from_shop();
}
else event_inherited();

