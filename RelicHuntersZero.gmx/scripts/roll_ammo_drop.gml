///roll_ammo_drop(x,y);
//Rolls chance to drop ammo and drop it on the coordinates

var dropX = argument0;
var dropY = argument1;

var dropsMin = 2;
var dropsMax = 4;

var actualChanceLight = global.ammoDropChanceLight;
var actualChanceMedium = global.ammoDropChanceMedium;
var actualChanceHeavy = global.ammoDropChanceHeavy;


// Check Player State and Modify Drop Chances Accordingly
var p = 1;
var playerInstanceNumber = 0;
while (p <= global.playerCount)
{
    if (global.playerAlive[p])
    {
        var hasLight = false;
        var hasMedium = false;
        var hasHeavy = false;
        
        var playerInstanceCount = instance_number(class_player);
        var curPlayer = instance_find(class_player,playerInstanceNumber);
        
        if (curPlayer) && instance_exists(curPlayer)
        {
            var playerId = curPlayer.myPlayerId;
            
            if instance_exists(curPlayer.weapon1)
            {
                if (curPlayer.weapon1.ammo_type == type_light) hasLight = true;
                else if (curPlayer.weapon1.ammo_type == type_medium) hasMedium = true;
                else if (curPlayer.weapon1.ammo_type == type_heavy) hasHeavy = true;
            }
        
            if instance_exists(curPlayer.weapon2)
            {
                if (curPlayer.weapon2.ammo_type == type_light) hasLight = true;
                else if (curPlayer.weapon2.ammo_type == type_medium) hasMedium = true;
                else if (curPlayer.weapon2.ammo_type == type_heavy) hasHeavy = true;
            }
        }
        
        var empty = true;
        
        if (hasLight)
        {
            actualChanceLight += global.ammoDropEquippedBonus;
            var ammo = (global.ammo_light[p] / global.ammo_light_max)
            if (ammo != 0)
            {
                if (ammo < global.ammoDropLowThreshold) actualChanceLight += global.ammoDropLowBonus;
                empty = false;
            }
        }
        
        if (hasMedium)
        {
            actualChanceMedium += global.ammoDropEquippedBonus;
            var ammo = (global.ammo_medium[p] / global.ammo_medium_max)
            if (ammo != 0)
            {
                if (ammo < global.ammoDropLowThreshold) actualChanceMedium += global.ammoDropLowBonus;
                empty = false;
            }
        }
        
        if (hasHeavy)
        {
            actualChanceHeavy += global.ammoDropEquippedBonus;
            var ammo = (global.ammo_heavy[p] / global.ammo_heavy_max)
            if (ammo != 0)
            {
                if (ammo < global.ammoDropLowThreshold) actualChanceHeavy += global.ammoDropLowBonus;
                empty = false;
            }
        }

        //Special case: if both equipped weapons are empty, chance is 100%
        if (empty)
        {
            if (hasLight) actualChanceLight = 1;
            if (hasMedium) actualChanceMedium = 1;
            if (hasHeavy) actualChanceHeavy = 1;
        }
        
        p++;
        playerInstanceNumber++;
    }
}

// Test drop chances and drop
if (random(1) <= actualChanceLight) repeat(irandom_range(dropsMin,dropsMax))
{ 
    drop = instance_create(dropX,dropY,obj_pickup_ammo); 
    drop.ammoType = type_light;
}

if (random(1) <= actualChanceMedium) repeat(irandom_range(dropsMin,dropsMax))
{ 
    drop = instance_create(dropX,dropY,obj_pickup_ammo); 
    drop.ammoType = type_medium;
}

if (random(1) <= actualChanceHeavy) repeat(irandom_range(dropsMin,dropsMax))
{ 
    drop = instance_create(dropX,dropY,obj_pickup_ammo); 
    drop.ammoType = type_heavy;
}
