///Type, Price, Amount

event_inherited();

priceTier = global.endPriceTier_mediumAmmo;
priceArray = global.endPrice_mediumAmmo;

ammo = 70;
ammoType = type_medium;

if (global.relic_watchful_eye == 2) ammo = round(ammo * global.watchfulEyePickupBonus);

name = loc_key("GENERAL_SHOP_MEDIUMAMMO");

