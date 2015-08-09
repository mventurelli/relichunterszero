///get_bbox_center_top_bottom(object)

var toReturn;

if instance_exists(argument0)
{
    toReturn[0] = argument0.bbox_left + ((argument0.bbox_right - argument0.bbox_left)/2);
    toReturn[1] = argument0.bbox_top + ((argument0.bbox_bottom - argument0.bbox_top)/2);
    toReturn[2] = argument0.bbox_top;
    toReturn[3] = argument0.bbox_bottom;
}
else
    toReturn[3] = 0;

return toReturn; 
