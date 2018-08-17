///Sync price tier
event_inherited();

global.endPriceTier_grenades = priceTier;

///Hack: buy relic and try to buy grenade afterwards

if (global.relic_watchful_eye == 2){
    if (ammo == 1) ammo = 2;
    if (global.character[1] == char_biu) || (global.character[2] == char_biu) ammo = 3;
}

