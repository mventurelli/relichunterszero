event_inherited();
sprite_index = spr_pickup_light;
ammo = 70;
name = loc_key("GENERAL_LIGHTAMMO");

if (global.relic_watchful_eye == 2) ammo = round(ammo * global.watchfulEyePickupBonus);

