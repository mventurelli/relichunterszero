///What Is My Treasure?
event_inherited();

// Find Treasure Type
var treasureType = "WEAPON";
var treasureRarity = K_RARITY_COMMON;
var diceRoll = random(1);

var relicChance = 0.3;

var uncommonDropChance = 0.40;
var rareDropChance = 0.10;
var epicDropChance = 0.03;

priceCurrent = 250;
if (room == level_storm_2) priceCurrent = 750;
else if (room == level_storm_3) priceCurrent = 1250;
else if (room == level_storm_4) priceCurrent = 2000;

if (global.relic_rabbit_foot == 2) diceRoll -= 0.2;
diceRoll -= global.entropy;

if (diceRoll <= relicChance) { treasureType = "RELIC"; global.entropy = max(0,global.entropy-0.1); }

diceRoll = random(1);
if (global.relic_rabbit_foot == 2) diceRoll -= 0.2;
diceRoll -= global.entropy;

if (diceRoll <= epicDropChance) { treasureRarity = K_RARITY_EPIC; global.entropy = 0; }
else if (diceRoll <= rareDropChance) { treasureRarity = K_RARITY_RARE; global.entropy = max(0,global.entropy-0.1); }
else if (diceRoll <= uncommonDropChance) treasureRarity = K_RARITY_UNCOMMON;
else global.entropy += 0.1;


//Treasure
if (instance_exists(data_chestItemsStorm))
{
	if (treasureType == "WEAPON")
	{
	    if (ds_exists(data_chestItemsStorm.weapons[treasureRarity],ds_type_list)) 
		{
	        var list = data_chestItemsStorm.weapons[treasureRarity];
	        if (!ds_list_empty(list)) {
	            var randomPosition = irandom(ds_list_size(list)-1);
	            var weaponCandidate = ds_list_find_value(list,randomPosition);
	            if (weaponCandidate) spawnWeapon = weaponCandidate;
				ds_list_delete(list,randomPosition);
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
	else if (treasureType == "RELIC")
	{
	    if (ds_exists(data_chestItemsStorm.relics[treasureRarity],ds_type_list))  
		{
	        var list = data_chestItemsStorm.relics[treasureRarity];
	        if (!ds_list_empty(list)) 
			{
	            var randomPosition = irandom(ds_list_size(list)-1);
	            var relicCandidate = ds_list_find_value(list,randomPosition);
	            if (relicCandidate) spawnRelic = relicCandidate;
				ds_list_delete(list,randomPosition);
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
}
else show_debug_message("ERROR: obj_chestStorm found no Data object!");