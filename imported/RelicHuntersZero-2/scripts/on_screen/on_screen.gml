///on_screen(x,y);
//Returns true if x,y position in room is currently being drawn

var toReturn = false;

if (argument0 - __view_get( e__VW.XView, 0 ) >= 0) 
    && (argument1 - __view_get( e__VW.YView, 0 ) >= 0) 
    && (argument0 <= __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )) 
    && (argument1 <= __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ))
    toReturn = true;

return toReturn;
