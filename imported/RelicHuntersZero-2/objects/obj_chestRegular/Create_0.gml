///What Is My Treasure?
event_inherited();

// Find Treasure Type
var treasureType = "NADA";
var diceRoll = random(1);
var weaponChance = 1;
var coinChance = 0.6;
var relicChance = 0.35;
var rareWeaponChance = 0.1;
var rareRelicChance = 0.04;

if (global.relic_rabbit_foot == 2) diceRoll -= 0.2;
diceRoll -= global.entropy;

if (diceRoll <= rareRelicChance) { treasureType = "RELIC_RARE"; global.entropy = 0; }
else if (diceRoll <= rareWeaponChance) { treasureType = "WEAPON_RARE"; global.entropy = 0; }
else if (diceRoll <= relicChance) treasureType = "RELIC";
else if (diceRoll <= coinChance) treasureType = "COINS";
else treasureType = "WEAPON";

// debug
treasureType = "WEAPON";

// Find Treasure Tier
var treasureTier = 1;
if  (room==level2_1) || (room==level2_2) || (room==level2_3) || 
    (room==level3_1) || (room==level3_2) || (room==level3_3) {
        treasureTier=2;  
}

if  (room==level4_1) || (room==level4_2) || (room==level4_3) {
        treasureTier=3;  
}

//Bonuses & Normalization
if (treasureType == "RELIC_RARE") || (treasureType == "WEAPON_RARE") treasureTier++;
treasureTier += global.currentLoop;
treasureTier = min(treasureTier,3);

//Treasure: Coins
if (treasureType == "COINS")
{
    spawnCoins = 10 * treasureTier;
    exit;
}

//Treasure: Weapon
if (treasureType == "WEAPON") || (treasureType == "WEAPON_RARE") 
{
    var data = instance_create_layer(0,0,"Interactive",data_chestItems);
    if (ds_exists(data.weapons[treasureTier],ds_type_list)) {

        var list = data.weapons[treasureTier];
        if (!ds_list_empty(list)) {
            var randomPosition = irandom(ds_list_size(list)-1);
            var weaponCandidate = ds_list_find_value(list,randomPosition);
            if (weaponCandidate) spawnWeapon = weaponCandidate;
        }
    }
    
    //Find the sprite
    if (spawnWeapon != noone){	
		
        var spawnToTest = instance_create_layer(0,0,"Interactive",spawnWeapon);		
		if (spawnToTest.isMod == false) {
	        spawnSprite = spawnToTest.sprite_index;
		}
        with (spawnToTest) instance_destroy();
    }
    exit;
}

//Treasure: Relic
if (treasureType == "RELIC") || (treasureType == "RELIC_RARE") 
{
    var data = instance_create_layer(0,0,"Interactive",data_chestItems);
    if (ds_exists(data.relics[treasureTier],ds_type_list)) {
        var list = data.relics[treasureTier];
        if (!ds_list_empty(list)) {
            var randomPosition = irandom(ds_list_size(list)-1);
            var relicCandidate = ds_list_find_value(list,randomPosition);
            if (relicCandidate) spawnRelic = relicCandidate;
        }
    }
    
    //Find the sprite
    if (spawnRelic != noone){
        var spawnToTest = instance_create_layer(0,0,"Interactive",spawnRelic);
        spawnSprite = spawnToTest.sprite_index;
        with (spawnToTest) instance_destroy();
    }
    exit;
}
