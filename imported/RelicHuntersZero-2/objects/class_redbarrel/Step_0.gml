///Explosive Projectile

event_inherited();

if (hp <= 0) && (!isExploding)
{
    hp = 0;
    isExploding = true;
    
    audio_play(audio_emitter,false,1,sfx_redbarrel_ignition);
    
    explosionDirection = hitDirection;
    
    //Target Search
    if (!targetSearch)
    {
        var enemyCount = instance_number(class_enemy);
        for (var i=0; i<enemyCount; i++)
        {
            var targetCandidate = instance_find(class_enemy,i);
            var targetDistance = point_distance(x,y,targetCandidate.x,targetCandidate.y);
            var targetAngleDiff = angle_difference(hitDirection, point_direction(x,y,targetCandidate.x,targetCandidate.y));
            
            if (targetDistance < curveDistanceMax) && (targetDistance > curveDistanceMin)
            {
                if (collision_line(x,y,targetCandidate.x,targetCandidate.y,obj_limit,false,true) < 0)
                {
                    ds_priority_add(targetList, targetCandidate.id, abs(targetAngleDiff));
                }
            }
        }

        if (!ds_priority_empty(targetList))
        {
            curveTarget = ds_priority_find_min(targetList);
        }
        
        targetSearch = true;
        if (instance_exists_fast(curveTarget)) explosionDirection = point_direction(x,y,curveTarget.x,curveTarget.y);
    }
    
        
    //Finding the point of emission
    var diffHorizontal = ((bbox_right - bbox_left)/2);
    var diffVertical = ((bbox_bottom - bbox_top)/2);
    
    var collisionX = bbox_left + diffHorizontal;
    var collisionY = bbox_top + diffVertical;
    
    var radius = min(diffHorizontal,diffVertical);
    
    emissionX = collisionX + lengthdir_x(radius,explosionDirection+180);
    emissionY = collisionY + lengthdir_y(radius,explosionDirection+180);
    
    ///Particle Ejection    
    smoke_system = part_system_create_layer(layer_get_id("Interactive_Over"),false);
    ds_map_add(global.particle_list,smoke_system,smoke_system);
    //part_system_depth( global.smoke_system, depth-999 );
    part_system_automatic_update(smoke_system, false);
    
    smoke_particle = part_type_create();
    ds_map_add(global.particle_type_list, smoke_particle, smoke_particle);
    part_type_shape(smoke_particle, pt_shape_square);
    part_type_size(smoke_particle, 0.1, 0.5, 0.05, 0);
    part_type_scale(smoke_particle,0.15,0.15);
    part_type_colour1(smoke_particle, c_white);
    part_type_alpha2(smoke_particle, 0.5, 0);
    part_type_speed(smoke_particle, 2, 4, -0.05, 0);
    part_type_direction(smoke_particle, (explosionDirection+180)-20,(explosionDirection+180)+20, 0, 5);
    part_type_gravity(smoke_particle, 0, 270);
    part_type_orientation(smoke_particle, 0, 0, 0, 0, 1);
    part_type_blend(smoke_particle, true);
    part_type_life(smoke_particle, room_speed*0.4, room_speed*0.7);
    
    smoke_emitter = part_emitter_create(smoke_system);
	ds_map_add(global.particle_emitter_list,smoke_emitter,smoke_system);
    part_emitter_region(smoke_system, smoke_emitter, emissionX-5, emissionX+5, emissionY-5, emissionY+5, ps_shape_ellipse, ps_distr_linear);
    part_emitter_burst(smoke_system, smoke_emitter, smoke_particle, 1);
}

if (isExploding)
{
    timeCurrent += delta_time;
    
    shake = 0.5*shake_max;
    
    if (timeCurrent >= timeToExplode)
    {
        audio_play_exclusive(audio_emitter,false,1,sfx_debris1,sfx_debris2,sfx_debris3);
    
        myProjectile = instance_create_layer(x+lengthdir_x(fakeMovement,explosionDirection),y+lengthdir_y(fakeMovement,explosionDirection),"Interactive",obj_redbarrel_projectile);
        myProjectile.direction = explosionDirection;
        
        myProjectile.speed_per_second = 0.4;
        myProjectile.decay = -0.15;
        myProjectile.range = 1000;
        myProjectile.push_power = 10;
        myProjectile.ammo_type = type_heavy;
        myProjectile.faction = f_player;
        myProjectile.damage = 350;
        
        instance_destroy();
    }
}

if (hp < instantExplosionThreshold)
{
    var explosion = instance_create_layer(x,y,"Interactive",fx_explosion_regular);
    explosion.radius = instantExplosionRadius;
	explosion.faction = f_all;
    instance_destroy();
}

/// Particle Effect

if (!global.pause) && (isExploding)
{
    emissionRate += emissionRateGrowth;
    
    emissionRateCurrent += emissionRate * delta_time * ms_to_s_60;
    if (emissionRateCurrent >= 1)
    {
        emissionRateCurrent = 0;
        part_emitter_burst(smoke_system, smoke_emitter, smoke_particle, 1);
    }
}

