///autoaim_angle(myX,myY,target instance);

var xx, yy, target, toReturn;

xx = argument0;
yy = argument1;
target = argument2;
toReturn = -1;

if instance_exists(target)
{
    var collisionTestCenter = collision_line(xx,yy,get_bbox_centerX(target),get_bbox_centerY(target),class_solid,false,true);
    
    if (!collisionTestCenter)
    {
        toReturn = point_direction(xx,yy,get_bbox_centerX(target),get_bbox_centerY(target));
        return toReturn;
    }
    
    var collisionTestBottom = collision_line(xx,yy,get_bbox_bottomX(target),get_bbox_bottomY(target),class_solid,false,true);
    
    if (!collisionTestBottom)
    {
        toReturn = point_direction(xx,yy,get_bbox_bottomX(target),get_bbox_bottomY(target));
        return toReturn;
    }
    
    var collisionTestTop = collision_line(xx,yy,get_bbox_topX(target),get_bbox_topY(target),class_solid,false,true);
    
    if (!collisionTestTop)
    {
        toReturn = point_direction(xx,yy,get_bbox_topX(target),get_bbox_topY(target));
        return toReturn;
    }
    
    //If you got to this point, just give up and cast towards the center
    toReturn = point_direction(xx,yy,get_bbox_centerX(target),get_bbox_centerY(target));
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