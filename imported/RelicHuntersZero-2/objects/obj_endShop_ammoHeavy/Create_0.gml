///Type, Price, Amount

event_inherited();

priceTier = global.endPriceTier_heavyAmmo;
priceArray = global.endPrice_heavyAmmo;

ammo = 70;
ammoType = type_heavy;

if (global.relic_watchful_eye == 2) ammo = (ammo * global.watchfulEyePickupBonus);

name = loc_key("GENERAL_SHOP_HEAVYAMMO");

