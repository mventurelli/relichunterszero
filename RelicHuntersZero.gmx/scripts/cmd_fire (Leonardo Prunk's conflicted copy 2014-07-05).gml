///cmd_fire();
if (ammo_current)
{
        var shoot_direction    
        shoot_direction = point_direction(x,y,mouse_x,mouse_y);
                    
        fire_burst_current++;
        ammo_current--;
        can_fire = false;
              
        repeat(fire_amount)
        {
            global.crosshair_scale += crosshair_recoil;
        
            projectile = instance_create(x,y,obj_projectile_player);
            projectile.speed = projectile_speed;
            projectile.decay = projectile_speed_decay;
            projectile.range = projectile_range;
            projectile.push_power = projectile_power;
                        
            var precision;
                        
            if (owner.aiming) precision = random_range(-accuracy_aiming,accuracy_aiming);
            else precision = random_range(-accuracy,accuracy);
            projectile.direction = shoot_direction+precision;
                        
            projectile.faction = f_player;
            projectile.type = shot_type;
            projectile.damage = projectile_damage;
            
        }
        
        add_screen_shake(shake_amount,shoot_direction+180,false);
}
