///Self-Activation

event_inherited();

if (!timedActive) isActive = false;

if (room==room_start) || (room==room_shop) || (room==room_endShop) || (global.pauseMenu)
{
    isActive = true;
}

if (global.gameMode == gamemode_endless) || (global.gameMode == gamemode_storm) sprite_index = spr_dynamic_bountyScrap;

//Also timedActivated by the pickup_coin


