///cmd_fire();
if instance_exists(owner)
{
    var p = owner.myPlayerId;
    var joy = global.input[p];
    
    if (ammo_current)
    {
            var shoot_direction    
            shoot_direction = point_direction(x,y,global.crosshairX[p],global.crosshairY[p]);
                        
            fire_burst_current++;
            ammo_current--;
            can_fire = false;
            
            repeat(fire_amount)
            {
                global.crosshair_scale[p] += crosshair_recoil;
            
                projectileX = x+(lengthdir_x(spawn_distance_from_barrel,shoot_direction));
                projectileY = y+(lengthdir_y(spawn_distance_from_barrel,shoot_direction));
                
                if (specialProjectile == K_PROJECTILE_BASIC) projectile = instance_create(projectileX,projectileY,obj_projectile_player);
                if (specialProjectile == K_PROJECTILE_ROCKET)  projectile = instance_create(projectileX,projectileY,obj_rocket);
                if (specialProjectile == K_PROJECTILE_FLAME)  projectile = instance_create(projectileX,projectileY,obj_flame);
                if (specialProjectile == K_PROJECTILE_SONIC)  projectile = instance_create(projectileX,projectileY,obj_sonicboom);
                
                projectile.speed = projectile_speed;
                projectile.decay = projectile_speed_decay;
                projectile.range = projectile_range;
                projectile.push_power = projectile_power;
                projectile.piercing = projectile_piercing;
                projectile.ammo_type = ammo_type;
                projectile.allowPrecision = allowPrecision;
                            
                var precision;
                            
                if (owner.aiming) precision = random_range(-accuracy_aiming*owner.base_accuracy,accuracy_aiming*owner.base_accuracy);
                else precision = random_range(-accuracy*owner.base_accuracy,accuracy*owner.base_accuracy);
                projectile.direction = shoot_direction+precision;
                            
                projectile.faction = f_player;
                projectile.type = shot_type;
                projectile.damage = projectile_damage;
            }
            
            add_screen_shake(shake_amount,shoot_direction+180,false);
            
            if (dropCasing) && (global.count_casings < global.max_casings)
            {
                casing = instance_create(x,y+16,fx_casing);
                casing.direction = shoot_direction+180+random_range(casing.dirMin,casing.dirMax);
                casing.ammo_type = ammo_type;
            }
            
            recoil_speed = projectile_recoil;
            
            //LOW AMMO CLICK
            if (ammo_current < (ammo*0.25)) audio_play(owner.audio_emitter,false,1,sfx_click);
            
            if (sound == 'pistol') 
            {
                if (fire_burst_current == 1) && (fire_burst > 1) audio_play(owner.audio_emitter,false,1,sfx_burstfire_start);
                audio_play(owner.audio_emitter,false,1,sfx_pistol,sfx_pistol,sfx_pistol);
                joy_rumble(joy,0.6,0.6);
            }
            
            if (sound = 'machinegun')
            {
                audio_play(owner.audio_emitter,false,1,sfx_burstfire_start);
                audio_play(owner.audio_emitter,false,1,sfx_pistol,sfx_pistol,sfx_pistol);
                joy_rumble(joy,0.55,0.55);
            }
            
            if (sound == 'shotgun')
            {
                audio_play(owner.audio_emitter,false,1,sfx_shotgun,sfx_shotgun,sfx_shotgun);
                joy_rumble(joy,1,1);
            }
            
            if (sound == 'sniper')
            {
                audio_play(owner.audio_emitter,false,1,sfx_sniper);
                joy_rumble(joy,1,1);
            }
            
            if (sound = 'smg')
            {
                audio_play(owner.audio_emitter,false,1,sfx_smg1,sfx_smg2,sfx_smg3,sfx_smg4,sfx_smg5);
                joy_rumble(joy,0.35,0.35);
            }
            if (sound = 'rocket')
            {
                audio_play(owner.audio_emitter,false,1,sfx_rocket_start);
                joy_rumble(joy,0.8,0.8);
            }
            if (sound == 'rifle') 
            {
                if (fire_burst_current == 1) && (fire_burst > 1) audio_play(owner.audio_emitter,false,1,sfx_burstfire_start);
                audio_play(owner.audio_emitter,false,1,sfx_rifle1,sfx_rifle2,sfx_rifle3);
                joy_rumble(joy,0.42,0.42);
            }
            if (sound == 'keytar')
            {
                audio_play(owner.audio_emitter,false,1,sfx_keyShot1,sfx_keyShot2,sfx_keyShot3,sfx_keyShot4);
                audio_play(owner.audio_emitter,false,1,sfx_keyMel1,sfx_keyMel2,sfx_keyMel3,sfx_keyMel4,sfx_keyMel5,sfx_keyMel6,sfx_keyMel7);
                joy_rumble(joy,0.6,0.6);
            }
            if (sound == 'plasma')
            {
                audio_play(owner.audio_emitter,false,1,sfx_plasma_start);
                //projectile.playLoop = true;
                //projectile.playLoopSound = sfx_plasma_loop; Removed because Müller thinks this is ugly :O
                joy_rumble(joy,0.6,0.6);
            }
    }
}
