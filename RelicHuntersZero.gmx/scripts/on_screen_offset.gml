///on_screen_offset(x,y,offset);
//Returns true if x,y position in room is currently being drawn

var toReturn = false;

if (argument0 - view_xview[0]+argument2 >= 0) 
    && (argument1 - view_yview[0]+argument2 >= 0) 
    && (argument0 <= view_xview[0] + view_wview[0]+argument2) 
    && (argument1 <= view_yview[0] + view_hview[0]+argument2)
    toReturn = true;

return toReturn;
