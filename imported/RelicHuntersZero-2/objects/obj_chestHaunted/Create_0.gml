///What Is My Treasure?
event_inherited();

name = loc_key("INFO_HAUNTEDCHEST");
fxObject = fx_chestHaunted;
spawnChallenge = "CHALLENGE_HAUNTED";

spawnWeapon = noone;
    
var roll = random(100);

if (roll <= 30) { spawnWeapon = obj_pickup_spookyPistol; spawnSprite = spr_spooky_pistol; }
else if (roll <= 60) { spawnWeapon = obj_pickup_spooky_beamer; spawnSprite = spr_spooky_beamer; }
else if (roll <= 80) || (global.currentLoop = 0) { spawnWeapon = obj_pickup_spookyReaper; spawnSprite = spr_spooky_reaper; }
else { spawnWeapon = obj_pickup_sniper_ghost; spawnSprite = spr_sniper_ghost; }

