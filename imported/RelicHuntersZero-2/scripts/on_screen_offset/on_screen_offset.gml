///on_screen_offset(x,y,offset);
//Returns true if x,y position in room is currently being drawn

var toReturn = false;

if (argument0 - __view_get( e__VW.XView, 0 )+argument2 >= 0) 
    && (argument1 - __view_get( e__VW.YView, 0 )+argument2 >= 0) 
    && (argument0 <= __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+argument2) 
    && (argument1 <= __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+argument2)
    toReturn = true;

return toReturn;
