///Type, Price, Amount

event_inherited();

priceTier = global.endPriceTier_lightAmmo;
priceArray = global.endPrice_lightAmmo;

ammo = 70;
ammoType = type_light;

if (global.relic_watchful_eye == 2) ammo = round(ammo * global.watchfulEyePickupBonus);

name = loc_key("GENERAL_SHOP_LIGHTAMMO");

