///Unlock and Draw Weapon

price = global.price_rocketlauncher;
weaponName = loc_key("WPNAME_ROCKETLAUNCHER");
name = weaponName;

if (unlock)
{
    global.unlock_rocketlauncher = 1;
    gun = obj_rocketlauncher;
    
    pickup_from_shop();
}
else event_inherited();

