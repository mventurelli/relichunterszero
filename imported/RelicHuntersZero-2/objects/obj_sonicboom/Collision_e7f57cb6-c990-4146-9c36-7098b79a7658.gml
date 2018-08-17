///Reflect

if instance_exists(other)
{
    projectile = instance_create_layer(other.x,other.y,"Interactive",obj_projectile_player);

    projectile.speed_per_second = other.speed_per_second;
    projectile.direction = -other.direction
    projectile.decay = other.decay;
    projectile.range = other.range;
    projectile.push_power = 4;
    projectile.ammo_type = other.ammo_type;
    projectile.faction = f_player;
    projectile.type = other.type;
    projectile.damage = other.damage;
    
    with (other)
    {
        instance_destroy();
    }
}

