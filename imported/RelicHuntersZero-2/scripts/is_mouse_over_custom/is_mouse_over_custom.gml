///is_mouse_over_custom(leftX,rightX,topY,bottomY)
//find out if the mouse is over this object

toReturn = false;

targetLeft = argument0;
targetRight = argument1;
targetTop = argument2;
targetBottom = argument3;

if (mouse_x > targetLeft) && (mouse_x < targetRight) && (mouse_y > targetTop) && (mouse_y < targetBottom)
{
    toReturn = true;
}

return toReturn;
