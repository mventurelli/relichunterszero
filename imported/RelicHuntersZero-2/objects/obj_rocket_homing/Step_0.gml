///Target Search + Adjustment

event_inherited();

var myTargetType = -1;
var isEnemy = true;

if (faction == f_enemy) myTargetType = class_player;
else if (faction == f_player)
{
    myTargetType = class_enemy;
    isEnemy = false;
}

weapon_homing_update(myTargetType,isEnemy);

/*

if (myTargetType != -1)
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
        if (faction == f_enemy) curveTarget = instance_nearest(x,y,myTargetType);
        else curveTarget = find_enemy_autoaim(x,y,direction,180,range);
    }
    
    if (speed > maxSpeed) speed = maxSpeed;
}

/* */
/*  */
