//HP & death
if (hp <= 0) 
{
    global.playerAlive[myPlayerId] = false;
    corpse = instance_create_layer(x,y,"Interactive",fx_corpse_player);
    if (global.character[myPlayerId] == char_jimmy) corpse.sprite_index = spr_jimmy_death;
    else if (global.character[myPlayerId] == char_pinky) corpse.sprite_index = spr_pinky_death;
    else if (global.character[myPlayerId] == char_raff) corpse.sprite_index = spr_raff_death;
    else if (global.character[myPlayerId] == char_biu) corpse.sprite_index = spr_biu_death;
    else if (global.character[myPlayerId] == char_punny) corpse.sprite_index = spr_punny_death;
    else if (global.character[myPlayerId] == char_ass) corpse.sprite_index = spr_ass_death;
    else if (global.character[myPlayerId] == char_rider) corpse.sprite_index = spr_rider_death;
	
    instance_destroy();
}
else hp = round(hp);

///Crosshair Position & AutoAim
if (global.input[myPlayerId] == K_INPUT_KEYBOARD)
{
    global.crosshairX[myPlayerId] = mouse_x;
    global.crosshairY[myPlayerId] = mouse_y;
}

if (global.input[myPlayerId] != K_INPUT_KEYBOARD) && instance_exists(class_player) && instance_exists(myGun)
{
    var joy = global.input[myPlayerId];
    var autoAimAngle = global.autoAimAngle;

    var joyLookAngularVelocity, joyLookDeadzone, enemyDistance;
    
    joyLookDeadzone = 0.55;
    
    if (aiming)
    {
        joyLookAngularVelocity = 5;
        
        if (global.sticky_aim == true) && instance_exists(class_enemy)
        {
            if (collision_line(x, y, x+lengthdir_x(800,joyLookDirection), y+lengthdir_y(800,joyLookDirection), class_enemy, false, true))
            {
                joyLookAngularVelocity = 2;
            }
        }
        
        if (global.auto_aim != K_AUTOAIM_OFF)
        {
            targetEnemy = find_enemy_autoaim(x,y, joyLookTargetAngle, autoAimAngle, myGun.projectile_range );
            if (targetEnemy != noone)
            {
                joyAimLocked = true;
            }
        }
        
        if (joyAimLocked)
        {
            if (targetEnemy) && instance_exists_fast(targetEnemy)
            {
                joyLookDirection = autoaim_angle(x,y,targetEnemy);
                if (abs(angle_difference(joyLookDirection,joyLookTargetAngle) > autoAimAngle)) joyAimLocked = false;
            }
            else joyAimLocked = false;
        }
    }
    else
    {
        joyLookAngularVelocity = 30;
        joyAimLocked = false;
    }
    
    //Full Autoaim
    if (global.auto_aim == K_AUTOAIM_FULL)
        {
            autoAimAngle = 360;
            
            var candidate = find_enemy_autoaim(x,y, joyLookTargetAngle, autoAimAngle, myGun.projectile_range );
            if (targetEnemy != candidate)
            {
                global.crosshair_scale[myPlayerId] = 1.85;
                targetEnemy = candidate;
            }
               
            if (targetEnemy) && instance_exists_fast(targetEnemy)
            {
                var targetEnemyBBoxCenter = get_bbox_center(targetEnemy);
                var aimingX = targetEnemyBBoxCenter[0];
                var aimingY = targetEnemyBBoxCenter[1];
                    
                joyLookDirection = autoaim_angle(x,y,targetEnemy);  
                joyLookTargetAngle = joyLookDirection;
                joyCrosshairDistance = point_distance(x,y,aimingX,aimingY);
                joyAimLocked = true;
            }
            
            if (aiming) joyLookTargetAngle = joyLookDirection;
        }
    
    //Crosshair Distance Resolve
    
    joyIsRightStickAiming = joy_simple_deadzone( joy_x2pos(joy), joy_y2pos(joy), joyLookDeadzone);
    
    if (joyIsRightStickAiming) joyLookTargetAngle = point_direction(x,y,(x+joy_x2pos(joy)),(y+joy_y2pos(joy)));
    else if (!aiming) && (joy_simple_deadzone( joy_xpos(joy), joy_ypos(joy), joyLookDeadzone)) joyLookTargetAngle = point_direction(x,y,(x+joy_xpos(joy)),(y+joy_ypos(joy))); //Direction set by movement stick
        
    if (!joyAimLocked)
    {   
        joyLookDirection = angle_rotate(joyLookDirection, joyLookTargetAngle, joyLookAngularVelocity); 
    }
    
    if !(global.auto_aim == K_AUTOAIM_FULL && aiming)//joyAimLocked)
    {
        var joyAimVector = point_distance(0, 0, joy_x2pos(joy), joy_y2pos(joy) );
        if (joyIsRightStickAiming) joyCrosshairDistanceTarget = 320 * joyAimVector;
        else joyCrosshairDistanceTarget = joyCrosshairDistanceMin;
        
        if (joyCrosshairDistance != joyCrosshairDistanceTarget)
        {
            if (joyCrosshairDistance < joyCrosshairDistanceTarget) joyCrosshairDistance += min( joyCrosshairDistanceSpeed, abs(joyCrosshairDistanceTarget-joyCrosshairDistance) );
            else joyCrosshairDistance -= min( joyCrosshairDistanceSpeed, abs(joyCrosshairDistanceTarget-joyCrosshairDistance) );
        }
    }
        
    //Final Crosshair Position
    var targetCrossX = x + lengthdir_x(joyCrosshairDistance, joyLookDirection);
    var targetCrossY = y + lengthdir_y(joyCrosshairDistance, joyLookDirection);
    var targetCrossDir = point_direction(global.crosshairX[myPlayerId], global.crosshairY[myPlayerId], targetCrossX, targetCrossY);
    var targetCrossDist = point_distance(global.crosshairX[myPlayerId], global.crosshairY[myPlayerId], targetCrossX, targetCrossY);
    var targetSpeed = min(joyCrosshairSpeed, targetCrossDist);
    
    if (global.auto_aim == K_AUTOAIM_FULL) targetSpeed = targetCrossDist;
    
    global.crosshairX[myPlayerId] = global.crosshairX[myPlayerId] + lengthdir_x( targetSpeed , targetCrossDir);
    global.crosshairY[myPlayerId] = global.crosshairY[myPlayerId] + lengthdir_y( targetSpeed , targetCrossDir);
}




///Release Input Lock

if (inputLocked) {
    if (inputLockTimeCurrent < inputLockTime) inputLockTimeCurrent += delta_time;
    else {
        inputLocked = false;
        inputLockTimeCurrent = 0;
    }
}


// dynamic depth and scale
if (isDigging) 
{
    image_xscale = 1;
}