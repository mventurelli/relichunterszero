///get_bbox_centerY(object)

var toReturn = -1;

if instance_exists(argument0)
{
    toReturn = argument0.bbox_top + ((argument0.bbox_bottom - argument0.bbox_top)/2);
}

return toReturn;
