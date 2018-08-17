///Self-Activation

event_inherited();

if (!timedActive) isActive = false;

if (global.alwaysShowAmmo) isActive = true;

if (room == room_endShop) isActive = true;

//timedActivated by pickup_ammo and by class_player reload

