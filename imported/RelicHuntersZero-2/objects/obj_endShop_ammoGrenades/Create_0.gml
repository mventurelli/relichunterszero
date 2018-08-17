///Type, Price, Amount

event_inherited();

priceTier = global.endPriceTier_grenades;
priceArray = global.endPrice_grenades;

ammoType = type_grenade;

//Hack HACKZ0r PLEASE FORGIVE ME, FUTURE ME
if (global.character[1] == char_biu) || (global.character[2] == char_biu) ammo = 2;
else ammo = 1;

if (global.relic_watchful_eye == 2) ammo+=1;

name = loc_key("GENERAL_GRENADES");

