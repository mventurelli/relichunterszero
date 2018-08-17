///Reflect

if (isActive) && (instance_exists(other))
{
    if (instance_exists(other.owner)) && (instance_exists(owner))
    {
        if (instance_exists(owner.owner))
        {
            if (other.owner.myPlayerId != owner.owner.myPlayerId)
            {   
                var newSpeed = other.speed_per_second;
                var newDirection = other.direction + 180 + random_range(reflectAngleMin,reflectAngleMax);
                var newDecay = other.decay;
                var newRange = other.range;
                var newPush = other.push_power;
                var newAmmoType = other.ammo_type;
                var newFaction = f_player;
                var newType = other.type;
                var newDamage = round(other.damage * reflectDamageMultiplier);
                
                newProjectile = instance_create_layer(other.x,other.y,"Interactive",obj_projectile_player);
                
                newProjectile.owner = owner.owner;
                newProjectile.speed_per_second = newSpeed;
                newProjectile.direction = newDirection;
                newProjectile.decay = newDecay;
                newProjectile.range = newRange;
                newProjectile.push_power = newPush;
                newProjectile.ammo_type = newAmmoType;
                newProjectile.faction = newFaction;
                newProjectile.type = newType;
                newProjectile.damage = newDamage;
                newProjectile.distance_travelled = 0;
                
                with (other) instance_destroy();
                
                animationTrigger = true;
            }
        }
    }
}

