event_inherited();

sprite_index = spr_pickup_grenade;
name = loc_key("GENERAL_GRENADES");

//Hack HACKZ0r PLEASE FORGIVE ME, FUTURE ME
if (global.character[1] == char_biu) || (global.character[2] == char_biu) ammo = 2;
else ammo = 1;

if (global.relic_watchful_eye == 2) ammo++;

