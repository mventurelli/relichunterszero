/// Pause-Controlled Movement

if (!global.pause)
{
    //Speed Reset After Pause
    if (speed_reset)
    {
        speed = old_speed;
        speed_reset = false;
    }
    
    //Target Search
    if (!targetSearch)
    {
        var enemyCount = instance_number(class_enemy);
        for (var i=0; i<enemyCount; i++)
        {
            var targetCandidate = instance_find(class_enemy,i);
            var targetDistance = point_distance(x,y,targetCandidate.x,targetCandidate.y);
            var targetAngleDiff = angle_difference(direction, point_direction(x,y,targetCandidate.x,targetCandidate.y));
            
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
    }
    
    //Target Adjustment
    if (instance_exists_fast(curveTarget))
    {
        var targetDir = point_direction(x,y,curveTarget.x,curveTarget.y);
        var angleDiff = angle_difference(direction,targetDir);
        if (abs(angleDiff) <= angleDiffMax) && (abs(angleDiff) > angleDiffMin)
        {
            var rotationDirection;
            if (angleDiff) rotationDirection = -1;
            else rotationDirection = 1;
            
            direction += rotationDirection * (speed*curveRatio);
        }
    }
    
    //Movement
    image_angle = direction;
    speed -= decay;
    if speed < 5 speed = 5;
    
    
    //Particle Emission
    var diffHorizontal = ((bbox_right - bbox_left)/2);
    var diffVertical = ((bbox_bottom - bbox_top)/2);
    
    var collisionX = bbox_left + diffHorizontal;
    var collisionY = bbox_top + diffVertical;
    
    var radius = min(diffHorizontal,diffVertical) - 15;
    
    var emissionX = collisionX + lengthdir_x(radius,direction+180);
    var emissionY = collisionY + lengthdir_y(radius,direction+180);
    
    //part_system_depth(global.smoke_trail,depth+1);
    part_type_direction(smoke_particle, (direction+180)-20,(direction+180)+20, 0, 5);
    part_emitter_region(smoke_system, smoke_emitter, emissionX-5, emissionX+5, emissionY-5, emissionY+5, ps_shape_ellipse, ps_distr_linear);
    part_emitter_burst(smoke_system, smoke_emitter, smoke_particle, 1);
    
    
    //Shake
    if shake > shake_max shake = shake_max;
         
    drawX = x+lengthdir_x(shake,shake_direction);
    drawY = y+lengthdir_y(shake,shake_direction);
        
    shake += shake_per_step;
    shake_direction = irandom(359);
}
else if (speed_reset == false)
{
    old_speed = speed;
    speed = 0;
    speed_reset = true;
}

///Audio
audio_emitter_position(audio_emitter, x, y, 0);

///Invulnerable

if (isInvulnerable)
{
    invulnerableTime += delta_time;
    if (invulnerableTime >= invulnerableDuration) isInvulnerable = false;

}

///Explode
if (explode)
{
    var explosion = instance_create_layer(x,y,"Interactive",fx_explosion_regular);
    explosion.radius = detonationRadius;
    explosion.damage = 300;
    
    instance_destroy();
}







