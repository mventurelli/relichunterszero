///Unlock and Draw Weapon

price = global.price_submachinegun;
weaponName = loc_key("WPNAME_SUBMACHINEGUN");
name = weaponName;

if (unlock)
{
    global.unlock_submachinegun = 1;
    gun = obj_submachinegun;
    
    pickup_from_shop();
}
else event_inherited();

