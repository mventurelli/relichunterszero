///find_enemy_autoaim(x,y,aiming angle,max angle, max range)
//Requires the global.precisionDistance variable to normalize

var xx = argument0;
var yy = argument1;
var aimAngle = argument2;
var maxAngle = argument3;
var maxRange = argument4;

toReturn = -1;

var priorityList = ds_priority_create();

if instance_exists(class_enemy)
{
    var enemyCount = instance_number(class_enemy);
    
    var i, testEnemy, testDistance, testAngle;
    
    for (i=0; i<enemyCount; i++)
    {
        testEnemy = instance_find(class_enemy,i);
        
        testDistance = point_distance(xx, yy, get_bbox_centerX(testEnemy), get_bbox_centerY(testEnemy));
        if (testDistance > maxRange) continue;
        
        testAngle = point_direction(xx+lengthdir_x(testDistance-global.precisionDistance,aimAngle),yy+lengthdir_y(testDistance-global.precisionDistance,aimAngle),get_bbox_centerX(testEnemy), get_bbox_centerY(testEnemy));

        if testAngle <= maxAngle
        {
            show_debug_message('Auto-Aim Target found! Aim is '+string(aimAngle)+',Enemy is '+ string(point_direction(xx, yy, get_bbox_centerX(testEnemy), get_bbox_centerY(testEnemy)))+'And difference is '+string(testAngle));
            ds_priority_add(priorityList, testEnemy, testAngle);
        }
    }
    
    var tacticalCount = instance_number(class_tactical_target);
    
    for (i=0; i<tacticalCount; i++)
    {
        testEnemy = instance_find(class_tactical_target,i);
        
        testDistance = point_distance(xx, yy, get_bbox_centerX(testEnemy), get_bbox_centerY(testEnemy))
        if (testDistance > maxRange) continue;
        
        testAngle = point_direction(xx+lengthdir_x(testDistance-global.precisionDistance,aimAngle),yy+lengthdir_y(testDistance-global.precisionDistance,aimAngle),get_bbox_centerX(testEnemy), get_bbox_centerY(testEnemy));
        if testAngle <= maxAngle
        {
            ds_priority_add(priorityList, testEnemy, testAngle);
        }
    }
    
    if !ds_priority_empty(priorityList)
    {
        toReturn = ds_priority_find_min(priorityList);
    }
}

ds_priority_destroy(priorityList);
return toReturn;
