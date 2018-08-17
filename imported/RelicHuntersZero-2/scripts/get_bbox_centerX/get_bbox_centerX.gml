///get_bbox_centerX(object)

var toReturn = -1;

if instance_exists(argument0)
{
    toReturn = argument0.bbox_left + ((argument0.bbox_right - argument0.bbox_left)/2);
}

return toReturn;
