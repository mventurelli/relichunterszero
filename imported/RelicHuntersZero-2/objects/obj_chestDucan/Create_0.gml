///What Is My Treasure?
event_inherited();

name = loc_key("INFO_DUCANCHEST");
fxObject = fx_chestDucan;
spawnChallenge = "CHALLENGE_HUNTED";

spawnWeapon = noone;
    
var roll = random(100);

if (roll <= 40) { spawnWeapon = obj_pickup_ducan_rifle; spawnSprite = spr_ducan_rifle; }
else if (roll <= 80) { spawnWeapon = obj_pickup_ducan_shotgun; spawnSprite = spr_ducan_shotgun; }
else { spawnWeapon = obj_pickup_ducan_plasma; spawnSprite = spr_ducan_plasma; }



