///Unlock and Draw Weapon

weaponName = loc_key("WPNAME_PISTOLASSAULT");
price = global.price_pistol_assault;
name = weaponName;

if (unlock)
{
    global.unlock_pistol_assault = 1;
    gun = obj_pistol_assault;
    
    pickup_from_shop();
}
else event_inherited();

