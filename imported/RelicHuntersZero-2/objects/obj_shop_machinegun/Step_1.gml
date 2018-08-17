///Unlock and Draw Weapon

price = global.price_machinegun;
weaponName = loc_key("WPNAME_MACHINEGUN");
name = weaponName;

if (unlock)
{
    global.unlock_machinegun = 1;
    gun = obj_machinegun;
    
    pickup_from_shop();
}
else event_inherited();

