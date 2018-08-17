///Reflect

if (defenseMode)
{
    if (other.owner != id)
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
        
		show_debug_message("kamitank reflect enemy projectile");
        newProjectile = instance_create_layer(other.x,other.y,"Interactive",obj_projectile_player);
        owner_add_owned_instance(newProjectile);
        newProjectile.speed_per_second = newSpeed;
        newProjectile.direction = newDirection;
        newProjectile.decay = newDecay;
        newProjectile.range = newRange;
        newProjectile.push_power = newPush;
        newProjectile.ammo_type = newAmmoType;
        newProjectile.faction = newFaction;
        newProjectile.type = newType;
        newProjectile.damage = newDamage;
        
        with (other) {
			scheduled_to_destroy = true;
		}
    }
}

