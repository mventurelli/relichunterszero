///get_bbox_center(object)

var toReturn;

if instance_exists(argument0)
{
    toReturn[0] = argument0.bbox_left + ((argument0.bbox_right - argument0.bbox_left)/2);
    toReturn[1] = argument0.bbox_top + ((argument0.bbox_bottom - argument0.bbox_top)/2);
}
else
    toReturn[1] = -1;

return toReturn; 
