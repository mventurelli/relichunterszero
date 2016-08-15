///weapon_homing_update(targetObject,isEnemyProjectile);

var targetObject = argument0;
var isEnemyProjectile = argument1;

if (instance_exists(targetObject))
{
    if (curveRatio > curveRatioMin) curveRatio -= curveRatioDecay
    
    //Target Adjustment
    if (instance_exists(curveTarget))
    {
        var targetDir = point_direction(x,y,curveTarget.x,curveTarget.y);
        var angleDiff = angle_difference(direction,targetDir);
        if (abs(angleDiff) <= angleDiffMax) && (abs(angleDiff) > angleDiffMin)
        {
            var rotationDirection;
            if (angleDiff) rotationDirection = -1;
            else rotationDirection = 1;
                
            direction += rotationDirection * (curveRatio);
        }
    }
    else {
        if (isEnemyProjectile) curveTarget = instance_nearest(x,y,targetObject);
        else curveTarget = find_enemy_autoaim(x,y,direction,180,range);
    }
    
    if (speed > maxSpeed) speed = maxSpeed;
}
