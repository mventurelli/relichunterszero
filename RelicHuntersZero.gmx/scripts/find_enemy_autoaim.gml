///find_enemy_autoaim(x,y,aiming angle,max angle, max range)

toReturn = -1;

var priorityList = ds_priority_create();

if instance_exists(class_enemy)
{
    var enemyCount = instance_number(class_enemy);
    
    var i, testEnemy, testDistance, testAngle;
    
    for (i=0; i<enemyCount; i++)
    {
        testEnemy = instance_find(class_enemy,i);
        
        testDistance = point_distance(argument0, argument1, get_bbox_centerX(testEnemy), get_bbox_centerY(testEnemy))
        if (testDistance > argument4) continue;
        
        testAngle = abs( angle_difference( argument2, point_direction(argument0, argument1, get_bbox_centerX(testEnemy), get_bbox_centerY(testEnemy)) ));
        if testAngle <= argument3
        {
            ds_priority_add(priorityList, testEnemy, testAngle);
        }
    }
    
    var tacticalCount = instance_number(class_tactical_target);
    
    for (i=0; i<enemyCount; i++)
    {
        testEnemy = instance_find(class_tactical_target,i);
        
        testDistance = point_distance(argument0, argument1, get_bbox_centerX(testEnemy), get_bbox_centerY(testEnemy))
        if (testDistance > argument4) continue;
        
        testAngle = abs( angle_difference( argument2, point_direction(argument0, argument1, get_bbox_centerX(testEnemy), get_bbox_centerY(testEnemy)) ));
        if testAngle <= argument3
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