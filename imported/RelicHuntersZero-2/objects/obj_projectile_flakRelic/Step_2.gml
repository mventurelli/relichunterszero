///Create brothers

event_inherited();

if (!hasSpawnedBrothers)
{
    var angleDiff = 20;
    repeat(2){ 
        var brother = instance_create_layer(x,y,"Interactive",obj_projectile_flakRelic);
        brother.hasSpawnedBrothers = true;
        
        brother.damage = damage;
        brother.speed_per_second = speed_per_second;
        brother.decay = decay;
        brother.range = range/2;
        brother.push_power = push_power;
        brother.piercing = piercing;
        brother.bounce = true;
        brother.bounceMax = 1;
        brother.ammo_type = ammo_type;
        brother.allowPrecision = allowPrecision;
        brother.goesThroughWalls = goesThroughWalls;
        brother.owner = owner;
        brother.direction = direction + angleDiff;
        brother.faction = faction;
        brother.type = type;
        
        angleDiff = -20;
    }
    
    hasSpawnedBrothers = true;
}

