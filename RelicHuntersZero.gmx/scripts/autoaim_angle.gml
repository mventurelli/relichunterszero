///autoaim_angle(myX,myY,target instance);

var xx, yy, target, toReturn;

xx = argument0;
yy = argument1;
target = argument2;
toReturn = -1;

var ctX = get_bbox_centerX(target);
var ctY = get_bbox_centerY(target);

var botX = get_bbox_bottomX(target);
var botY = get_bbox_bottomY(target) - 16;

var topX = get_bbox_topX(target);
var topY = get_bbox_topY(target) + 16;


if instance_exists(target)
{
    var collisionTestCenter = collision_line(xx,yy,ctX,ctY,class_solid,false,true);
    
    if (!collisionTestCenter)
    {
        toReturn = point_direction(xx,yy,ctX,ctY);
        return toReturn; 
    }
    
    var collisionTestBottom = collision_line(xx,yy,botX,botY,class_solid,false,true);
    
    if (!collisionTestBottom)
    {
        toReturn = point_direction(xx,yy,botX,botY);
        return toReturn;
    }
    
    var collisionTestTop = collision_line(xx,yy,topX,topY,class_solid,false,true);
    
    if (!collisionTestTop)
    {
        toReturn = point_direction(xx,yy,topX,topY);
        return toReturn;
    }
    
    //If you got to this point, just give up and cast towards the center
    toReturn = point_direction(xx,yy,ctX,ctY);
    return toReturn;
}
else
{
    show_debug_message('ERROR: Tried to autoaim to non-existing target '+string(target));
    return 0;
}

if (toReturn == -1)
{
    show_debug_message('ERROR: Failed while trying to autoaim to target '+string(target));
    return 0;
}
