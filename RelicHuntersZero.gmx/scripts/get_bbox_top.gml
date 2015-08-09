///get_bbox_top(object)

var toReturn;

if instance_exists(argument0)
{
    toReturn[0] = argument0.bbox_left + ((argument0.bbox_right - argument0.bbox_left)/2);
    toReturn[1] = argument0.bbox_top;
}
else
    toReturn[1] = 0;

return toReturn; 
