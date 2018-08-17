///is_mouse_over(object)
//find out if the mouse is over this object

toReturn = false;
target = argument0;

targetLeft = target.bbox_left;
targetRight = target.bbox_right;
targetTop = target.bbox_top;
targetBottom = target.bbox_bottom;

if (mouse_x > targetLeft) && (mouse_x < targetRight) && (mouse_y > targetTop) && (mouse_y < targetBottom)
{
    toReturn = true;
}

return toReturn;
