///Create new shotgun shells

repeat(10)
{
    if (faction == f_player) projectile = instance_create_layer(x,y,"Interactive",obj_projectile_player); 
    else projectile = instance_create_layer(x,y,"Interactive",obj_projectile_enemy); 
    
    projectile.damage = damage;
    projectile.speed_per_second = speed_per_second;
    projectile.decay = decay;
    projectile.range = range/2;
    projectile.push_power = push_power;
    projectile.piercing = piercing;
    projectile.bounce = true;
    projectile.bounceMax = 1;
    projectile.ammo_type = ammo_type;
    projectile.allowPrecision = allowPrecision;
    projectile.goesThroughWalls = goesThroughWalls;
    projectile.owner = owner;
    projectile.direction = random(360);
    projectile.faction = faction;
    projectile.type = type;
}

